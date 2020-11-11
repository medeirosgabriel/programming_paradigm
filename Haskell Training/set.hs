module Set (Set, new, contains, add, remove) where

    data Set t = S [t] deriving(Show, Ord, Eq)

    new :: Set t
    new = S []

    contains :: Eq t => Set t -> t -> Bool
    contains (S []) _ = False
    contains (S (x:xs)) e | (x == e) = True | otherwise = contains (S xs) e

    add :: Eq t => Set t -> t -> Set t
    add (S s) e | (contains (S s) e) = S s | otherwise = S (e:s)

    remove :: Eq t => Set t -> t -> Set t
    remove (S []) _ = S []
    remove (S (x:xs)) e | not(contains (S (x:xs)) e) = S (x:xs)
                        | (x == e) = S xs
                        | otherwise = remove (S (xs ++ [x])) e
