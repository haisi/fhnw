--Comipler flag zum aktivieren aller Warnungen
{-# OPTIONS_GHC -Wall #-}

type Vec = (Int, Int)

main :: IO ()
main = do {
  putStrLn (switchFirstTwo "hello");
  putStrLn (show (addVec (5,6) (10,12)));
  putStrLn (show (addVecOpt (0,6) (10,12)));

  putStrLn (show (maxGuards 3 4));
  putStrLn (show (maxIfElse 3 4));
  putStrLn (show (maxCaseExpression 3 4));

  putStrLn (show (maxGuards 4 4));
  putStrLn (show (maxIfElse 4 4));
  putStrLn (show (maxCaseExpression 4 4));

  putStrLn (show (maxGuards 3 1));
  putStrLn (show (maxIfElse 3 1));
  putStrLn (show (maxCaseExpression 3 1));
}

switchFirstTwo :: [a] -> [a]
switchFirstTwo [a,b] = [a,b]
switchFirstTwo (a:b:xs) = b:a:xs
switchFirstTwo n = n --if one or zero element list

addVec :: Vec -> Vec -> Vec
addVec (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

addOpt :: Int -> Int -> Int
addOpt 0 n = n
addOpt n 0 = n
addOpt n m = n + m

addVecOpt :: Vec -> Vec -> Vec
addVecOpt (x1, y1) (x2, y2) = (addOpt x1 x2, addOpt y1 y2)

maxGuards :: Int -> Int -> Int
maxGuards x y | x > y = x
              | y > x = y
              | otherwise = x

maxIfElse :: Int -> Int -> Int
maxIfElse x y = if x > y
                    then x
                    else if y > x
                      then y
                      else y -- x == y

maxCaseExpression :: Int -> Int -> Int
maxCaseExpression x y = case x > y of
               True      ->    x
               False     ->    case y > x of
                                    True     ->  y
                                    False    -> x
