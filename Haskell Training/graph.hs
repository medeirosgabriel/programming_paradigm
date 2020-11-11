type Node = Int
type Edge = (Node, Node)
type Graph = [Edge]

--            1
--     2   3     4   5
--    6 7        8   9

graph :: [Edge]
graph = [(1,2), (1,3), (1,4), (1,5), 
        (2,6), (2,7), (4,8), (5,9)]

adjacent :: Graph -> Node -> [Node]
adjacent [] _ = []
adjacent ((a,b):c) n | (n == a) = [b] ++ adjacent c n 
                     | (n == b) = [a] ++ adjacent c n 
                     | otherwise = adjacent c n 