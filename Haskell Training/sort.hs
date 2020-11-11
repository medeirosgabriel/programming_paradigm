import Data.List

l1 = sort [310,44,98,90]

type Name = String
type Language = String
data Person = Programmer Name Language deriving (Show, Eq, Ord)

p1 = Programmer "John" "Haskell"
p2 = Programmer "Livia" "Python"
p3 = Programmer "Naomi" "Java"

l2 = sort [p1,p2,p3]