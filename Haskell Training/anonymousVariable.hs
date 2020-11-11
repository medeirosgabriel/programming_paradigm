and_ :: Bool -> Bool -> Bool
-- The last 'Bool' is the return type. The rest is the parameter type;
and_ False _ = False
and_ _ False = False
and_ True True = True