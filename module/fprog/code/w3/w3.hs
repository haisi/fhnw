--1 a)
printPicture (map reverse lambda)

--1 b)
printPicture (reverse lambda)

--1 c)
printPicture (lambda ++ lambda )

--1 d)
printPicture (zipWith (++) lambda lambda )

--1 e) fleiss aufgabe....

--2 a)
a2 :: a -> [a] -> [a]
a2 x y = y ++ [x]

--2 b)
b2 :: [a] -> [a]
b2 x = (head x) : (reverse (init (tail x))) ++ ([last x])

--2 c)
c2 :: Int -> a -> [a] -> [a]
c2 i x y = (fst (splitAt i y)) ++ [x] ++ (snd (splitAt i y))