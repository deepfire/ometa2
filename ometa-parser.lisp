
(DEFMETHOD OMETA::NAMEFIRST ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:LETTER
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:EXACTLY
                                                        (LIST #\_)))))))
(DEFMETHOD OMETA::NAMEREST ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O
                                                        'OMETA::NAMEFIRST NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:DIGIT
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:EXACTLY
                                                        (LIST #\-)))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:EXACTLY
                                                        (LIST #\!)))))))
(DEFMETHOD OMETA::TSNAME ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::XS)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::FIRSTANDREST
                                                               (LIST
                                                                "nameFirst"
                                                                "nameRest"))))
                                      (SETF OMETA::XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (COERCE OMETA::XS 'STRING))))))
(DEFMETHOD OMETA::NAME ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:SPACES
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::TSNAME
                                                        NIL))))))
(DEFMETHOD OMETA::TSSTRING ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA:TOKEN (LIST "FAIL"))))
(DEFMETHOD OMETA::OKEYWORD ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::XS)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V (POP OMETA::ARG)))
                                      (SETF OMETA::XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:TOKEN
                                                            (LIST OMETA::XS)))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::ONOT
                                                            (LAMBDA
                                                                (OMETA::O
                                                                 OMETA::NULLARG)
                                                              (OMETA::OMETA-APPLY
                                                               OMETA::O
                                                               'OMETA::LETTERORDIGIT
                                                               NIL)))))))))))
(DEFMETHOD OMETA::CHARACTERS ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA:TOKEN (LIST "''''"))))
(DEFMETHOD OMETA::SCHARACTERS ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::XS)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O
                                                        'OMETA::STRINGQUOTE
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::OMANY
                                                               (LAMBDA
                                                                   (OMETA::O
                                                                    OMETA::NULLARG)
                                                                 (OMETA::OMETA-APPLY
                                                                  OMETA::O
                                                                  'OMETA::OOR
                                                                  (LIST
                                                                   (LAMBDA
                                                                       (OMETA::O
                                                                        OMETA::NULLARG)
                                                                     (OMETA::OMETA-APPLY
                                                                      OMETA::O
                                                                      'OMETA::OAND
                                                                      (LIST
                                                                       (LAMBDA
                                                                           (OMETA::O
                                                                            OMETA::NULLARG)
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'OMETA::ONOT
                                                                          (LAMBDA
                                                                              (OMETA::O
                                                                               OMETA::NULLARG)
                                                                            (OMETA::OMETA-APPLY
                                                                             OMETA::O
                                                                             'OMETA::STRINGQUOTE
                                                                             NIL))))
                                                                       (LAMBDA
                                                                           (OMETA::O
                                                                            OMETA::NULLARG)
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'OMETA:ANYTHING
                                                                          NIL)))))))))))
                                      (SETF OMETA::XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O
                                                        'OMETA::STRINGQUOTE
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:STRING ,(COERCE OMETA::XS 'STRING)))))))
(DEFMETHOD OMETA::OSYMBOL ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::S)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:SPACES
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:TOKEN
                                                        (LIST "#")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::TSNAME
                                                               NIL)))
                                      (SETF OMETA::S OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:APP OMETA:EXACTLY
                                      (:SYMBOL ,OMETA::S)))))))
(DEFMETHOD OMETA::CHAR-LITERAL ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::D)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:TOKEN
                                                        (LIST "$")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA:ANYTHING
                                                               NIL)))
                                      (SETF OMETA::D OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:APP OMETA:EXACTLY
                                      (:CHARACTER ,OMETA::D)))))))
(DEFMETHOD OMETA::ONUMBER ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::DS OMETA::SIGN)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::OOR
                                                               (LIST
                                                                (LAMBDA
                                                                    (OMETA::O
                                                                     OMETA::NULLARG)
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::OAND
                                                                   (LIST
                                                                    (LAMBDA
                                                                        (OMETA::O
                                                                         OMETA::NULLARG)
                                                                      (OMETA::OMETA-APPLY
                                                                       OMETA::O
                                                                       'OMETA:TOKEN
                                                                       (LIST
                                                                        "-"))))))
                                                                (LAMBDA
                                                                    (OMETA::O
                                                                     OMETA::NULLARG)
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::OAND
                                                                   (LIST
                                                                    (LAMBDA
                                                                        (OMETA::O
                                                                         OMETA::NULLARG)
                                                                      (OMETA::OMETA-APPLY
                                                                       OMETA::O
                                                                       'OMETA::EMPTY
                                                                       NIL))
                                                                    (LAMBDA
                                                                        (OMETA::O
                                                                         OMETA::NULLARG)
                                                                      ""))))))))
                                      (SETF OMETA::SIGN OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::OMANY1
                                                               (LAMBDA
                                                                   (OMETA::O
                                                                    OMETA::NULLARG)
                                                                 (OMETA::OMETA-APPLY
                                                                  OMETA::O
                                                                  'OMETA:DIGIT
                                                                  NIL)))))
                                      (SETF OMETA::DS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:APP OMETA:EXACTLY
                                      ,(PARSE-INTEGER
                                        (COERCE OMETA::DS 'STRING))))))))
(DEFMETHOD OMETA::LETTERORDIGIT ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:LETTER
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:DIGIT
                                                        NIL))))))
(DEFMETHOD OMETA::ARGS ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::XS)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:EXACTLY
                                                            (LIST #\()))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::LISTOF
                                                                   (LIST
                                                                    "hostExpr"
                                                                    ","))))
                                                             (SETF OMETA::XS
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:EXACTLY
                                                            (LIST #\))))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           OMETA::XS))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::EMPTY NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           NIL))))))))
(DEFMETHOD OMETA::APPLICATION ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::AS OMETA::RULE)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:SPACES
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::NAME
                                                               NIL)))
                                      (SETF OMETA::RULE OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::ARGS
                                                               NIL)))
                                      (SETF OMETA::AS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:APP ,OMETA::RULE ,@OMETA::AS))))))
(DEFMETHOD OMETA::HOSTEXPR ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:SPACES
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::CURLYHOSTEXPR
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::ATOMICHOSTEXPR
                                                            NIL)))))))))
(DEFMETHOD OMETA::CURLYHOSTEXPR ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::XS)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:SPACES
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:TOKEN
                                                        (LIST "<<")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::OMANY
                                                               (LAMBDA
                                                                   (OMETA::O
                                                                    OMETA::NULLARG)
                                                                 (OMETA::OMETA-APPLY
                                                                  OMETA::O
                                                                  'OMETA::OOR
                                                                  (LIST
                                                                   (LAMBDA
                                                                       (OMETA::O
                                                                        OMETA::NULLARG)
                                                                     (OMETA::OMETA-APPLY
                                                                      OMETA::O
                                                                      'OMETA::OAND
                                                                      (LIST
                                                                       (LAMBDA
                                                                           (OMETA::O
                                                                            OMETA::NULLARG)
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'OMETA::ONOT
                                                                          (LAMBDA
                                                                              (OMETA::O
                                                                               OMETA::NULLARG)
                                                                            (OMETA::OMETA-APPLY
                                                                             OMETA::O
                                                                             'OMETA:TOKEN
                                                                             (LIST
                                                                              ">>")))))
                                                                       (LAMBDA
                                                                           (OMETA::O
                                                                            OMETA::NULLARG)
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'OMETA:ANYTHING
                                                                          NIL)))))))))))
                                      (SETF OMETA::XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:TOKEN
                                                        (LIST ">>")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:ACT ,(COERCE OMETA::XS 'STRING)))))))
(DEFMETHOD OMETA::ATOMICHOSTEXPR ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::OOR
                                                               (LIST
                                                                (LAMBDA
                                                                    (OMETA::O
                                                                     OMETA::NULLARG)
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::OAND
                                                                   (LIST
                                                                    (LAMBDA
                                                                        (OMETA::O
                                                                         OMETA::NULLARG)
                                                                      (OMETA::OMETA-APPLY
                                                                       OMETA::O
                                                                       'OMETA::SCHARACTERS
                                                                       NIL)))))
                                                                (LAMBDA
                                                                    (OMETA::O
                                                                     OMETA::NULLARG)
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::OAND
                                                                   (LIST
                                                                    (LAMBDA
                                                                        (OMETA::O
                                                                         OMETA::NULLARG)
                                                                      (OMETA::OMETA-APPLY
                                                                       OMETA::O
                                                                       'OMETA::NAME
                                                                       NIL)))))))))
                                      (SETF OMETA::X OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    OMETA::X)))))
(DEFMETHOD OMETA::SEMACTION ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:SPACES
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:TOKEN
                                                            (LIST "!")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:TOKEN
                                                            (LIST "->"))))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:SPACES
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::OAND
                                                            (LIST
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (LET ((OMETA::V
                                                                      (OMETA::OMETA-APPLY
                                                                       OMETA::O
                                                                       'OMETA::ATOMICHOSTEXPR
                                                                       NIL)))
                                                                 (SETF OMETA::X
                                                                         OMETA::V)
                                                                 OMETA::V))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               `(:ACT
                                                                 ,OMETA::X)))))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::OAND
                                                            (LIST
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (OMETA::OMETA-APPLY
                                                                OMETA::O
                                                                'OMETA:SPACES
                                                                NIL))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (LET ((OMETA::V
                                                                      (OMETA::OMETA-APPLY
                                                                       OMETA::O
                                                                       'OMETA::CURLYHOSTEXPR
                                                                       NIL)))
                                                                 (SETF OMETA::X
                                                                         OMETA::V)
                                                                 OMETA::V))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               OMETA::X)))))))))))
(DEFMETHOD OMETA::SEMPRED ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:SPACES
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:TOKEN
                                                        (LIST "?")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::HOSTEXPR
                                                               NIL)))
                                      (SETF OMETA::X OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:PRED ,OMETA::X))))))
(DEFMETHOD OMETA::EXPR ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::XS)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::LISTOF
                                                               (LIST "expr4"
                                                                     "|"))))
                                      (SETF OMETA::XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:OR ,@OMETA::XS))))))
(DEFMETHOD OMETA::EXPR4 ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::XS)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::OMANY
                                                               (LAMBDA
                                                                   (OMETA::O
                                                                    OMETA::NULLARG)
                                                                 (OMETA::OMETA-APPLY
                                                                  OMETA::O
                                                                  'OMETA::OOR
                                                                  (LIST
                                                                   (LAMBDA
                                                                       (OMETA::O
                                                                        OMETA::NULLARG)
                                                                     (OMETA::OMETA-APPLY
                                                                      OMETA::O
                                                                      'OMETA::OAND
                                                                      (LIST
                                                                       (LAMBDA
                                                                           (OMETA::O
                                                                            OMETA::NULLARG)
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'OMETA:SPACES
                                                                          NIL))
                                                                       (LAMBDA
                                                                           (OMETA::O
                                                                            OMETA::NULLARG)
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'OMETA::EXPR3
                                                                          NIL)))))))))))
                                      (SETF OMETA::XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:AND ,@OMETA::XS))))))
(DEFMETHOD OMETA::OPTITER ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V (POP OMETA::ARG)))
                                      (SETF OMETA::X OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::OAND
                                                            (LIST
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (OMETA::OMETA-APPLY
                                                                OMETA::O
                                                                'OMETA:TOKEN
                                                                (LIST "*")))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               `(:MANY
                                                                 ,OMETA::X)))))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::OAND
                                                            (LIST
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (OMETA::OMETA-APPLY
                                                                OMETA::O
                                                                'OMETA:TOKEN
                                                                (LIST "+")))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               `(:MANY1
                                                                 ,OMETA::X)))))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::OAND
                                                            (LIST
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (OMETA::OMETA-APPLY
                                                                OMETA::O
                                                                'OMETA::EMPTY
                                                                NIL))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               OMETA::X)))))))))))
(DEFMETHOD OMETA::EXPR3 ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::N OMETA::X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::EXPR2
                                                                   NIL)))
                                                             (SETF OMETA::X
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::OPTITER
                                                                   (LIST
                                                                    OMETA::X))))
                                                             (SETF OMETA::X
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::OOR
                                                            (LIST
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (OMETA::OMETA-APPLY
                                                                OMETA::O
                                                                'OMETA::OAND
                                                                (LIST
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   (OMETA::OMETA-APPLY
                                                                    OMETA::O
                                                                    'OMETA:TOKEN
                                                                    (LIST
                                                                     ":")))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   (LET ((OMETA::V
                                                                          (OMETA::OMETA-APPLY
                                                                           OMETA::O
                                                                           'OMETA::NAME
                                                                           NIL)))
                                                                     (SETF OMETA::N
                                                                             OMETA::V)
                                                                     OMETA::V))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   (PROGN
                                                                    (PUSHNEW
                                                                     (INTERN
                                                                      OMETA::N)
                                                                     (OMETA::LOCALS
                                                                      OMETA::O))
                                                                    `(:SET
                                                                      ,OMETA::N
                                                                      ,OMETA::X))))))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (OMETA::OMETA-APPLY
                                                                OMETA::O
                                                                'OMETA::OAND
                                                                (LIST
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   (OMETA::OMETA-APPLY
                                                                    OMETA::O
                                                                    'OMETA::EMPTY
                                                                    NIL))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   OMETA::X))))))))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:SPACES NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:TOKEN
                                                            (LIST ":")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::NAME
                                                                   NIL)))
                                                             (SETF OMETA::N
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (PROGN
                                                            (PUSHNEW
                                                             (INTERN OMETA::N)
                                                             (OMETA::LOCALS
                                                              OMETA::O))
                                                            `(:SET ,OMETA::N
                                                              (:LOADARG)))))))))))
(DEFMETHOD OMETA::EXPR2 ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:SPACES NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:TOKEN
                                                            (LIST "~")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::EXPR2
                                                                   NIL)))
                                                             (SETF OMETA::X
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           `(:NOT
                                                             ,OMETA::X)))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:SPACES NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:TOKEN
                                                            (LIST "&")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::EXPR1
                                                                   NIL)))
                                                             (SETF OMETA::X
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           `(:LOOKAHEAD
                                                             ,OMETA::X)))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::EXPR1
                                                        NIL))))))
(DEFMETHOD OMETA::EXPR1 ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::TAILEXPR OMETA::FORMEXPR OMETA::S OMETA::X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O
                                                        'OMETA::APPLICATION
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O
                                                        'OMETA::SEMACTION NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O
                                                        'OMETA::SEMPRED NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::OOR
                                                                   (LIST
                                                                    (LAMBDA
                                                                        (OMETA::O
                                                                         OMETA::NULLARG)
                                                                      (OMETA::OMETA-APPLY
                                                                       OMETA::O
                                                                       'OMETA::OAND
                                                                       (LIST
                                                                        (LAMBDA
                                                                            (OMETA::O
                                                                             OMETA::NULLARG)
                                                                          (OMETA::OMETA-APPLY
                                                                           OMETA::O
                                                                           'OMETA::OKEYWORD
                                                                           (LIST
                                                                            "undefined"))))))
                                                                    (LAMBDA
                                                                        (OMETA::O
                                                                         OMETA::NULLARG)
                                                                      (OMETA::OMETA-APPLY
                                                                       OMETA::O
                                                                       'OMETA::OAND
                                                                       (LIST
                                                                        (LAMBDA
                                                                            (OMETA::O
                                                                             OMETA::NULLARG)
                                                                          (OMETA::OMETA-APPLY
                                                                           OMETA::O
                                                                           'OMETA::OKEYWORD
                                                                           (LIST
                                                                            "nil"))))))
                                                                    (LAMBDA
                                                                        (OMETA::O
                                                                         OMETA::NULLARG)
                                                                      (OMETA::OMETA-APPLY
                                                                       OMETA::O
                                                                       'OMETA::OAND
                                                                       (LIST
                                                                        (LAMBDA
                                                                            (OMETA::O
                                                                             OMETA::NULLARG)
                                                                          (OMETA::OMETA-APPLY
                                                                           OMETA::O
                                                                           'OMETA::OKEYWORD
                                                                           (LIST
                                                                            "true"))))))
                                                                    (LAMBDA
                                                                        (OMETA::O
                                                                         OMETA::NULLARG)
                                                                      (OMETA::OMETA-APPLY
                                                                       OMETA::O
                                                                       'OMETA::OAND
                                                                       (LIST
                                                                        (LAMBDA
                                                                            (OMETA::O
                                                                             OMETA::NULLARG)
                                                                          (OMETA::OMETA-APPLY
                                                                           OMETA::O
                                                                           'OMETA::OKEYWORD
                                                                           (LIST
                                                                            "false"))))))))))
                                                             (SETF OMETA::X
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           `(:APP
                                                             'OMETA:EXACTLY
                                                             ,OMETA::X)))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:SPACES NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::OOR
                                                            (LIST
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (OMETA::OMETA-APPLY
                                                                OMETA::O
                                                                'OMETA::CHARACTERS
                                                                NIL))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (OMETA::OMETA-APPLY
                                                                OMETA::O
                                                                'OMETA::OAND
                                                                (LIST
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   (LET ((OMETA::V
                                                                          (OMETA::OMETA-APPLY
                                                                           OMETA::O
                                                                           'OMETA::SCHARACTERS
                                                                           NIL)))
                                                                     (SETF OMETA::S
                                                                             OMETA::V)
                                                                     OMETA::V))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   `(:APP
                                                                     OMETA:TOKEN
                                                                     ,OMETA::S)))))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (OMETA::OMETA-APPLY
                                                                OMETA::O
                                                                'OMETA::CHAR-LITERAL
                                                                NIL))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (OMETA::OMETA-APPLY
                                                                OMETA::O
                                                                'OMETA::OSYMBOL
                                                                NIL))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (OMETA::OMETA-APPLY
                                                                OMETA::O
                                                                'OMETA::ONUMBER
                                                                NIL))))))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:SPACES NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:TOKEN
                                                            (LIST "[")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:SPACES NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::EXPRALL
                                                                   NIL)))
                                                             (SETF OMETA::FORMEXPR
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:SPACES NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::OMANY
                                                            (LAMBDA
                                                                (OMETA::O
                                                                 OMETA::NULLARG)
                                                              (OMETA::OMETA-APPLY
                                                               OMETA::O
                                                               'OMETA::OAND
                                                               (LIST
                                                                (LAMBDA
                                                                    (OMETA::O
                                                                     OMETA::NULLARG)
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA:TOKEN
                                                                   (LIST "/")))
                                                                (LAMBDA
                                                                    (OMETA::O
                                                                     OMETA::NULLARG)
                                                                  (LET ((OMETA::V
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'OMETA::EXPRALL
                                                                          NIL)))
                                                                    (SETF OMETA::TAILEXPR
                                                                            OMETA::V)
                                                                    OMETA::V)))))))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:SPACES NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:TOKEN
                                                            (LIST "]")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           `(:FORM
                                                             ,OMETA::FORMEXPR
                                                             ,OMETA::TAILEXPR)))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:SPACES NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:TOKEN
                                                            (LIST "(")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:SPACES NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::EXPR
                                                                   NIL)))
                                                             (SETF OMETA::X
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:SPACES NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:TOKEN
                                                            (LIST ")")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           OMETA::X))))))))
(DEFMETHOD OMETA::EXPRALL ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::EXPR
                                                               NIL)))
                                      (SETF OMETA::X OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (PROGN
                                     (ASSERT (EQ (CAR OMETA::X) :OR))
                                     (ASSERT (EQ (CAR (CADR OMETA::X)) :AND))
                                     `(:AND-ALL ,@(CDADR OMETA::X))))))))
(DEFMETHOD OMETA::RULENAME ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::NAME
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:SPACES NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::TSSTRING
                                                            NIL)))))))))
(DEFMETHOD OMETA::RULE ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::XS OMETA::X OMETA::N)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::ONOT
                                                        (LAMBDA
                                                            (OMETA::O
                                                             OMETA::NULLARG)
                                                          (OMETA::OMETA-APPLY
                                                           OMETA::O
                                                           'OMETA::ONOT
                                                           (LAMBDA
                                                               (OMETA::O
                                                                OMETA::NULLARG)
                                                             (OMETA::OMETA-APPLY
                                                              OMETA::O
                                                              'OMETA::OOR
                                                              (LIST
                                                               (LAMBDA
                                                                   (OMETA::O
                                                                    OMETA::NULLARG)
                                                                 (OMETA::OMETA-APPLY
                                                                  OMETA::O
                                                                  'OMETA::OAND
                                                                  (LIST
                                                                   (LAMBDA
                                                                       (OMETA::O
                                                                        OMETA::NULLARG)
                                                                     (LET ((OMETA::V
                                                                            (OMETA::OMETA-APPLY
                                                                             OMETA::O
                                                                             'OMETA::RULENAME
                                                                             NIL)))
                                                                       (SETF OMETA::N
                                                                               OMETA::V)
                                                                       OMETA::V))))))))))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:SPACES
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::RULEPART
                                                               (LIST
                                                                OMETA::N))))
                                      (SETF OMETA::X OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::OMANY
                                                               (LAMBDA
                                                                   (OMETA::O
                                                                    OMETA::NULLARG)
                                                                 (OMETA::OMETA-APPLY
                                                                  OMETA::O
                                                                  'OMETA::OOR
                                                                  (LIST
                                                                   (LAMBDA
                                                                       (OMETA::O
                                                                        OMETA::NULLARG)
                                                                     (OMETA::OMETA-APPLY
                                                                      OMETA::O
                                                                      'OMETA::OAND
                                                                      (LIST
                                                                       (LAMBDA
                                                                           (OMETA::O
                                                                            OMETA::NULLARG)
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'OMETA:TOKEN
                                                                          (LIST
                                                                           ",")))
                                                                       (LAMBDA
                                                                           (OMETA::O
                                                                            OMETA::NULLARG)
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'OMETA:SPACES
                                                                          NIL))
                                                                       (LAMBDA
                                                                           (OMETA::O
                                                                            OMETA::NULLARG)
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'OMETA::RULEPART
                                                                          (LIST
                                                                           OMETA::N))))))))))))
                                      (SETF OMETA::XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (PROG1
                                        `(:RULE ,OMETA::N
                                          ,(OMETA::LOCALS OMETA::O)
                                          (:OR ,OMETA::X ,@OMETA::XS))
                                      (SETF (OMETA::LOCALS OMETA::O) NIL)))))))
(DEFMETHOD OMETA::RULEPART ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::B2 OMETA::B1 OMETA::N OMETA::RN)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V (POP OMETA::ARG)))
                                      (SETF OMETA::RN OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::RULENAME
                                                                   NIL)))
                                                             (SETF OMETA::N
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::OPRED
                                                            (EQUAL OMETA::N
                                                                   OMETA::RN)))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA:SPACES NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::EXPR4
                                                                   NIL)))
                                                             (SETF OMETA::B1
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::OOR
                                                            (LIST
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (OMETA::OMETA-APPLY
                                                                OMETA::O
                                                                'OMETA::OAND
                                                                (LIST
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   (OMETA::OMETA-APPLY
                                                                    OMETA::O
                                                                    'OMETA:SPACES
                                                                    NIL))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   (OMETA::OMETA-APPLY
                                                                    OMETA::O
                                                                    'OMETA:TOKEN
                                                                    (LIST
                                                                     "=")))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   (OMETA::OMETA-APPLY
                                                                    OMETA::O
                                                                    'OMETA:SPACES
                                                                    NIL))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   (LET ((OMETA::V
                                                                          (OMETA::OMETA-APPLY
                                                                           OMETA::O
                                                                           'OMETA::EXPR
                                                                           NIL)))
                                                                     (SETF OMETA::B2
                                                                             OMETA::V)
                                                                     OMETA::V))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   `(:AND
                                                                     ,OMETA::B1
                                                                     ,OMETA::B2)))))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (OMETA::OMETA-APPLY
                                                                OMETA::O
                                                                'OMETA::OAND
                                                                (LIST
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   (OMETA::OMETA-APPLY
                                                                    OMETA::O
                                                                    'OMETA::EMPTY
                                                                    NIL))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   OMETA::B1))))))))))))))
(DEFMETHOD OMETA::GRAMMAR ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (OMETA::RS OMETA::SN OMETA::N)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O
                                                        'OMETA::OKEYWORD
                                                        (LIST "ometa")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:SPACES
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::NAME
                                                               NIL)))
                                      (SETF OMETA::N OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:SPACES
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::OOR
                                                               (LIST
                                                                (LAMBDA
                                                                    (OMETA::O
                                                                     OMETA::NULLARG)
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::OAND
                                                                   (LIST
                                                                    (LAMBDA
                                                                        (OMETA::O
                                                                         OMETA::NULLARG)
                                                                      (OMETA::OMETA-APPLY
                                                                       OMETA::O
                                                                       'OMETA:TOKEN
                                                                       (LIST
                                                                        "<:")))
                                                                    (LAMBDA
                                                                        (OMETA::O
                                                                         OMETA::NULLARG)
                                                                      (OMETA::OMETA-APPLY
                                                                       OMETA::O
                                                                       'OMETA::NAME
                                                                       NIL)))))
                                                                (LAMBDA
                                                                    (OMETA::O
                                                                     OMETA::NULLARG)
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::OAND
                                                                   (LIST
                                                                    (LAMBDA
                                                                        (OMETA::O
                                                                         OMETA::NULLARG)
                                                                      (OMETA::OMETA-APPLY
                                                                       OMETA::O
                                                                       'OMETA::EMPTY
                                                                       NIL))
                                                                    (LAMBDA
                                                                        (OMETA::O
                                                                         OMETA::NULLARG)
                                                                      "OMeta"))))))))
                                      (SETF OMETA::SN OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:SPACES
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:TOKEN
                                                        (LIST "{")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::LISTOF
                                                               (LIST "rule"
                                                                     ","))))
                                      (SETF OMETA::RS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:SPACES
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:TOKEN
                                                        (LIST "}")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:GRAMMAR ,OMETA::N ,OMETA::SN
                                      ,@OMETA::RS))))))