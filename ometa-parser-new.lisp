
(DEFMETHOD OMETA::NAMEFIRST ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (X)
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
                                                                   'OMETA:TOKEN
                                                                   (LIST "_"))))
                                                             (SETF OMETA::X
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (AREF X 0)))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA:TOKEN
                                                                   (LIST "$"))))
                                                             (SETF OMETA::X
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (AREF X 0)))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'LETTER
                                                        NIL))))))
(DEFMETHOD OMETA::NAMEREST ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'NAMEFIRST
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'DIGIT NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA:TOKEN
                                                                   (LIST "-"))))
                                                             (SETF OMETA::X
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (AREF X 0)))))))))
(DEFMETHOD OMETA::TSNAME ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (XS)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'FIRSTANDREST
                                                               (LIST
                                                                "nameFirst"
                                                                "nameRest"))))
                                      (SETF OMETA::XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (COERCE XS 'STRING))))))
(DEFMETHOD OMETA::NAME ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'TSNAME
                                                        NIL))))))
(DEFMETHOD OMETA::OKEYWORD ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (XS)
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
                                                            OMETA::O 'TOKEN
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
                                                               'LETTERORDIGIT
                                                               NIL)))))))))))
(DEFMETHOD OMETA::CHARACTERS ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA:TOKEN (LIST "''''"))))
(DEFMETHOD OMETA::SCHARACTERS ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (XS)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'STRINGQUOTE
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
                                                                             'STRINGQUOTE
                                                                             NIL))))
                                                                       (LAMBDA
                                                                           (OMETA::O
                                                                            OMETA::NULLARG)
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'ANYTHING
                                                                          NIL)))))))))))
                                      (SETF OMETA::XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'STRINGQUOTE
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:STRING ,(COERCE XS 'STRING)))))))
(DEFMETHOD OMETA::ONUMBER ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (DS SIGN)
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
                                                                       'EMPTY
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
                                                                  'DIGIT
                                                                  NIL)))))
                                      (SETF OMETA::DS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:APP EXACTLY
                                      ,(PARSE-INTEGER (COERCE DS 'STRING))))))))
(DEFMETHOD OMETA::LETTERORDIGIT ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'LETTER NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'DIGIT
                                                        NIL))))))
(DEFMETHOD OMETA::ARGS ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (XS)
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
                                                            'OMETA:TOKEN
                                                            (LIST "(")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'LISTOF
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
                                                            'OMETA:TOKEN
                                                            (LIST ")")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           XS))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'EMPTY
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           NIL))))))))
(DEFMETHOD OMETA::APPLICATION ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (AS RULE)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O 'NAME
                                                               NIL)))
                                      (SETF OMETA::RULE OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O 'ARGS
                                                               NIL)))
                                      (SETF OMETA::AS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:APP ,RULE ,@AS))))))
(DEFMETHOD OMETA::HOSTEXPR ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'CURLYHOSTEXPR
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'ATOMICHOSTEXPR
                                                            NIL)))))))))
(DEFMETHOD OMETA::CURLYHOSTEXPR ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (XS)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'SPACES NIL))
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
                                                                          'ANYTHING
                                                                          NIL)))))))))))
                                      (SETF OMETA::XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:TOKEN
                                                        (LIST ">>")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:ACT ,(COERCE XS 'STRING)))))))
(DEFMETHOD OMETA::ATOMICHOSTEXPR ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (X)
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
                                                                       'SCHARACTERS
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
                                                                       'NAME
                                                                       NIL)))))))))
                                      (SETF OMETA::X OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG) X)))))
(DEFMETHOD OMETA::SEMACTION ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'SPACES NIL))
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
                                    (OMETA::OMETA-APPLY OMETA::O 'SPACES NIL))
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
                                                                       'ATOMICHOSTEXPR
                                                                       NIL)))
                                                                 (SETF OMETA::X
                                                                         OMETA::V)
                                                                 OMETA::V))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               `(:ACT ,X)))))
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
                                                                'SPACES NIL))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (LET ((OMETA::V
                                                                      (OMETA::OMETA-APPLY
                                                                       OMETA::O
                                                                       'CURLYHOSTEXPR
                                                                       NIL)))
                                                                 (SETF OMETA::X
                                                                         OMETA::V)
                                                                 OMETA::V))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               X)))))))))))
(DEFMETHOD OMETA::SEMPRED ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:TOKEN
                                                        (LIST "?")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'HOSTEXPR NIL)))
                                      (SETF OMETA::X OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:PRED ,X))))))
(DEFMETHOD OMETA::EXPR ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (XS)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O 'LISTOF
                                                               (LIST "expr4"
                                                                     "|"))))
                                      (SETF OMETA::XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:OR ,@XS))))))
(DEFMETHOD OMETA::EXPR4 ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (XS)
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
                                                                          'SPACES
                                                                          NIL))
                                                                       (LAMBDA
                                                                           (OMETA::O
                                                                            OMETA::NULLARG)
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'EXPR3
                                                                          NIL)))))))))))
                                      (SETF OMETA::XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:AND ,@XS))))))
(DEFMETHOD OMETA::OPTITER ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (X)
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
                                                               `(:MANY ,X)))))
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
                                                               `(:MANY1 ,X)))))
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
                                                                OMETA::O 'EMPTY
                                                                NIL))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               X)))))))))))
(DEFMETHOD OMETA::EXPR3 ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (N X)
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
                                                                   'EXPR2 NIL)))
                                                             (SETF OMETA::X
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OPTITER
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
                                                                           'NAME
                                                                           NIL)))
                                                                     (SETF OMETA::N
                                                                             OMETA::V)
                                                                     OMETA::V))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   (PROGN
                                                                    (PUSHNEW
                                                                     (INTERN N)
                                                                     (LOCALS
                                                                      O))
                                                                    `(:SET ,N
                                                                      ,X))))))
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
                                                                    'EMPTY
                                                                    NIL))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   X))))))))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'SPACES
                                                            NIL))
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
                                                                   'NAME NIL)))
                                                             (SETF OMETA::N
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (PROGN
                                                            (PUSHNEW (INTERN N)
                                                                     (LOCALS
                                                                      O))
                                                            `(:SET ,N
                                                              (:LOADARG)))))))))))
(DEFMETHOD OMETA::EXPR2 ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'SPACES
                                                            NIL))
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
                                                                   'EXPR2 NIL)))
                                                             (SETF OMETA::X
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           `(:NOT ,X)))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'SPACES
                                                            NIL))
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
                                                                   'EXPR1 NIL)))
                                                             (SETF OMETA::X
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           `(:LOOKAHEAD ,X)))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'EXPR1
                                                        NIL))))))
(DEFMETHOD OMETA::EXPR1 ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (S X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'APPLICATION
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'SEMACTION
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'SEMPRED NIL))
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
                                                                           'OKEYWORD
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
                                                                           'OKEYWORD
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
                                                                           'OKEYWORD
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
                                                                           'OKEYWORD
                                                                           (LIST
                                                                            "false"))))))))))
                                                             (SETF OMETA::X
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           `(:APP 'EXACTLY
                                                             ,X)))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'SPACES
                                                            NIL))
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
                                                                'CHARACTERS
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
                                                                           'SCHARACTERS
                                                                           NIL)))
                                                                     (SETF OMETA::S
                                                                             OMETA::V)
                                                                     OMETA::V))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   `(:APP TOKEN
                                                                     ,S)))))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (OMETA::OMETA-APPLY
                                                                OMETA::O
                                                                'ONUMBER
                                                                NIL))))))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'SPACES
                                                            NIL))
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
                                                            OMETA::O 'SPACES
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'EXPR NIL)))
                                                             (SETF OMETA::X
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'SPACES
                                                            NIL))
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
                                                           X))))))))
(DEFMETHOD OMETA::RULENAME ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'NAME NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'SPACES
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'TSSTRING
                                                            NIL)))))))))
(DEFMETHOD OMETA::RULE ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (XS X N)
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
                                                                             'RULENAME
                                                                             NIL)))
                                                                       (SETF OMETA::N
                                                                               OMETA::V)
                                                                       OMETA::V))))))))))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'RULEPART
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
                                                                          'SPACES
                                                                          NIL))
                                                                       (LAMBDA
                                                                           (OMETA::O
                                                                            OMETA::NULLARG)
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'RULEPART
                                                                          (LIST
                                                                           OMETA::N))))))))))))
                                      (SETF OMETA::XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (PROG1
                                        `(:RULE ,N ,(LOCALS O) (:OR ,X ,@XS))
                                      (SETF (LOCALS O) NIL)))))))
(DEFMETHOD OMETA::RULEPART ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (B2 B1 N RN)
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
                                                                   'RULENAME
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
                                                            (EQUAL N RN)))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'SPACES
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'EXPR4 NIL)))
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
                                                                    'SPACES
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
                                                                    'SPACES
                                                                    NIL))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   (LET ((OMETA::V
                                                                          (OMETA::OMETA-APPLY
                                                                           OMETA::O
                                                                           'EXPR
                                                                           NIL)))
                                                                     (SETF OMETA::B2
                                                                             OMETA::V)
                                                                     OMETA::V))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   `(:AND ,B1
                                                                     ,B2)))))
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
                                                                    'EMPTY
                                                                    NIL))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   B1))))))))))))))
(DEFMETHOD OMETA::GRAMMAR ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (RS SN N)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OKEYWORD
                                                        (LIST "ometa")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O 'NAME
                                                               NIL)))
                                      (SETF OMETA::N OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'SPACES NIL))
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
                                                                       'NAME
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
                                                                       'EMPTY
                                                                       NIL))
                                                                    (LAMBDA
                                                                        (OMETA::O
                                                                         OMETA::NULLARG)
                                                                      "OMeta"))))))))
                                      (SETF OMETA::SN OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:TOKEN
                                                        (LIST "{")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O 'LISTOF
                                                               (LIST "rule"
                                                                     ","))))
                                      (SETF OMETA::RS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:TOKEN
                                                        (LIST "}")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:GRAMMAR ,N ,SN ,@RS))))))