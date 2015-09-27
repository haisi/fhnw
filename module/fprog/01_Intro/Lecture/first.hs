-- Das erste Haskell Script

size :: Integer
size = (4 - 3) * 2

-- Gibt den doppelten Wert zurück
times2 :: Integer -> Integer
times2 x = 2 * x                -- (t2)

-- Quadriert den Wert
square :: Integer -> Integer
square x = x * x                -- (sqr)

-- Pythagoras a^2 + b^2 = c^2
pyth :: Integer -> Integer -> Integer
pyth a b = square a + square b  -- (py)
