(defpackage #:ometa
  (:use :cl)
  (:export :parse-grammar-file :compile-grammar-to-lisp :generate-parser :ometa :ometa-parser :ometa-compiler)
  (:export :letter :digit :anything :exactly :ochar :ospace :spaces :token))

(in-package :ometa)

(defvar *ometa-compiler-target* 'ometa-parser)

(defclass ometa (ometa-prim) ())
(defclass ometa-parser (ometa) ((locals :initform nil :accessor locals)))

(defun bootstrap ()
;  (load-ometa)
  (ometa::make-parser 'ometa::ometa-parser "ometa-parser.g" "/home/jewel/dev/ometa2/ometa-parser-new.lisp")
  (load-ometa))

(defun init ()
  (load-ometa))

(defun parse-grammar (file-name)
  (let ((input (with-open-file (file file-name :direction :input)
    (let ((s (make-array (file-length file))))
      (read-sequence s file) s))))
    (let ((o (make-instance 'ometa-parser :input-stream (make-instance 'ometa-input-stream :input-array input))))
      (ometa-apply o 'grammar nil))))

(defun make-parser (class-name grammar-file-name parser-file-name )
  (with-open-file (stream parser-file-name :direction :output :if-exists :supersede)
    (loop for form in (mapcar #'ometa-compile (mapcar #'ometa-optimize (parse-grammar grammar-file-name))) 
	   do (progn
		(format stream "~%")
		(let ((*print-readably* t))
		  (prin1 form stream))))))

(defun make-parser2 (class-name grammar-file-name parser-file-name )
  (with-open-file (stream parser-file-name :direction :output :if-exists :supersede)
    (loop for form in (mapcar #'ometa-compile (mapcar #'ometa-optimize (cdddr (parse-grammar grammar-file-name))) ) 
	   do (progn
		(format stream "~%")
		(let ((*print-readably* t))
		  (prin1 form stream))))))

(defun load-ometa ()
  (let ((*package* (find-package 'ometa)))
    (declare (optimize (speed 0) (safety 3) (debug 3)))
    (load (compile-file "ometa.lisp"))
    (load (compile-file "ometa-parser-new.lisp"))
    (load (compile-file "ometa-prim.lisp"))
    ))

(defun load-ometa1 ()
  (let ((*package* (find-package 'ometa)))
    (declare (optimize (speed 0) (safety 3) (debug 3)))
    (load (compile-file "ometa.lisp"))
    (load (compile-file "ometa-parser-new1.lisp"))
    (load (compile-file "ometa-prim.lisp"))
    ))
