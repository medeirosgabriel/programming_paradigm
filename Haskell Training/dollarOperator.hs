-- The operator $ replaces the (...)

main :: IO()
main = do 
    putStrLn ("Hello")
    putStrLn $ "Hello"
    putStrLn $ show (1 + 2)
    putStrLn $ show $ 1 + 2