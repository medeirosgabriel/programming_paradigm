checkNumber :: Int -> IO()
checkNumber n = let magicNumber = 42
                in if n == magicNumber
                    then putStrLn "Right!!"
                    else putStrLn "Wrong!!"