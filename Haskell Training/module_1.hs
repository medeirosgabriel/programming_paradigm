module Functions (isEven) where
    
-- Just isEven is visible by other modules

isEven :: Int -> Bool
isEven n = (mod n 2) == 0

isOdd :: Int -> Bool
isOdd n = (mod n 2) == 1