ometa ometa <: ometa-prim {
empty = -> << t >>,
end = ~anything,
exactly :want = anything:got ?<<(equal want got)>> -> <<want>>,
ochar = anything:x ?<<(characterp x)>> -> <<x>>,
ospace = ochar:x ?<<(<= (char-code x) 32)>> -> <<x>>,
spaces = ospace*,
letter = ochar:x ?<<(alpha-char-p x)>> -> <<x>>,
digit =  ochar:x ?<<(digit-char-p x)>> -> <<x>>
}


