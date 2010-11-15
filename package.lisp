(defpackage #:ometa
  (:use :cl)
  (:shadow #:o #:v #:x #:xs #:arg #:str #:nullarg)
  (:export
   #:ometa
   #:ometa-parser
   #:ometa-compiler
   #:parse-grammar
   #:make-parser
   #:ometa-input-stream
   #:input-region
   #:load-grammar
   ;; lexical category support
   #:*posn*
   #:ometa-apply
   ;; parser invocation
   #:parse-input-file
   #:parse-input-string
   ;; parsers: ometa
   #:empty
   #:end
   #:exactly
   #:ochar
   #:ospace
   #:spaces
   #:letter
   #:digit
   ;; parsers: ometa-prim
   #:grammar
   #:oand
   #:oor
   #:omany
   #:omany1
   #:seq
   #:opred
   #:onot
   #:anything
   #:form
   #:token
   #:stringquote
   #:firstandrest
   #:listof
   ;; trace control
   #:*trace*
   #:*ignore-count*
   #:*enable-trace-p*
   #:*call-nr*
   ;; hooks
   #:token-success-hook
   ))

(defpackage #:ometa-output-package
  (:use :common-lisp :ometa)
  (:import-from #:ometa #:o #:v #:x #:xs #:arg #:str #:nullarg)
  (:export
   #:ometa #:o #:v #:x #:xs #:arg #:str #:nullarg
   #:ometa-apply
   ;; parsers: ometa
   #:empty
   #:end
   #:exactly
   #:ochar
   #:ospace
   #:spaces
   #:letter
   #:digit
   ;; parsers: ometa-prim
   #:grammar
   #:oand
   #:oor
   #:omany
   #:omany1
   #:seq
   #:opred
   #:onot
   #:anything
   #:form
   #:token
   #:stringquote
   #:firstandrest
   #:listof
   ))
