--Comipler flag zum aktivieren aller Warnungen
{-# OPTIONS_GHC -Wall #-}

main :: IO ()
main = do {
  putStrLn (show "Hello words");
}

-- 1. a)
{-
Operator                                Präzedenz
((f a) b) links                         10
(.) rechts                              9
(^) rechts                              8
(/) links                               7
(*) links                               7
(+) links                               6
(-) links                               6
(:) rechts                              5
(++) rechts                             5
(>=) infix                              4
(>) infix                               4
(<=) infix                              4
(<) infix                               4
(/=) infix                              4
(==) infix                              4
(&&) rechts                             3
(||) rechts                             2
-}
