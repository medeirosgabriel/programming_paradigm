main :: IO()
main = do 
    putStr "Type the first Number: "
    n1 <- getLine
    putStr "Type the second Number: "
    n2 <- getLine
    putStrLn ("Sum = " ++ (show(read n1 + read n2)))
