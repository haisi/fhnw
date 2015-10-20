--Comipler flag zum aktivieren aller Warnungen
{-# OPTIONS_GHC -Wall #-}

main :: IO ()
main = do {
  putStrLn (show (countDown 10));
  putStrLn (show (countUp 10));
  putStrLn (show (countDownUp 10));

  putStrLn (show (len [1,2,3,4,5]));
  putStrLn (show (allTrue [True, False, True]));
  putStrLn (show ((+++) [1,2,3] [4,5,6]));
}

countDown :: Int -> [Int]
countDown 0 = [0]
countDown n = n : countDown (n - 1)

countUp :: Int -> [Int]
-- countUp n = reverse (countDown n)
countUp 0 = [0]
countUp n = countUp (n - 1) ++ [n]

countDownUp :: Int -> [Int]
-- countDownUp n = countDown n ++ tail (countUp n)
countDownUp 0 = [0]
countDownUp n = n : countDownUp (n - 1) ++ [n]

len :: [a] -> Int
len [] = 0
len (x:xs) = 1 + (len xs)

allTrue :: [Bool] -> Bool
allTrue [] = False
allTrue [x] = x
allTrue (x:xs) = x && allTrue xs

sublist :: Int -> Int -> [a] -> [a]
sublist x y [] = []
-- sublist x y myList =

(+++) :: [a] -> [a] -> [a]
(+++) [] [] = []
(+++) (x:xs) (y:ys) = x : (+++) xs ys ++ (+++) ys [x]
