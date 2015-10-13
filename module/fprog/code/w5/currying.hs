--Comipler flag zum aktivieren aller Warnungen
{-# OPTIONS_GHC -Wall #-}

main :: IO ()
main = do {
  putStrLn (show (incAll [1,2,3]));
  putStrLn (show (addToAll 2 [1,2,3]));
  putStrLn (show (keepOld [1,2,3, 90, 99]));
  putStrLn (show (dropShort ["ABC","DF", "K", "asfsdf"]));
}

incAll :: [Int] -> [Int]
incAll intList = (map (\e -> e + 1) intList)

addToAll :: Int -> [Int] -> [Int]
addToAll a b = map (\e -> e + a) b

keepOld :: [Int] -> [Int]
keepOld a = filter (\e -> e > 89) a

dropShort :: [String] -> [String]
dropShort s = filter (\e -> not (length e == 1)) s
