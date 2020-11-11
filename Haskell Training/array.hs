import Data.Array

get_array = array (1,4) [(1,'A'),(1,'B'),(1,'C'),(1,'D')]

matrix = array ((1,1), (2,2)) [((1,1), 'A'), ((1,2), 'B'), 
                               ((2,1), 'C'), ((2,2), 'C')]

e = matrix ! (1,1)
