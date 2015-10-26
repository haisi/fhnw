--Comipler flag zum aktivieren aller Warnungen
--{-# OPTIONS_GHC -Wall #-}

main :: IO ()
main = do {
  putStrLn ("Hello");
  putStrLn (show (pipe (3, "Three")));
  putStrLn (show (drop' 2 "Hello"));
  putStrLn (show (take' 2 "Hello"));
  putStrLn (show (zip' [1,2,3] ['a', 'b']));
  putStrLn (show (elem' 3 [1,2,3]));
  putStrLn (show (elem' 3 [1,2,4]));
  putStrLn (show (eqList [1,2,4] [1,2,4]));
  putStrLn (show (eqList [1,2,4] [1,2,4, 5]));
  putStrLn (show (eqList [1,2,4] [1,2,3]));

  putStrLn (show (words' "Hallo World wie gehts"));

}

(|>) :: (a -> b) -> (b -> c) -> a -> c
(|>) f1 f2 x = f2 (f1 x)

pipe :: (Int, a) -> Bool
pipe x = (fst |> (*2) |> even) x

drop' :: Int -> [a] -> [a]
drop' 0 x = x
drop' i (x:xs) = (drop' (i-1) xs) ++ []

take' :: Int -> [a] -> [a]
take' 0 x = x
take' i (x:xs) = x : (take (i-1) xs)

zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x, y) : (zip' xs ys)

elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' a (x:xs) = (a == x) || elem' a xs

eqList :: Eq a => [a] -> [a] -> Bool
eqList [] [] = True
eqList x [] = False
eqList [] y = False
eqList (x:xs) (y:ys) = (x == y) && eqList xs ys

words' :: String -> [String]
words' [] = []
words' (x:xs) = if x == ' '
                  then [x] : words' xs
                  else words' xs
