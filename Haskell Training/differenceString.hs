-- elem -> returns True if the caracter is in a text

diff1 :: String -> String -> String
diff1 s1 s2 = [if (elem x s2) then x else '_' | x <- s1]


diff2 :: String -> String -> String
diff2 [] _ = ""
diff2 _ [] = ""
diff2 (x:xs) (y:ys) | (x == y) = x:(diff2 xs ys)
                    | otherwise = '_':(diff2 xs ys)