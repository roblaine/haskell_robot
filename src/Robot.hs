module Robot 
  where

right :: Char -> Char
right 'n' = 'e'
right 'w' = 'n'
right 's' = 'w'
right 'e' = 'n'
right _ = error "No match for args"

left :: Char -> Char
left 'n' = 'w'
left 'w' = 's'
left 's' = 'e'
left 'e' = 's'
left _ = error "No match for args"

go :: ((Integer, Integer), Char) -> (Integer, Integer) -> ((Integer, Integer), Char)
go ((px, py), 'n') (bx, by)
  | py == by = ((px, py), 'n')
  | otherwise = ((px, py + 1), 'n')
go ((px, py), 's') (bx, by)
  | py == 0 = ((px, py), 's')
  | otherwise = ((px, py - 1), 's')
go ((px, py), 'e') (bx, by)
  | px == bx = ((px, py), 'e')
  | otherwise = ((px + 1, py), 'e')
go ((px, py), 'w') (bx, by)
  | px == 0 = ((px, py), 'w')
  | otherwise = ((px - 1, py), 'w')
go _ _ = error "No match for args"

report :: ((Integer, Integer), Char) -> [Char]
report ((px, py), d) = "(" ++ show px ++ ", " ++ show py ++ "), facing " ++ show d

place :: (Integer, Integer) -> (Integer, Integer) -> Char -> ((Integer, Integer), Char)
place (px, py) (bx, by) d
  | px >= 0 && px <= bx && py >= 0 && py <= by = ((px, py), d)
  | otherwise = error "Out of bounds"
