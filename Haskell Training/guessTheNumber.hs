import System.Random

main = do 
    number <- randomRIO (1::Int, 50)
    guess number

guess number = do
    putStr "Type a number between 1 and 50: "
    n <- getLine
    if (read n) < number
        then do 
            putStrLn "Tip: The number is Higher!"
            guess number
    else if  (read n) > number
        then do
            putStrLn "Tip: The number is Less!"
            guess number
    else do 
        putStrLn "Congratulations! You found the number!"