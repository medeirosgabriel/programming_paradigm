import System.Random

getSequence :: [Int]
getSequence = [x | x <- [1..100]]

binSearch :: [Int] -> Int -> Int -> Int -> Int -> Int

binSearch vet n inf sup tent | inf > sup = -1
                             | (vet!!mid == n) = tent
                             | (n < vet!!mid) = binSearch vet n inf mid (tent + 1)
                             | otherwise = binSearch vet n mid sup (tent + 1)
                             where 
                                mid = div (inf + sup) 2

main :: IO()
main = do
    n <- randomRIO(1, length(getSequence))
    putStrLn("Chosen Number: " ++ (show n))
    putStrLn("Attempts: " ++ show(binSearch getSequence n 0 (length getSequence) 1))