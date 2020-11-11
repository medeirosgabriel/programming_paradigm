l_ :: [Int]
l_ = [4,5,7,9,10,21,-3,4]

getSmaller :: [Int] -> Int
getSmaller [x] = x
getSmaller (x:xs) | (x < (getSmaller xs)) = x | otherwise = getSmaller xs

removeElement :: Int -> [Int] -> [Int]
removeElement _ [] = []
removeElement e (x:xs) | (x == e) = xs | otherwise = ([x] ++ (removeElement e xs))

sort_ :: [Int] -> [Int] -> [Int]
sort_ r [] = r
sort_ r l = sort_ (r ++ [getSmaller l]) (removeElement (getSmaller l) l)