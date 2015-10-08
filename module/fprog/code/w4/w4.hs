--Comipler flag zum aktivieren aller Warnungen
{-# OPTIONS_GHC -Wall #-}

main :: IO ()
main = do {
  putStrLn "1a)_______";
  putStrLn (show (compareIfEl (12::Int) (3::Int)));

  putStrLn "1b)_______";
  putStrLn (show (compareGuards (12::Int) (300::Int)));

  putStrLn "1c)_______";
  putStrLn (show (compareCase (42::Int) (42::Int)));

  --putStrLn "2a)_______";
  -- pass list with at least one element
  --putStrLn (show (noMatchinPattern [1]));

  putStrLn "\n2b)_______";
  putStrLn (show (multipleMatchingPattern (1, ("A", 3))));

  putStrLn "\n3a)_______";
  putStrLn (show ( add2x2Matrix ((1,2),(3,4)) ((10,20),(30,40)) ));

  putStrLn "3b)_______";
  putStrLn (show ( sub2x2Matrix ((10,20),(30,40)) ((1,2),(3,4)) ));

  putStrLn "3c)_______";
  putStrLn (show ( scalar2x2Matrix ((10,20),(30,40)) 2 ));

  putStrLn "3d)_______";
  putStrLn (show ( multiply2x2Matrix ((1,2),(3,4)) ((10,20),(30,40)) ));
}

compareIfEl :: (Ord a) => a -> a -> Ordering
compareIfEl x y = if x > y
                     then GT::Ordering
                     else if x < y
                       then LT::Ordering
                       else EQ::Ordering

compareGuards :: (Ord a) => a -> a -> Ordering
compareGuards x y
   | x > y = GT :: Ordering
   | x < y = LT :: Ordering
   | otherwise = EQ :: Ordering

compareCase :: (Ord a) => a -> a -> Ordering
compareCase x y = case x > y of
                    True -> GT::Ordering
                    False -> case x < y of
                      True -> LT::Ordering
                      otherwise -> EQ::Ordering

{-
  2a: Non-exhaustive patterns in function MY_FUNCTION_NAME
  2b: Da Haskell von Oben nach Unten geht, beim Suchen der Matches,
      wird der erste Match genommen und der Rest wird übersprungen.
-}

noMatchinPattern :: [a] -> [a]
noMatchinPattern [] = error "Shouldn't be reached"

multipleMatchingPattern :: (Int, (String, Int)) -> String
multipleMatchingPattern (x, y) = "x and y"
multipleMatchingPattern (x, (t1, t2)) = "x and (t1, t2)"

-- Aufgabe 3 --
type M22 = ((Int, Int), (Int, Int))

add2x2Matrix :: M22 -> M22 -> M22
add2x2Matrix m1 m2 = matrixOperation m1 m2 (+)

sub2x2Matrix :: M22 -> M22 -> M22
sub2x2Matrix m1 m2 = matrixOperation m1 m2 (-)

scalar2x2Matrix :: M22 -> Int -> M22
scalar2x2Matrix matrix scalar = ((leftTopScalarProduct, rightTopScalarProduct), (leftBottomScalarProduct, rightBottomScalarProduct))
        where ( (topLeft, topRight), (bottomLeft, bottomRight) ) = matrix
              leftTopScalarProduct = scalar * topLeft
              rightTopScalarProduct = scalar * topRight
              leftBottomScalarProduct = scalar * bottomLeft
              rightBottomScalarProduct = scalar * bottomRight

multiply2x2Matrix :: M22 -> M22 -> M22
multiply2x2Matrix m1 m2 = matrixOperation m1 m2 (*)

-- Helper function to reduce duplicate code when making matrix operations
matrixOperation :: M22 -> M22 -> (Int -> Int -> Int) -> M22
matrixOperation m1 m2 operation = ((topLeftResult, topRightResult), (bottomLeftResult, bottomRightResult))
        where ( (m1TopLeft, m1TopRight), (m1BottomLeft, m1BottomRight) ) = m1
              ( (m2TopLeft, m2TopRight), (m2BottomLeft, m2BottomRight) ) = m2
              topLeftResult = operation m1TopLeft m2TopLeft
              topRightResult = operation m1TopRight m2TopRight
              bottomLeftResult = operation m1BottomLeft m2BottomLeft
              bottomRightResult = operation m1BottomRight m2BottomRight
