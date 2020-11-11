import Data.Map as Map

dict = [("Python", "Guido Van Rossun"), ("C", "Dennis"), ("Haskell", "Haskell Curry")]

findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key [] = Nothing
findKey key ((k,v):xs) = if key == k
                            then Just v
                         else
                            findKey key xs


size1 = Map.size Map.empty

map1 = Map.insert 1 100 Map.empty

map2 = Map.fromList dict


