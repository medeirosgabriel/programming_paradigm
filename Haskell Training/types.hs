type Name = String
type Age = Int
type Language = String

type Person = (Name, Age, Language)

person :: Person
person = ("John", 15, "Haskell")

selec_fr :: Person -> Name
selec_fr (n, _, _) = n