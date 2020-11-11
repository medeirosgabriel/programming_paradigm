main :: IO()
main = do
    x <- getLine
    y <- getLine
    let x_ = read x :: Int
    let y_ = read y :: Int
    print (maior (joana x_ y_) (jose x_ y_) (joaquina x_ y_))
    
maior :: Int -> Int -> Int -> String
maior joana jose joaquina | joana >= jose && joana >= joaquina = "Joana ganhou!"
                          | jose >= joana && jose >= joaquina = "Jose ganhou!"
                          | otherwise = "Joaquina ganhou!"
                          
joana :: Int -> Int -> Int
joana x y = ((3 * x) ^ 2) + y ^2

jose :: Int -> Int -> Int
jose x y = 2 * (x ^ 2) + (5 * y) ^ 2

joaquina :: Int -> Int -> Int
joaquina x y = (-100) * x + (y ^ 3)