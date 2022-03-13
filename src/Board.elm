module Board exposing (..)

import Types exposing (Board, Direction, Robot)

inBounds : Int -> Int -> Board -> Bool
inBounds x y b =
  if x >= 0 && x < b.dimX && y >= 0 && y < b.dimY then
    True
  else
    False

placeRobot : Int -> Int -> Direction -> Board -> Robot
placeRobot x y d b =
  if inBounds x y b then
    Robot x y d Types.Placed
  else
    Robot x y d Types.Unplaced
