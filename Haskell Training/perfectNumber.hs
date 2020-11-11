-- A perfect number is equal to the sum of all its divisors

getDivisors :: Int -> [Int]
getDivisors n = [x | x <- [1 .. n-1], (mod n x) == 0]

isPerfect :: Int -> Bool
isPerfect n | ((sum (getDivisors n)) == n) = True
            | otherwise = False

getPerfects :: Int -> [Int]
getPerfects n = [x | x <- [1 .. n], (isPerfect x) == True]
