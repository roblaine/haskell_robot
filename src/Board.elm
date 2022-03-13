module Board exposing (..)

import Types exposing (Board, Direction, Robot)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import String exposing (fromFloat)


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


drawSquare : List (Float, Float) -> List (Svg msg) -> Svg msg
drawSquare ps = 
  polyline [ fill "none", stroke "black", points "" ]

getVertices : Float -> Float -> Float -> Float -> List (Float, Float)
getVertices x y dim angle = 
  [(x, y)]
