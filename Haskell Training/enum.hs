data Day = Sunday | Monday | Tuesday | Wednesday
                  | Thursday | Friday | Saturday
                  deriving(Show)

day :: Int -> Day
day n | (n == 1) = Sunday
      | (n == 2) = Monday
      | (n == 3) = Tuesday
      | (n == 4) = Wednesday
      | (n == 5) = Thursday
      | (n == 6) = Friday
      | (n == 7) = Saturday