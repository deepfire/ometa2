(DEFMETHOD OMETA::NAMEFIRST ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::LETTER NIL)))

(DEFMETHOD OMETA::NAMEREST ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::NAMEFIRST NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::DIGIT NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:EXACTLY
                                                        (LIST #\-)))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:EXACTLY
                                                        (LIST #\!)))))))

(DEFMETHOD OMETA::TSNAME ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (XS)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::FIRSTANDREST
                                                               (LIST
                                                                "nameFirst"
                                                                "nameRest"))))
                                      (SETF XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (COERCE XS 'STRING))))))

(DEFMETHOD OMETA::NAME ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::TSNAME
                                                        NIL))))))
(DEFMETHOD OMETA::TSSTRING ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::TOKEN (LIST "FAIL"))))
(DEFMETHOD OMETA::OKEYWORD ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (XS)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V (POP OMETA::ARG)))
                                      (SETF XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'OMETA::TOKEN
                                                            (LIST XS)))
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
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::TOKEN (LIST "''''"))))
(DEFMETHOD OMETA::SCHARACTERS ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (XS)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::STRINGQUOTE
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
                                                                          'OMETA::ANYTHING
                                                                          NIL)))))))))))
                                      (SETF XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::STRINGQUOTE
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:STRING ,(COERCE XS 'STRING)))))))
(DEFMETHOD OMETA::OSYMBOL ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (S)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA:TOKEN
                                                        (LIST "#")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O 'OMETA::TSNAME
                                                               NIL)))
                                      (SETF S OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:APP OMETA::EXACTLY (:SYMBOL ,S)))))))
(DEFMETHOD OMETA::CHAR-LITERAL ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (D)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::TOKEN
                                                        (LIST "$")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::ANYTHING NIL)))
                                      (SETF D OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:APP OMETA::EXACTLY (:CHARACTER ,D)))))))
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
                                                                       'OMETA::TOKEN
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
                                      (SETF SIGN OMETA::V)
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
                                                                  'OMETA::DIGIT
                                                                  NIL)))))
                                      (SETF DS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:APP OMETA::EXACTLY
                                      ,(PARSE-INTEGER (COERCE DS 'STRING))))))))
(DEFMETHOD OMETA::LETTERORDIGIT ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::LETTER NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::DIGIT
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
                                                            'OMETA::EXACTLY
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
                                                             (SETF XS OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::EXACTLY
                                                            (LIST #\))))
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
                                                            OMETA::O 'OMETA::EMPTY
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
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O 'OMETA::NAME
                                                               NIL)))
                                      (SETF RULE OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O 'OMETA::ARGS
                                                               NIL)))
                                      (SETF AS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:APP ,RULE ,@AS))))))
(DEFMETHOD OMETA::HOSTEXPR ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::SPACES NIL))
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
           (LET (XS)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::TOKEN
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
                                                                             'OMETA::TOKEN
                                                                             (LIST
                                                                              ">>")))))
                                                                       (LAMBDA
                                                                           (OMETA::O
                                                                            OMETA::NULLARG)
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'OMETA::ANYTHING
                                                                          NIL)))))))))))
                                      (SETF XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::TOKEN
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
                                      (SETF X OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG) X)))))
(DEFMETHOD OMETA::SEMACTION ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::TOKEN
                                                            (LIST "!")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::TOKEN
                                                            (LIST "->"))))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::SPACES NIL))
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
                                                                 (SETF X OMETA::V)
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
                                                                'OMETA::SPACES NIL))
                                                             (LAMBDA
                                                                 (OMETA::O
                                                                  OMETA::NULLARG)
                                                               (LET ((OMETA::V
                                                                      (OMETA::OMETA-APPLY
                                                                       OMETA::O
                                                                       'OMETA::CURLYHOSTEXPR
                                                                       NIL)))
                                                                 (SETF X OMETA::V)
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
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::TOKEN
                                                        (LIST "?")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::HOSTEXPR NIL)))
                                      (SETF X OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:PRED ,X))))))
(DEFMETHOD OMETA::EXPR ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (XS)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O 'OMETA::LISTOF
                                                               (LIST "expr4"
                                                                     "|"))))
                                      (SETF XS OMETA::V)
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
                                                                          'OMETA::SPACES
                                                                          NIL))
                                                                       (LAMBDA
                                                                           (OMETA::O
                                                                            OMETA::NULLARG)
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'OMETA::EXPR3
                                                                          NIL)))))))))))
                                      (SETF XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:AND ,@XS))))))
(DEFMETHOD OMETA::OPTITER ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V (POP OMETA::ARG)))
                                      (SETF X OMETA::V)
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
                                                                'OMETA::TOKEN
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
                                                                'OMETA::TOKEN
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
                                                                OMETA::O 'OMETA::EMPTY
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
                                                                   'OMETA::EXPR2 NIL)))
                                                             (SETF X OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::OPTITER
                                                                   (LIST X))))
                                                             (SETF X OMETA::V)
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
                                                                    'OMETA::TOKEN
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
                                                                     (SETF N OMETA::V)
                                                                     OMETA::V))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   (PROGN
                                                                    (PUSHNEW
                                                                     (INTERN N)
                                                                     (OMETA::LOCALS
                                                                      OMETA::O))
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
                                                                    'OMETA::EMPTY
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
                                                            OMETA::O 'OMETA::SPACES
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::TOKEN
                                                            (LIST ":")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::NAME NIL)))
                                                             (SETF N OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (PROGN
                                                            (PUSHNEW (INTERN N)
                                                                     (OMETA::LOCALS
                                                                      OMETA::O))
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
                                                            OMETA::O 'OMETA::SPACES
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::TOKEN
                                                            (LIST "~")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::EXPR2 NIL)))
                                                             (SETF X OMETA::V)
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
                                                            OMETA::O 'OMETA::SPACES
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::TOKEN
                                                            (LIST "&")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::EXPR1 NIL)))
                                                             (SETF X OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           `(:LOOKAHEAD ,X)))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::EXPR1
                                                        NIL))))))
(DEFMETHOD OMETA::EXPR1 ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (TAILEXPR FORMEXPR S X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::APPLICATION
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::SEMACTION
                                                        NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::SEMPRED NIL))
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
                                                             (SETF X OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           `(:APP 'OMETA::EXACTLY
                                                             ,X)))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'OMETA::SPACES
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
                                                                     (SETF S OMETA::V)
                                                                     OMETA::V))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   `(:APP OMETA::TOKEN
                                                                     ,S)))))
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
                                                                'OMETA::OSYMBOL NIL))
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
                                                            OMETA::O 'OMETA::SPACES
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::TOKEN
                                                            (LIST "[")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'OMETA::SPACES
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::EXPRALL
                                                                   NIL)))
                                                             (SETF FORMEXPR OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'OMETA::SPACES
                                                            NIL))
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
                                                                   'OMETA::TOKEN
                                                                   (LIST "/")))
                                                                (LAMBDA
                                                                    (OMETA::O
                                                                     OMETA::NULLARG)
                                                                  (LET ((OMETA::V
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'OMETA::EXPRALL
                                                                          NIL)))
                                                                    (SETF TAILEXPR OMETA::V)
                                                                    OMETA::V)))))))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'OMETA::SPACES
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::TOKEN
                                                            (LIST "]")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           `(:FORM ,FORMEXPR
                                                             ,TAILEXPR)))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'OMETA::SPACES
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::TOKEN
                                                            (LIST "(")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'OMETA::SPACES
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::EXPR NIL)))
                                                             (SETF X OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'OMETA::SPACES
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::TOKEN
                                                            (LIST ")")))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           X))))))))
(DEFMETHOD OMETA::EXPRALL ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O 'OMETA::EXPR
                                                               NIL)))
                                      (SETF X OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (PROGN
                                     (ASSERT (EQ (CAR X) :OR))
                                     (ASSERT (EQ (CAR (CADR X)) :AND))
                                     `(:AND-ALL ,@(CDADR X))))))))
(DEFMETHOD OMETA::RULENAME ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OOR
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::NAME NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                                        (LIST
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'OMETA::SPACES
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O 'OMETA::TSSTRING
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
                                                                             'OMETA::RULENAME
                                                                             NIL)))
                                                                       (SETF N OMETA::V)
                                                                       OMETA::V))))))))))))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'OMETA::RULEPART
                                                               (LIST N))))
                                      (SETF X OMETA::V)
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
                                                                          'OMETA::TOKEN
                                                                          (LIST
                                                                           ",")))
                                                                       (LAMBDA
                                                                           (OMETA::O
                                                                            OMETA::NULLARG)
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'OMETA::SPACES
                                                                          NIL))
                                                                       (LAMBDA
                                                                           (OMETA::O
                                                                            OMETA::NULLARG)
                                                                         (OMETA::OMETA-APPLY
                                                                          OMETA::O
                                                                          'OMETA::RULEPART
                                                                          (LIST N))))))))))))
                                      (SETF XS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (PROG1
                                        `(:RULE ,N ,(OMETA::LOCALS OMETA::O) (:OR ,X ,@XS))
                                      (SETF (OMETA::LOCALS OMETA::O) NIL)))))))
(DEFMETHOD OMETA::RULEPART ((OMETA::O OMETA:OMETA-PARSER) OMETA::ARG)
           (LET (B2 B1 N RN)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V (POP OMETA::ARG)))
                                      (SETF RN OMETA::V)
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
                                                             (SETF N OMETA::V)
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
                                                            OMETA::O 'OMETA::SPACES
                                                            NIL))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (LET ((OMETA::V
                                                                  (OMETA::OMETA-APPLY
                                                                   OMETA::O
                                                                   'OMETA::EXPR4 NIL)))
                                                             (SETF B1 OMETA::V)
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
                                                                    'OMETA::SPACES
                                                                    NIL))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   (OMETA::OMETA-APPLY
                                                                    OMETA::O
                                                                    'OMETA::TOKEN
                                                                    (LIST
                                                                     "=")))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   (OMETA::OMETA-APPLY
                                                                    OMETA::O
                                                                    'OMETA::SPACES
                                                                    NIL))
                                                                 (LAMBDA
                                                                     (OMETA::O
                                                                      OMETA::NULLARG)
                                                                   (LET ((OMETA::V
                                                                          (OMETA::OMETA-APPLY
                                                                           OMETA::O
                                                                           'OMETA::EXPR
                                                                           NIL)))
                                                                     (SETF B2 OMETA::V)
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
                                                                    'OMETA::EMPTY
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
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OKEYWORD
                                                        (LIST "ometa")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O 'OMETA::NAME
                                                               NIL)))
                                      (SETF N OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::SPACES NIL))
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
                                                                       'OMETA::TOKEN
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
                                      (SETF SN OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::TOKEN
                                                        (LIST "{")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O 'OMETA::LISTOF
                                                               (LIST "rule"
                                                                     ","))))
                                      (SETF RS OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::SPACES NIL))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::TOKEN
                                                        (LIST "}")))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    `(:GRAMMAR ,N ,SN ,@RS))))))
