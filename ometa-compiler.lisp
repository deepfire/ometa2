(in-package :ometa)
(declaim (optimize (safety 3) (debug 3)))

(defun ometa-compile (form)
  (case (first form)
    ((prod :rule) (destructuring-bind (prod name locals body) form
	    `(defmethod ,(intern (string-upcase name) :ometa) ((o ,*ometa-compiler-target*) arg)
	       (let ,(loop for l in locals collect (intern (string-upcase (symbol-name l)))) ,(ometa-compile body)))))
    ((or :or) `(ometa-apply o 'oOr (list ,@(loop for f in (cdr form) collect `(lambda (o nullarg) ,(ometa-compile f))))))
    ((and :and) `(ometa-apply o 'oAnd (list ,@(loop for f in (cdr form) collect `(lambda (o nullarg) ,(ometa-compile f))))))
    ((many :many)  `(ometa-apply o 'oMany (lambda (o nullarg) ,(ometa-compile (second form)))))
    ((many1 :many1) `(ometa-apply o 'oMany1 (lambda (o nullarg) ,(ometa-compile (second form)))))
    ((not :not) `(ometa-apply o 'oNot (lambda (o nullarg) ,(ometa-compile (second form)))))
    ((:lookahead) `(ometa-apply o 'oNot (lambda (o nullarg) (ometa-apply o 'oNot (lambda (o nullarg) ,(ometa-compile (second form)))))))
    ((apply :apply :app) (destructuring-bind (app name . args) form
	     `(ometa-apply o ',(if (stringp name) (intern (string-upcase name)) name) ,(if (null args) nil `(list ,@(loop for a in args collect (if (and (consp a)
																			 (eq (car a) :app))
																		    (ometa-compile a)
																		    (if (and (consp a)
																			     (eq (car a) :string))
																			(second a)
																			(intern (string-upcase a) :ometa)))))))))
    ((assign :assign :set) `(let ((v ,(ometa-compile (if (equal (third form) `(:app :anything)) `(:loadarg) (third form)) )))
			      (setf ,(intern (string-upcase (second form)) :ometa) v)
			      v))
    ((action :action :act) (if (stringp (second form)) (read-from-string (second form)) (ometa-compile (second form))) )
    ((pred :pred)  `(ometa-apply o 'oPred ,(read-from-string (second (second form)))))
    ((loadarg :loadarg) `(pop arg))
    ((:string) (second form))
    (otherwise (warn "other ~A" form) form)))