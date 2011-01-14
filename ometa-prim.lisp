(in-package :ometa)
(declaim (optimize (safety 3) (debug 3)))
;; (declaim (optimize (speed 3) (debug 1) (safety 1)))

(defclass ometa-input-stream () ((input-array :initarg :input-array :accessor input-array)
				 (input-position :initform 0 :accessor input-position)
                                 (max-input-position :initform 0 :accessor max-input-position)
				 (mark-stack :initform nil :accessor mark-stack)))

(defmethod read-next ((o ometa-input-stream))
  (let ((v (aref (input-array o) (input-position o))))
    (incf (the fixnum (input-position o)))
    (setf (max-input-position o) (the fixnum (max (the fixnum (max-input-position o)) (the fixnum (input-position o)))))
    v))

(defmethod at-end-p ((o ometa-input-stream))
  (= (the fixnum (input-position o)) (length (the simple-array (input-array o))) ))

(defmethod mark ((o ometa-input-stream))
  (push (input-position o) (mark-stack o)))

(defmethod reset-to-mark ((o ometa-input-stream))
  (setf (input-position o) (first (mark-stack o))))

(defmethod pop-mark ((o ometa-input-stream))
  (pop (mark-stack o)))

(defmethod reset-and-pop-mark ((o ometa-input-stream))
  (reset-to-mark o)
  (pop-mark o))

(defvar *trace* nil)
(defvar *ignore-count* nil)
(defvar *enable-trace-p* nil)
(defvar *stack* nil)
(defvar *call-nr* nil)

(defun invoke-with-parser-environment (fn)
  (let ((*stack* nil)
        (*trace* *trace*)
        (*call-nr* 0))
    (ometa::init-memo)
    (multiple-value-call #'values (funcall fn) *call-nr*)))

(defmacro with-parser-environment (() &body body)
  `(invoke-with-parser-environment (lambda () ,@body)))

(defmethod parse-input-file ((parser ometa::ometa) (file-name string))
    (with-parser-environment ()
      (let* ((input (with-open-file (file file-name :direction :input)
                      (let ((s (make-array (file-length file))))
                        (read-sequence s file)
                        s)))
             (input-stream (make-instance 'ometa:ometa-input-stream :input-array input)))
        (setf (input-stream parser) input-stream)
        (values (ometa-apply parser 'grammar nil) (max-input-position input-stream)))))

(defmethod parse-input-string ((parser ometa::ometa) (input string))
    (with-parser-environment ()
      (let ((input-stream (make-instance 'ometa:ometa-input-stream :input-array input)))
        (setf (input-stream parser) input-stream)
        (values (ometa-apply parser 'grammar nil) (max-input-position input-stream)))))

(defclass ometa-list-input-stream () ((input-list :initarg :input-list :accessor input-list)
				      (mark-stack :initform nil :accessor mark-stack)))

(defmethod read-next ((o ometa-list-input-stream))
  (let ((v (car (input-list o))))
    (setf (input-list o) (cdr (input-list o)))
    v))

(defmethod at-end-p ((o ometa-list-input-stream))
  (null (input-list o)))

(defmethod mark ((o ometa-list-input-stream))
  (push (input-list o) (mark-stack o)))

(defmethod reset-to-mark ((o ometa-list-input-stream))
  (setf (input-list o) (car (mark-stack o))))

(defmethod pop-mark ((o ometa-list-input-stream))
  (pop (mark-stack o)))

(defmethod reset-and-pop-mark ((o ometa-list-input-stream))
  (reset-to-mark o)
  (pop-mark o))

(defclass ometa-prim ()
  ((input-stream :accessor input-stream :initarg :input-stream)))

(defvar o-fail (list 'o-fail-object))
(defun o-fail? (x)
  (eq x o-fail))

(defgeneric input-region (parser start end)
  (:method ((o ometa) start end)
    (subseq (input-array (input-stream o)) start end)))

(defvar *memo-table*)

(defun init-memo ()
  (setf *memo-table* (make-hash-table :test #'equal)))

(defgeneric token-success-hook (parser token result start-pos end-pos)
  (:method ((o ometa) token result start-pos end-pos)
    (declare (ignore token result start-pos end-pos))))

(defmethod ometa-apply ((o ometa-prim) fun arg)
  (labels ((stack-top ()
             (let* ((stack (reverse *stack*))
                    (stacklen (length stack))
                    (only-n-tail (loop :for n :from 49 :above 8 :by 5
                                    :if (> stacklen n)
                                    :do (return (max 7 (- stacklen n)))
                                    :finally (return nil))))
               (if only-n-tail (last stack only-n-tail) stack)))
           (tracep ()
             (and (or *trace*
                      (and *ignore-count*
                           (not (plusp *ignore-count*))))
                  (not (functionp fun))))
           (invoke-tracing-call-and-result (fn)
             (let* ((tracep (tracep))
                    (pretty-args (when tracep
                                   (let ((args (if (listp arg) arg (list arg))))
                                     (if (every #'functionp args)
                                         "..<fn>.."
                                         (substitute-if "<fn>" #'functionp args)))))
                    (call-stack-worthy-p (not (or (functionp fun)
                                                  (member fun '(oor oand omany1 omany onot))))))
               (when tracep 
                 (format t "..>>..# ~A || apply ~S ~S~%" (stack-top) fun pretty-args))
               (let ((*stack* (when *trace*
                                (if call-stack-worthy-p (cons fun *stack*) *stack*))))
                 (let ((before-position (input-position (input-stream o)))
                       (result (funcall fn)))
                   (when *enable-trace-p*
                     (setf *trace* (or *trace*
                                       (funcall *enable-trace-p* result))))
                   (let ((failp (and (consp result) (eq (car result) 'o-fail-object))))
                     (when (and (not failp)
                                (symbolp fun))
                       (token-success-hook o fun result before-position (input-position (input-stream o))))
                     (when (tracep)
                       (format t "~:[OKAY  ~;FAIL!!~]# ~A || apply ~S ~S => ~:[-.-.-.-.- ~A --> ~S~;<=== FAIL~]~%"
                               failp (stack-top) fun pretty-args failp fun result)))
                   (when (and *ignore-count*
                              (plusp *ignore-count*))
                     (decf *ignore-count*))
                   (incf *call-nr*)
                   result)))))
    (save-input o)
    (invoke-tracing-call-and-result
     (lambda ()
       (if (and (null arg)
                (symbolp fun))
           (let* ((key (list fun (input-position (input-stream o)) arg ))
                  (lookup (gethash key *memo-table* :memo-lookup-failure)))
             (if (eq lookup :memo-lookup-failure)
                 (let ((result (funcall fun o arg)))
                   (setf (gethash key *memo-table*) (cons result (input-position (input-stream o))))
                   (discard-input o)
                   result)
                 (progn
                   (if (not (eq (car lookup) o-fail))
                       (setf (input-position (input-stream o)) (cdr lookup))
                       (restore-input o))
                   (discard-input o)
                   (car lookup))))
           (progn
             (discard-input o)
             (funcall fun o arg) ))))))


(defun inspect-memo ()
  (let ((highest-pos 0))
      (maphash #'(lambda (key val)
	       (destructuring-bind (result . pos) val
		 (if (> pos highest-pos)
		     (setf highest-pos pos))
		 )) *memo-table*)
      (format t "highest ~A~%" highest-pos))
)




(defmethod discard-input ((o ometa-prim))
  (pop-mark (input-stream o)))
(defmethod restore-input ((o ometa-prim))
  (reset-to-mark (input-stream o)))
(defmethod save-input ((o ometa-prim))
  (mark (input-stream o)))

(defmethod restore-and-discard-input ((o ometa-prim))
  (restore-input o)
  (discard-input o))


(defmethod oAnd ((o ometa-prim) args)
  (if (null args)
      t
      (loop for x in args
	    for answer = (ometa-apply o x nil)
	    when (o-fail? answer)
	    do (return-from oAnd o-fail)
	    finally (return answer))))

(defmethod oOr ((o ometa-prim) args)
  (save-input o)
  (loop for x in args do
	(progn
	  (restore-input o)
	  (let ((answer (ometa-apply o x nil)))
	    (unless (o-fail? answer)
	      (discard-input o)
	      (return-from oOr answer)))))
  (discard-input o)
  o-fail)

(defmethod omany ((o ometa-prim) x)
  (let (answer)
    (loop do
	  (progn
	    (save-input o)
	    (let ((v (ometa-apply o x nil)))
	      (if (o-fail? v)
		  (progn
		    (restore-and-discard-input o)
		    (return-from omany (nreverse answer))))
	      (push v answer)
	      (discard-input o))))))

(defmethod omany1 ((o ometa-prim) x)
  (let ((v (ometa-apply o x nil)))
    (if (o-fail? v)
	o-fail
	(let ((answer (list v)))
	  (loop do
		(progn
		  (save-input o)
		  (let ((v (ometa-apply o x nil)))
		    (if (o-fail? v)
			(progn
			  (restore-and-discard-input o)
			  (return-from omany1 (nreverse answer))))
		    (push v answer)
		    (discard-input o))))))))

(defmethod seq ((o ometa-prim) xs)
  (save-input o)
  (loop for x in xs
       when (o-fail? (ometa-apply o 'ometa::exactly (list x)))
       do (progn
	    (restore-and-discard-input o)
	    (return-from seq o-fail)))
  (discard-input o)
  xs)

(defmethod opred ((o ometa-prim) p)
  (or p o-fail))

(defmethod onot ((o ometa-prim) x)
  (save-input o)
  (if (o-fail? (ometa-apply o x nil))
      (progn
	(restore-and-discard-input o)
	t)
      (progn
	(discard-input o)
	o-fail)))

(defmethod anything ((o ometa-prim) arg)
  (if (at-end-p (input-stream o))
      o-fail
      (read-next (input-stream o))))

(defmethod form ((o ometa-prim) arg)
  (let ((v (ometa-apply o 'ometa::anything nil)))
    (if (or (o-fail? v)
	    (not (listp v)))
	o-fail
	(let ((saved-input-stream (input-stream o)))
	  (setf (input-stream o) (make-instance 'ometa::ometa-list-input-stream :input-list v))
	  (let ((result (ometa-apply o (first arg) nil)))
	    (if (or (o-fail? result)
		    (not (at-end-p (input-stream o))))
		(progn
		  (setf (input-stream o) saved-input-stream)
		  o-fail)
		(let ((result2 (if (null (second arg))
				   nil
				   (ometa-apply o (second arg) nil))))
		  (if (or (o-fail? result2)
			  (not (at-end-p (input-stream o))))
		      (progn
			(setf (input-stream o) saved-input-stream)
			o-fail)
		      (progn
			(setf (input-stream o) saved-input-stream)
			(append result result2))))))))))

(defmethod token ((o ometa-prim) arg)
  (save-input o)
  (let ((str (first arg)))
    (loop for c across str
	 when (o-fail? (ometa-apply o 'ometa::exactly (list c)))
	 do (progn
		(restore-and-discard-input o)
		(return-from token o-fail)))
    (discard-input o)
    str))

(defmethod stringquote ((o ometa-prim) arg)
  (ometa-apply o 'ometa::token (list (coerce (list #\")  'string))))

(defmethod firstAndRest ((o ometa-prim) args)
  (save-input o)
  (let ((first (if (functionp (car args)) (pop args) (intern (string-upcase  (pop args)) :ometa)))
	(rest  (if (functionp (car args)) (pop args) (intern (string-upcase  (pop args)) :ometa))))
    (let ((result (ometa-apply o  first nil)))
      (if (o-fail? result)
	  (progn
	    (restore-and-discard-input o)
	    o-fail)
	  (let ((result1 (ometa-apply o 'ometa::omany rest)))
	    (progn
	      (discard-input o)
	      (cons result result1)))))))

(defmethod listof ((o ometa-prim) args)
  (let* ((thing (if (functionp (car args)) (pop args) (intern (string-upcase (pop args)) :ometa)))
	 (separator (pop args))
	 (first-rule (ometa-apply o thing nil)))
    (if (o-fail? first-rule)
	nil
	(let ((others (ometa-apply o 'ometa::omany #'(lambda (o arg)
						(ometa-apply o 'oand (list #'(lambda (o arg)
									       (ometa-apply o 'ometa::spaces nil)
									       (ometa-apply o 'ometa::token (list separator)))
									   #'(lambda (o arg)
									       (ometa-apply o thing nil))))))))
	  (cons first-rule others)))))
