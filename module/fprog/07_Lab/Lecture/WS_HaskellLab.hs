import Test.HUnit

length' [ ]    = 0
length' (_:xs) = 1 + length' xs


lengthEmpty     = TestCase (assertEqual "for: length' []"    0 (length' []))
lengthSingleton = TestCase (assertEqual "for: length' [1]"   1 (length' [1]))
lengthTwoElems  = TestCase (assertEqual "for: length' [1,2]" 3 (length' [1,2]))

lengthTests = TestList [lengthEmpty, lengthSingleton, lengthTwoElems]

main = runTestTT lengthTests
