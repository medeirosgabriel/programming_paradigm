import Control.Concurrent
-- A perfect number is equal to the sum of all its divisors

getDivisors :: Int -> [Int]
getDivisors n = [x | x <- [1 .. n-1], (mod n x) == 0]

isPerfect :: Int -> Bool
isPerfect n | ((sum (getDivisors n)) == n) = True
            | otherwise = False

getPerfects :: Int -> [Int]
getPerfects n = [x | x <- [1 .. n], (isPerfect x) == True]

main = do
    -- forkIO receives a IO and returns a ThreadID. Starts a new Thread
    forkIO $ do {
        putStrLn("Getting all the perfect numbers...");
        putStrLn("Perfect Numbers " ++ (show $ getPerfects 10000));
        putStrLn("Finished");
    }
    forkIO $ do {
        threadDelay(3000000); -- 3000000 microseconds == 3 seconds
        putStrLn("");
        putStrLn("Executing other Thread!");
    }
    threadDelay(100000000)