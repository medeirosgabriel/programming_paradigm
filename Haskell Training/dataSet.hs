import Data.Set

text1 = "dsafdfrfr"
mySet1 = fromList text1

list2 = [1,2,2,2,3,4,5]
mySet2 = fromList list2

mySet3 = fromList [2,3,4,6]
mySet4 = intersection mySet2 mySet3

mySet5 = difference mySet2 mySet3