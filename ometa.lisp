
(DEFMETHOD OMETA::EMPTY ((OMETA::O OMETA:OMETA) OMETA::ARG)
           (LET ()
             T))
(DEFMETHOD OMETA::END ((OMETA::O OMETA:OMETA) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::ONOT
                                 (LAMBDA (OMETA::O OMETA::NULLARG)
                                   (OMETA::OMETA-APPLY OMETA::O 'ANYTHING
                                                       NIL)))))
(DEFMETHOD OMETA:EXACTLY ((OMETA::O OMETA:OMETA) OMETA::ARG)
           (LET (GOT WANT)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V (POP OMETA::ARG)))
                                      (SETF OMETA::WANT OMETA::V)
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
                                                                   'ANYTHING
                                                                   NIL)))
                                                             (SETF OMETA::GOT
                                                                     OMETA::V)
                                                             OMETA::V))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           (OMETA::OMETA-APPLY
                                                            OMETA::O
                                                            'OMETA::OPRED
                                                            (EQUAL WANT GOT)))
                                                         (LAMBDA
                                                             (OMETA::O
                                                              OMETA::NULLARG)
                                                           WANT))))))))
(DEFMETHOD OMETA:OCHAR ((OMETA::O OMETA:OMETA) OMETA::ARG)
           (LET (X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O
                                                               'ANYTHING NIL)))
                                      (SETF OMETA::X OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OPRED
                                                        (CHARACTERP X)))
                                  (LAMBDA (OMETA::O OMETA::NULLARG) X)))))
(DEFMETHOD OMETA:OSPACE ((OMETA::O OMETA:OMETA) OMETA::ARG)
           (LET (X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O 'OCHAR
                                                               NIL)))
                                      (SETF OMETA::X OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OPRED
                                                        (<= (CHAR-CODE X) 32)))
                                  (LAMBDA (OMETA::O OMETA::NULLARG) X)))))
(DEFMETHOD OMETA:SPACES ((OMETA::O OMETA:OMETA) OMETA::ARG)
           (LET ()
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OMANY
                                 (LAMBDA (OMETA::O OMETA::NULLARG)
                                   (OMETA::OMETA-APPLY OMETA::O 'OSPACE NIL)))))
(DEFMETHOD OMETA:LETTER ((OMETA::O OMETA:OMETA) OMETA::ARG)
           (LET (X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O 'OCHAR
                                                               NIL)))
                                      (SETF OMETA::X OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OPRED
                                                        (ALPHA-CHAR-P X)))
                                  (LAMBDA (OMETA::O OMETA::NULLARG) X)))))
(DEFMETHOD OMETA:DIGIT ((OMETA::O OMETA:OMETA) OMETA::ARG)
           (LET (X)
             (OMETA::OMETA-APPLY OMETA::O 'OMETA::OAND
                                 (LIST
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (LET ((OMETA::V
                                           (OMETA::OMETA-APPLY OMETA::O 'OCHAR
                                                               NIL)))
                                      (SETF OMETA::X OMETA::V)
                                      OMETA::V))
                                  (LAMBDA (OMETA::O OMETA::NULLARG)
                                    (OMETA::OMETA-APPLY OMETA::O 'OMETA::OPRED
                                                        (DIGIT-CHAR-P X)))
                                  (LAMBDA (OMETA::O OMETA::NULLARG) X)))))