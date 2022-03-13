module Draw exposing (..)

import Types exposing (Board)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import String exposing (fromFloat, fromInt)

boardSquares : Board -> List (Float, Float)
boardSquares b = [(-1, -1)]

vertsForCell : Float -> Float -> Float -> Float -> Float -> List (Float, Float)
vertsForCell x y w d hFact = 
  [
    (x, y), 
    ((x + w), y), 
    ((x + w + w / tan d), (y - hFact * w)), 
    ((x + w / tan d), (y - hFact * w))
  ]

drawBoard : Board -> Float -> Float -> String -> String -> Svg msg
drawBoard b d hFact fillColour lineColour = 
  svg
  [ width (fromInt (b.cellWidth * b.dimX))
  , height (fromInt (b.cellWidth * b.dimY))
  , viewBox ("0 0 " ++ (fromInt (b.cellWidth * b.dimX)) ++ " " ++ (fromInt (b.cellWidth * b.dimY)))
  ]
  [ drawPoly (vertsForCell 0 (toFloat (b.cellWidth * b.dimY)) (toFloat (b.cellWidth)) d hFact) fillColour lineColour []
  ]


drawPoly : List (Float, Float) -> String -> String -> List (Svg msg) -> Svg msg
drawPoly ps fColour bColour = 
  polygon [ fill fColour, stroke bColour, points (vertsToString ps)]

vertsToString : List (Float, Float) -> String 
vertsToString pairs =
  pairs |> List.map (\p -> fromFloat (Tuple.first p) ++ "," ++ fromFloat (Tuple.second p)) |> List.reverse |> List.foldl (\p1 p2 -> p1 ++ " " ++ p2) ""
