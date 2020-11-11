
quickSort [] = []
quickSort (x:xs) = quickSort (left) ++ [x] ++ quickSort(right)
            where
                left = [y | y <- xs, y <= x]
                right = [y | y <- xs, y > x]

