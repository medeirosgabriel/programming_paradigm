import Data.List

l1 = [("Maria", 25), ("Joao", 19), ("Pedro", 18)]

l2 = sort l1

compares :: (Ord a, Ord b) => (a, b) -> (a, b) -> Ordering
compares (a1, b1) (a2, b2) | b1 < b2 = GT -- Greater Than
                           | b1 == b2 = EQ -- EQUAL
                           | otherwise = LT -- LESS THAN

l3 = sortBy compares l1

