main :: IO()
main = do
    text <- getLine
    print (quantToken text 0 (length text))
    
quantToken :: String -> Int -> Int -> Int
quantToken [] _ _ = 1
quantToken (x:xs) n l | x == ' ' = (if (n /= 0 && n /= l - 1) then 1 + quantToken xs (n + 1) l else quantToken xs (n + 1) l)
                      | otherwise = quantToken xs (n + 1) l