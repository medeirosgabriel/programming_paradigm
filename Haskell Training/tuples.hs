sum_t :: (Int, Int) -> (Int, Int) -> (Int, Int)
sum_t (a,b) (c,d) = (a + c, b + d)

names :: (String, String, String)
names = ("Java", "Python", "C++")

selec_fr (x, _, _) = x
selec_sc (_, x, _) = x
selec_tr (_, _, x) = x