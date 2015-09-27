type Person = (String, String, Int)

name :: Person -> String
name (n, p, a) = n

teacher :: Person
teacher = ("Daniel Kröni", "056 202 78 17", 35)

me :: Person
me = ("Hasan Kara", "078...", 19)

phone :: Person -> String
phone (_, p, _) = p --Use wildcards for params I don't care about

age :: Person -> Int
age (n, p, a) = a

first :: (a, b, c) -> a
first (x, _, _) = x

seoncd :: (a, b, c) -> b
seoncd (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z
