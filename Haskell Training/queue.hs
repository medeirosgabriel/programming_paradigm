module Queue where

data Queue t  =  Q [t] deriving (Show)

newQueue :: Queue q
newQueue = Q []

push :: Queue t -> t -> Queue t
push (Q t) n  = Q (t ++ [n])

pop :: Queue t -> Queue t
pop (Q []) = error "Empty Queue"
pop (Q (x:xs)) = Q (xs)

isEmpty :: Queue t -> Bool
isEmpty (Q []) = True
isEmpty _  = False 

head_ :: Queue t -> t
head_ (Q []) = error "Empty Queue"
head_ (Q (x:xs)) =  x
