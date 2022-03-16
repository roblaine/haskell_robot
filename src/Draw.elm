module Draw exposing (..)

import String exposing (fromFloat, fromInt)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Types exposing (Board)


boardSquares : Board -> List ( Float, Float )
boardSquares b =
    [ ( -1, -1 ) ]


drawBoard : Board -> Float -> Float -> String -> String -> Svg msg
drawBoard b angle hFact fillColour lineColour =
    svg
        [ width (fromInt (2 * b.cellWidth * b.dimX + 100)) -- Total width with enough to account for x * offset from angle
        , height (fromInt (b.cellWidth * b.dimY)) -- Total height
        , viewBox ("0 0 " ++ fromInt (2 * b.cellWidth * b.dimX + 100) ++ " " ++ fromInt (b.cellWidth * b.dimY))
        ]
        [ drawCell 0 0 b angle hFact fillColour lineColour
        , drawCell 0 1 b angle hFact fillColour lineColour
        , drawCell 0 2 b angle hFact fillColour lineColour
        , drawCell 0 3 b angle hFact fillColour lineColour
        , drawCell 0 4 b angle hFact fillColour lineColour

        -- Second Row
        , drawPoly (vertsForCell (0.0 * toFloat b.cellWidth + (1.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (1.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        , drawPoly (vertsForCell (1.0 * toFloat b.cellWidth + (1.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (1.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        , drawPoly (vertsForCell (2.0 * toFloat b.cellWidth + (1.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (1.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        , drawPoly (vertsForCell (3.0 * toFloat b.cellWidth + (1.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (1.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        , drawPoly (vertsForCell (4.0 * toFloat b.cellWidth + (1.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (1.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []

        -- Third Row
        , drawPoly (vertsForCell (0.0 * toFloat b.cellWidth + (2.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (2.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        , drawPoly (vertsForCell (1.0 * toFloat b.cellWidth + (2.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (2.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        , drawPoly (vertsForCell (2.0 * toFloat b.cellWidth + (2.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (2.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        , drawPoly (vertsForCell (3.0 * toFloat b.cellWidth + (2.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (2.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        , drawPoly (vertsForCell (4.0 * toFloat b.cellWidth + (2.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (2.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []

        -- Fourth
        , drawPoly (vertsForCell (0.0 * toFloat b.cellWidth + (3.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (3.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        , drawPoly (vertsForCell (1.0 * toFloat b.cellWidth + (3.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (3.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        , drawPoly (vertsForCell (2.0 * toFloat b.cellWidth + (3.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (3.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        , drawPoly (vertsForCell (3.0 * toFloat b.cellWidth + (3.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (3.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        , drawPoly (vertsForCell (4.0 * toFloat b.cellWidth + (3.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (3.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []

        -- Fifth
        , drawPoly (vertsForCell (0.0 * toFloat b.cellWidth + (4.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (4.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        , drawPoly (vertsForCell (1.0 * toFloat b.cellWidth + (4.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (4.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        , drawPoly (vertsForCell (2.0 * toFloat b.cellWidth + (4.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (4.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        , drawPoly (vertsForCell (3.0 * toFloat b.cellWidth + (4.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (4.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        , drawPoly (vertsForCell (4.0 * toFloat b.cellWidth + (4.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (4.0 * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []
        ]


drawCell : Int -> Int -> Board -> Float -> Float -> String -> String -> Svg msg
drawCell rowNum colNum b angle hFact fillColour lineColour =
    drawPoly (vertsForCell (toFloat colNum * toFloat b.cellWidth + (toFloat rowNum * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (toFloat rowNum * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []


drawRow : Int -> Board -> Float -> Float -> String -> String -> Svg msg
drawRow rowNum b angle hFact fillColour lineColour =
    drawPoly (vertsForCell (0.0 * toFloat b.cellWidth + (0.0 * toFloat b.cellWidth / tan 45)) (toFloat b.cellWidth * toFloat b.dimY - (toFloat rowNum * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []


xShiftVerts : List ( Float, Float ) -> Float -> List ( Float, Float )
xShiftVerts x y =
    []


drawPoly : List ( Float, Float ) -> String -> String -> List (Svg msg) -> Svg msg
drawPoly ps fColour bColour =
    polygon [ fill fColour, stroke bColour, points (vertsToString ps) ]


vertsForCell : Float -> Float -> Float -> Float -> Float -> List ( Float, Float )
vertsForCell x y w angle hFact =
    [ ( x, y )
    , ( x + w, y )
    , ( x + w + w / tan angle, y - hFact * w )
    , ( x + w / tan angle, y - hFact * w )
    ]


vertsToString : List ( Float, Float ) -> String
vertsToString pairs =
    pairs |> List.map (\p -> fromFloat (Tuple.first p) ++ "," ++ fromFloat (Tuple.second p)) |> List.reverse |> List.foldl (\p1 p2 -> p1 ++ " " ++ p2) ""
