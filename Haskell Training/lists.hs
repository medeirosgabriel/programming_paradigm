-- ['a','b,'c'] -> Returns "abc"
-- head [a,b,c] -> Returns a
-- tail [a,b,c] -> Returns[b,c]
-- head "String" -> Returns 'S'
-- a:[b,c] -> [a,b,c]

size_l [] = 0
size_l (x:xs) = 1 + size_l(xs)

-- Compares two lists

comp_l :: [Int] -> [Int] -> Bool
comp_l [] [] = True
comp_l [] _ = False
comp_l _ [] = False
comp_l (a:b) (c:d) | (a == c) = comp_l b d | otherwise = False

-- Inverts a list

inv_l :: [t] -> [t]
inv_l [] = []
inv_l (x:xs) = (inv_l  xs) ++ [x]

-- Remove a element

rmv_l :: Int -> [Int] -> [Int]
rmv_l _ [] = []
rmv_l e (x:xs) | (x /= e) = [x] ++ (rmv_l e xs) | otherwise = xs

-- Belongs to the list

bel_l :: Int -> [Int] -> Bool
bel_l _ [] = False
bel_l e (x:xs) | (x /= e) = bel_l e xs | otherwise = True

-- Max

max_l :: [Int] -> Int
max_l [x] = x
max_l (x:xs) | (x > max_l xs) = x | otherwise = max_l xs

-- Min

min_l :: [Int] -> Int
min_l [x] = x
min_l (x:xs) | (x < min_l xs) = x | otherwise = min_l xs

-- All Even

allEven_l :: [Int] -> Bool
allEven_l [] = True
allEven_l (x:xs) | (mod x 2 == 1) = False | otherwise = allEven_l xs

-- [x | x <- [1,2,3]] -> [1,2,3]
-- [2*x | x <- [1,2,3]] -> [2,4,6]
-- [x | x <- [1 ..10]] -> [1,2,3,4,5,6,7,8,9,10]
-- [x | x <- [1 ..10], (mod x 2) == 0] -> [2,4,6,8,10]

-- All Even 2

allEven_2 :: Int -> Bool
allEven_2 x = (mod x 2) == 0

l1 = [x | x <- [1 .. 10], allEven_2 x]
l2 = [x | x <- [1 .. 10], allEven_2 x, x > 5]
l3 = [(x,y) | x <- [1 .. 5], y <- [6 .. 10]]

-- Zip Function

l4 = zip [1,2,3] ['a', 'b', 'c']

-- Length

length_ :: [Int] -> Int
length_ [] = 0
length_ (x:xs) = 1 + length_ xs

-- Length for any type - Polimorfism

length_2 :: [a] -> Int
length_2 [] = 0
length_2 (x:xs) = 1 + length_2 xs