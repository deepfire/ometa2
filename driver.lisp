(in-package :ometa)

(defvar *ometa-compiler-target* 'ometa-parser)

(defclass ometa (ometa-prim) ())
(defclass ometa-parser (ometa) ((locals :initform nil :accessor locals)))

(defun init ()
  (load-ometa))

(defun load-ometa ()
  (load-parser "ometa-parser.lisp"))

(defun load-alternate-ometa ()
  (load-parser "ometa-parser1.lisp"))

(defun load-parser (file-name)
  (let ((*package* (find-package 'ometa)))
    (declare (optimize (speed 0) (safety 3) (debug 3)))
    (load (compile-file "ometa.lisp"))
    (load (compile-file file-name))
    (load (compile-file "ometa-prim.lisp"))))

(defun bootstrap ()
  (load-ometa)
  (ometa::make-parser 'ometa::ometa-parser "ometa-parser.g" "ometa-parser1.lisp")
  (load-alternate-ometa))

(defun parse-grammar (file-name)
    (let ((ometa (make-instance 'ometa-parser)))
        (parse-input-file ometa file-name)))

(defmacro with-compiled-forms (class-name grammar-file-name action &optional initial-action)
  `(let ((*ometa-compiler-target* ,class-name))
     (let ((forms (mapcar #'ometa-compile (mapcar #'ometa-optimize (cdddr (parse-grammar ,grammar-file-name))))))
       ,@(when initial-action
               `((when forms
                   (funcall ,initial-action))))
       (loop for form in forms
          do (funcall ,action form)))))

(defun make-parser (class-name grammar-file-name parser-file-name &key optimize-debug optimize-speed)
  (let ((quality (cond ((and optimize-debug optimize-speed)
                        (error "Conflicting optimization requirements."))
                       (optimize-debug '(debug safety))
                       (optimize-speed '(speed))
                       (t              nil))))
    (with-open-file (stream parser-file-name :direction :output :if-exists :supersede)
      (with-compiled-forms class-name grammar-file-name 
                           (lambda (form) 
                             (format stream "~%") 
                             (let ((*print-readably* t))
                               (prin1 form stream)))
                           (lambda ()
                             (when quality
                               (write `(declaim (optimize ,@quality)) :stream stream)))))))

(defun load-grammar (class-name grammar-file-name)
    (with-compiled-forms class-name grammar-file-name
      #'eval))
