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
  (init-memo)
  (let ((input (with-open-file (file file-name :direction :input)
		 (let ((s (make-array (file-length file))))
		   (read-sequence s file)
		   s))))
    (let ((o (make-instance 'ometa-parser :input-stream (make-instance 'ometa-input-stream :input-array input))))
      (ometa-apply o 'grammar nil))))

(defun make-parser (class-name grammar-file-name parser-file-name )
  (let ((*ometa-compiler-target* class-name))
    (with-open-file (stream parser-file-name :direction :output :if-exists :supersede)
      (loop for form in (mapcar #'ometa-compile (mapcar #'ometa-optimize (cdddr (parse-grammar grammar-file-name))) ) 
	 do (progn
	      (format stream "~%")
	      (let ((*print-readably* t))
		(prin1 form stream)))))))

