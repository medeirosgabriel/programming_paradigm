notes = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

main :: IO ()
main = do 
    note <- getLine
    increase <- getLine
    let inc = read increase :: Double
    print (findNote note (cycle notes) inc)
    
findNote :: String -> [String] -> Double -> String
findNote n (x:xs) inc | n == x = incNote (x:xs) inc
                      | otherwise = findNote n xs inc

incNote :: [String] -> Double -> String
incNote (x:xs) inc | (inc == 0) = x
                   | otherwise = incNote xs (inc - 0.5)
