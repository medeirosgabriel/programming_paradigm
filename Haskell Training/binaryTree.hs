-- Example:
--          100
--      50      300
--    30  70  200   700

data BinaryTree = Null | Node Int BinaryTree BinaryTree

tree :: BinaryTree
tree = (Node 100 
            (Node 50 
                (Node 30 Null Null) (Node 70 Null Null)) 
            (Node 300 
                (Node 200 Null Null) (Node 700 Null Null)))

inOrder :: BinaryTree -> [Int]
inOrder Null = []
inOrder (Node v l r) = ((inOrder l) ++ [v]) ++ (inOrder r)