-- Concatenate two lists

conc :: [a] -> [a] -> [a]
conc [] b = b
conc a [] = a
conc a b = a ++ b

-- Invert a list

invert :: [a] -> [a]
invert [x] = [x]
invert (x:xs) = invert(xs) ++ [x]

-- Generate a list

generate :: Int -> [Int]
generate 0 = []
generate x = generate (x - 1) ++ [x] 

-- Sum the elements of a list

sum_elements :: [Int] -> Int
sum_elements [x] = x
sum_elements (x:xs) = x + sum_elements xs

-- Simulating a BD

type Person = String
type Car = String
type Age = Int
type Register = (Person, Car, Age)
type DB = [Register]

db :: DB
db = [("Tadeu", "Ferrari", 50), ("Karen", "Porsche", 70)]

getName :: Register -> Person
getName (n,_,_) = n

getCars :: [Register] -> [Car]
getCars [] = []
getCars ((_,car,_):xs) = [car] ++ (getCars xs)
