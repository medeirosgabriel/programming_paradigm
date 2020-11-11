isEven :: Int -> Bool
isEven n = if (mod n 2 == 0) then True else False

l1 = [2,3,4,5,6,7,8,9,10] 

l2 = takeWhile isEven l1

l3 = dropWhile isEven l1