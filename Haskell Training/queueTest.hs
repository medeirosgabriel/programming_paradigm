module QueueTest where

import Queue

getQueue = (Q [1,2,3,4])

showQueue :: Queue t -> [t]
showQueue q | isEmpty q = [] | otherwise = [head_ q] ++ showQueue(pop q)

top :: Queue t -> t
top q = head_ q