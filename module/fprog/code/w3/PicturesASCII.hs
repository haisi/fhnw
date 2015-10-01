module PictureASCII where
import Data.Char

--------------------------------------------------------------------------------
-- 1) ASCII Pictures
--------------------------------------------------------------------------------

-- A Picture is a list of strings.
type Picture = [String]

-- An example picture. Design a nicer one.
lambda :: Picture
lambda = [
 "                   ",
 "     ####          ",
 "       ###         ",
 "        ###        ",
 "        ####       ",
 "       ## ###      ",
 "      ##   ###     ",
 "    ###     ###    ",
 "                   "]

-- Run 'main' to see an example.l
main :: IO ()
main = do {
  putStrLn "1a....................";
  printPicture (flipH lambda);

  putStrLn "1b....................";
  printPicture (flipV lambda);

  putStrLn "1c....................";
  printPicture (above lambda lambda);

  putStrLn "1d....................";
  printPicture (beside lambda lambda);

  putStrLn "\n2a....................";
  putStrLn (a2 '!' "Hallo");

  putStrLn "\n2b....................";
  putStrLn (b2 ['1','2','3','4','5','6','7']);
  putStrLn (show (b2 [1,2,3,4,5,6,7]::[Int]));

  putStrLn "\n2c....................";
  putStrLn (show (c2 5 ',' "Hallo Welt!"));

}

-- Prints the given picture to stdout.
printPicture :: Picture -> IO ()
printPicture p = putStr (unlines p)

-- a) Mirrors the given picture horizontally.
flipH :: Picture -> Picture
flipH pic = map reverse pic

-- b) Mirrors the given picture vertically.
-- hint = "Wrqr Mrvyr zhff frcneng hztrxrueg jreqra."
flipV :: Picture -> Picture
flipV pic = reverse pic

-- c) Takes two pictures and puts the first above the second.
-- hint = "Qnf fbyygra Fvr nhpu buar Uvysr uvaxevrtra."
above :: Picture -> Picture -> Picture
above picAbove picBelow = picAbove ++ picBelow

-- d) Takes two pictures and puts the first left of the second.
-- hint = "Irejraqra Fvr qvr Shaxgvba mvcJvgu hz wr mjrv Mrvyra mh xbaxngravrera."
beside :: Picture -> Picture -> Picture
beside picLeft picRight = zipWith (++) picLeft picRight

--------------------------------------------------------------------------------
-- 2) Functions on Lists
-- hint = "\65533oreyrtra Fvr fvpu mhrefg qvr Fvtanghe"
--------------------------------------------------------------------------------
-- a) Append an element at the end.
a2 :: a -> [a] -> [a]
a2 x y = y ++ [x]

-- b) Reverse all but the first and the last element.
b2 :: [a] -> [a]
b2 x = (head x) : (reverse (init (tail x))) ++ ([last x])

-- c) Insert an element at a given position.
c2 :: Int -> a -> [a] -> [a]
c2 i x y = (fst (splitAt i y)) ++ [x] ++ (snd (splitAt i y))


-- Functions to decode hints.
-- Usage: decodeHint "Mhrefg anpuqraxra, qnaa Gvccf nafpunhra =)"
decodeHint :: String -> String
decodeHint = map rot13
  where rot13 c
         | toLower c >= 'a' && toLower c <= 'm' = chr (ord c + 13)
         | toLower c >= 'n' && toLower c <= 'z' = chr (ord c - 13)
         | otherwise = c
