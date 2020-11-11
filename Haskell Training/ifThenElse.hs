if_even :: Int -> Bool
if_even n = if ((mod n 2) == 0) then True else False

case_even :: Int -> Bool
case_even n = case ((mod n 2) == 0) of True -> True 
                                       False -> False

guard_even :: Int -> Bool
guard_even n | (mod n 2 == 0) = True | otherwise = False