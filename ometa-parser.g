ometa ometa-parser <: ometa {
nameFirst = "_":x -> <<(aref x 0)>> | "$":x -> <<(aref x 0)>> | letter,
nameRest = nameFirst | digit | "-":x -> <<(aref x 0)>>,
tsName = firstAndRest("nameFirst", "nameRest"):xs -> << (coerce xs 'string)>>,
name = spaces tsName,
tsString = "FAIL",
okeyword :xs = token(xs) ~letterOrDigit,
characters = "''''",
sCharacters = stringquote (~stringquote anything)*:xs stringquote -> << `(:string ,(coerce xs 'string))>>,

osymbol = spaces "#" tsName:s -> << `(:app exactly (:symbol ,s))>>,
onumber = ("-" | empty -> ""):sign digit+:ds -> <<`(:app exactly ,(parse-integer (coerce ds 'string)))>>,
letterOrDigit = letter | digit,
args = "(" listof("hostExpr", ","):xs ")" -> xs | empty -> << nil >>,

application = spaces name:rule args:as -> <<`(:app ,rule ,@as)>>,
hostExpr = spaces (curlyHostExpr | atomicHostExpr),
curlyHostExpr = spaces "<<" (~">>" anything)*:xs ">>" -> << `(:act ,(coerce xs 'string)) >>,
atomicHostExpr = (sCharacters | name):x -> <<x>>,

semAction = spaces ("!" | "->") spaces (atomicHostExpr:x -> <<`(:act ,x)>>
            | spaces curlyHostExpr:x -> << x >>),
semPred = spaces "?" hostExpr:x -> <<`(:pred ,x)>>,
expr = listof("expr4", "|"):xs -> <<`(:or ,@xs)>>,
expr4 = (spaces expr3)*:xs -> << `(:and ,@xs)>>,
optIter :x = "*" -> <<`(:many ,x)>>
           | "+" -> <<`(:many1 ,x)>>
           | empty -> x,
expr3 = expr2:x optIter(x):x ( ":" name:n -> << (progn (pushnew (intern n) (locals o)) `(:set ,n ,x))>>
                               | empty -> x
                             )
        | spaces ":" name:n -> << (progn (pushnew (intern n) (locals o)) `(:set ,n (:loadarg)))>>,
expr2 = spaces "~" expr2:x -> <<`(:not ,x)>>
      | spaces "&" expr1:x -> << `(:lookahead ,x)>>
      | expr1,
expr1 = application | semAction | semPred
      | ( okeyword("undefined") | okeyword("nil")
        | okeyword("true") | okeyword("false")):x -> << `(:app 'exactly ,x)>>
      | spaces (characters | sCharacters:s -> <<`(:app token ,s)>> | osymbol | onumber)
      | spaces "[" spaces expr:formexpr spaces "]" -> <<`(:form ,formexpr)>>
      | spaces "(" spaces expr:x spaces ")" -> x,
ruleName = name | spaces tsString,
rule = &(ruleName:n) spaces rulePart(n):x ("," spaces rulePart(n))*:xs -> << (prog1 `(:rule ,n ,(locals o) (:or ,x ,@xs)) (setf (locals o) nil)) >>,
rulePart :rn = ruleName:n ?<<(equal n rn)>> spaces expr4:b1 (spaces "=" spaces expr:b2 -> << `(:and ,b1 ,b2) >> | empty -> b1),
grammar = okeyword("ometa") spaces name:n spaces ("<:" name | empty -> "OMeta"):sn spaces "{" listof("rule", ","):rs spaces "}" -> << `(:grammar ,n ,sn ,@rs) >>
}

