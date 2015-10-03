#Functional programming in Haskell
##ghci basics
Commend  | Effect
------------- | -------------
:?  | Zeigt den Hilfetext an
:cd /path/to  | Wechselt das Arbeitsverzeichnis auf /path/to
:l script.hs  | Lädt script.hs
:r  | lädt das aktuelle script neu
:t expr  | Zeigt den typ des Ausdrucks expr.
:q  | quit
:i type  | gibt type-info
:set +t  | gibt immer type-info zurück
:set prompt "ghci> "  | Ändert prompt

##Haskell

###Basic types


- Bool
	- True und False
	- a && b
	- a || b
	- not a
- Char 'a'
- Int
	- -2^63 to 2^63-1
	- normally 64bits
- Integer
	- ALL integer
	- Can be as big as memory allows
- Double


###Functions

```haskell

	sum :: Int -> Int -> Int    --Method name :: Param -> Param -> returns
	sum x y = x + y

```

####Pattern matching

```haskell

	-- create method that takes a Color-enum returns a ToDo-enum
	-- which enum will be return, is decided by pattern matching (e.g. fancy switch-case)
	atTrafficLight :: Color - > ToDo
	atTrafficLight Red = Stop
	atTrafficLight Yellow = Wait
	atTrafficLight Green = Go

	atTrafficLight Yello -- return Wait :: ToDo

```

###Tuples

####type synonyms
Can be used to introduce a new name (a synonym) for an existing type

```haskell

	-- This is NOT a knew type, only a name!
	type Coordinate = (Int, Int)

	-- Create function to get x-coordinate from coordinate tuple
	xCoordinate :: Coordinate -> Int
	xCoordinate (x, y) = x

	-- create time tuple
	time :: (Int, Int)
	time = (23, 59)

	-- call xCoordinate func. and pass time tuple
	-- this will compile, because time is also (Int, Int)
	-- So the compile doesn't help us here
	xCoordinate time

```


###Enums
```haskell

	-- dervies from (Show) to "toSting"
	data Color = Red | Yello | Green deriving (Show)

```

##Lists
```haskell
	
	let x = [1,2,3] :: Int
	let y = [] :: Int
	let z = [5] :: Int
	
	length x -- returns 3
	length y -- returns 0

	null x -- false
	null y -- true

	head x -- return 1 :: Int, NOT [1] :: [Int]!
	head y -- runtime error

	tail x -- return [2,3] :: [Int]
	tail y -- exception empty list
	tail z -- return [] :: [Int]

	head x -- 1
	head y -- exception empty list
	head z -- 5

	last x -- 3
	last y -- exception empty list
	last z -- 5

	let myNumbers = [0..500] :: [Int]
	take 3 myNumbers -- returns [0,1,2,3] :: [Int]
	

```

#General
##IDE
Use the github atom IDE with the haskell plugins.