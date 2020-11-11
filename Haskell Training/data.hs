type Name = String
type Language = String
type University = String


data Person = Programmer Name Language | Student Name University deriving(Show)
-- Show -> Haskell Predefined Class

pr = Programmer "Jubileu" "Haskell"
st = Student "Zefinha" "UFCG"

isProgrammer :: Person -> Bool
isProgrammer (Programmer _ _) = True
isProgrammer _ = False

isStudent :: Person -> Bool
isStudent (Student _ _) = True
isStudent _ = False

