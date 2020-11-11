push :: [Int] -> Int -> [Int]
push stack x = [x] ++ stack

top :: [Int] -> Int
top [] = error "Empty Stack"
top (x:xs) = x

pop :: [Int] -> Int -> [Int]
pop [] _ = error "Empty Stack"
pop (x:xs) e | (e == x) = xs | otherwise = [x] ++ pop xs e

isEmpty :: [Int] -> Bool
isEmpty [] = True
isEmpty _ = False
