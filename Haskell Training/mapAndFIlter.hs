l1 = map (+1) [1,2,3,4]
l2 = [x + 1 | x <- [1..4]]
l3 = filter (>5) [3..8]

isPrime :: Int -> Bool
isPrime 1 = True
isPrime 2 = False
isPrime n | (length [x | x <- [2 .. n-1], mod n x == 0]) == 0 = True | otherwise = False

allPrimes :: Int -> [Int]
allPrimes n = filter isPrime [1..n]