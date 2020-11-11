countDna :: Char -> String -> Int
countDna _ [] = 0
countDna c (x:xs) | (c == x) = 1 + (countDna c xs)
                  | otherwise = (countDna c xs)

main :: IO()
main = do 
    putStr "Type the DNA sequence: "
    dna <- getLine
    putStrLn ("Adenina: " ++ show (countDna 'A' (show dna)))
    putStrLn ("Guanina: " ++ show (countDna 'G' (show dna)))
    putStrLn ("Timina: " ++ show (countDna 'T' (show dna)))
    putStrLn ("Citosina: " ++ show (countDna 'C' (show dna)))