(defsystem "ometa"
    :author "John Leuner"
    :description "OMeta implementation for Common Lisp"
    :serial t
    :components ((:file "package")
                 (:file "driver")
                 (:file "ometa-prim")
                 (:file "ometa")
                 (:file "ometa-parser")
                 (:file "ometa-compiler")
                 (:file "ometa-optimizer")))
