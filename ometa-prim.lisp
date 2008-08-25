(in-package :ometa)
(declaim (optimize (safety 3) (debug 3)))

(defclass ometa-input-stream () ((input-array :initarg :input-array :accessor input-array)
				 (input-position :initform 0 :accessor input-position)
				 (mark-stack :initform nil :accessor mark-stack)))

(defmethod read-next ((o ometa-input-stream))
  (let ((v (aref (input-array o) (input-position o))))
    (incf (input-position o))
    v))

(defmethod at-end-p ((o ometa-input-stream))
  (= (input-position o) (length (input-array o))))

(defmethod mark ((o ometa-input-stream))
  (push (input-position o) (mark-stack o)))

(defmethod reset-to-mark ((o ometa-input-stream))
  (setf (input-position o) (first (mark-stack o))))

(defmethod pop-mark ((o ometa-input-stream))
  (pop (mark-stack o)))

(defmethod reset-and-pop-mark ((o ometa-input-stream))
  (reset-to-mark o)
  (pop-mark o))

(defclass ometa-prim ()
  ((input-stream :accessor input-stream :initarg :input-stream)))

(defvar o-fail (list 'o-fail-object))
(defun o-fail? (x)
  (eq x o-fail))

(defmethod ometa-apply ((o ometa-prim) fun arg)
  ; do memoization here
  (funcall fun o arg))


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
       when (o-fail? (ometa-apply o 'exactly (list x)))
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

(defmethod token ((o ometa-parser) arg)
  (save-input o)
  (let ((str (first arg)))
    (loop for c across str
	 when (o-fail? (ometa-apply o 'exactly (list c)))
	 do (progn
		(restore-and-discard-input o)
		(return-from token o-fail)))
    (discard-input o)
    str))

(defmethod stringquote ((o ometa-parser) arg)
  (ometa-apply o 'token (list (coerce (list #\")  'string))))

(defmethod firstAndRest ((o ometa-prim) args)
  (save-input o)
  (let ((first (if (functionp (car args)) (pop args) (intern (string-upcase  (pop args)) :ometa)))
	(rest  (if (functionp (car args)) (pop args) (intern (string-upcase  (pop args)) :ometa))))
    (let ((result (ometa-apply o  first nil)))
      (if (o-fail? result)
	  (progn
	    (restore-and-discard-input o)
	    o-fail)
	  (let ((result1 (ometa-apply o 'omany rest)))
	    (progn
	      (discard-input o)
	      (cons result result1)))))))

(defmethod listof ((o ometa-prim) args)
  (let* ((thing (if (functionp (car args)) (pop args) (intern (string-upcase (pop args)) :ometa)))
	 (separator (pop args))
	 (first-rule (ometa-apply o thing nil)))
    (if (o-fail? first-rule)
	nil
	(let ((others (ometa-apply o 'omany #'(lambda (o arg)
						(ometa-apply o 'oand (list #'(lambda (o arg)
									       (ometa-apply o 'spaces nil)
									       (ometa-apply o 'token (list separator)))
									   #'(lambda (o arg)
									       (ometa-apply o thing nil))))))))
	  (cons first-rule others)))))