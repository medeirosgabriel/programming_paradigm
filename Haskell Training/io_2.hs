main :: IO Int
main = do 
    print "Starting..." -- Similar to putStrLn
    putStr "Type a character: "
    c <- getChar
    putStrLn ""
    putStr "Character = "
    putChar c
    putStrLn ""
    putStr "Type the first number: "
    n1 <- getLine
    putStr "Type the second number: "
    n2 <- getLine
    return ((read n1 :: Int) + (read n2 :: Int))