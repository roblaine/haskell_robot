module Draw exposing (..)

import String exposing (fromFloat, fromInt)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Types exposing (Board)


boardSquares : Board -> List ( Float, Float )
boardSquares b =
    [ ( -1, -1 ) ]


drawArrow : Float -> Float -> Board -> String -> String -> Svg msg
drawArrow xAnchor yAnchor b fColour bColour =
    let
        -- Assume the cell width is 100 units; later implement it to work with b.cellWidth
        vertices =
            [ ( 35.0, 0.0 )
            , ( 65.0, 0.0 )
            , ( 65.0, -75.0 )
            , ( 85.0, -75.0 )
            , ( 50.0, -90.0 )
            , ( 35.0, -75.0 )
            , ( 65.0, -75.0 )
            ]

        shiftedVerts =
            shiftVerts vertices xAnchor yAnchor
    in
    drawPoly shiftedVerts fColour bColour []


drawBoard : Board -> Float -> Float -> String -> String -> Svg msg
drawBoard b angle hFact fillColour lineColour =
    svg
        [ width (fromInt (2 * b.cellWidth * b.dimX + 100)) -- Total width with enough to account for x * offset from angle
        , height (fromInt (b.cellWidth * b.dimY)) -- Total height
        , viewBox ("0 0 " ++ fromInt (2 * b.cellWidth * b.dimX + 100) ++ " " ++ fromInt (b.cellWidth * b.dimY))
        ]
        [ drawCell 0 0 b 45.0 hFact fillColour lineColour
        , drawCell 0 1 b 45.0 hFact fillColour lineColour
        , drawCell 0 2 b 45.0 hFact fillColour lineColour
        , drawCell 0 3 b 45.0 hFact fillColour lineColour
        , drawCell 0 4 b 45.0 hFact fillColour lineColour

        -- Second Row
        , drawCell 1 0 b 45.0 hFact fillColour lineColour
        , drawCell 1 1 b 45.0 hFact fillColour lineColour
        , drawCell 1 2 b 45.0 hFact fillColour lineColour
        , drawCell 1 3 b 45.0 hFact fillColour lineColour
        , drawCell 1 4 b 45.0 hFact fillColour lineColour

        -- Third Row
        , drawCell 2 0 b 45.0 hFact fillColour lineColour
        , drawCell 2 1 b 45.0 hFact fillColour lineColour
        , drawCell 2 2 b 45.0 hFact fillColour lineColour
        , drawCell 2 3 b 45.0 hFact fillColour lineColour
        , drawCell 2 4 b 45.0 hFact fillColour lineColour

        -- Fourth
        , drawCell 3 0 b 45.0 hFact fillColour lineColour
        , drawCell 3 1 b 45.0 hFact fillColour lineColour
        , drawCell 3 2 b 45.0 hFact fillColour lineColour
        , drawCell 3 3 b 45.0 hFact fillColour lineColour
        , drawCell 3 4 b 45.0 hFact fillColour lineColour

        -- Fifth
        , drawCell 4 0 b 45.0 hFact fillColour lineColour
        , drawCell 4 1 b 45.0 hFact fillColour lineColour
        , drawCell 4 2 b 45.0 hFact fillColour lineColour
        , drawCell 4 3 b 45.0 hFact fillColour lineColour
        , drawCell 4 4 b 45.0 hFact fillColour lineColour
        , drawArrow 100 100 b "red" "red"
        ]


drawCell : Int -> Int -> Board -> Float -> Float -> String -> String -> Svg msg
drawCell rowNum colNum b angle hFact fillColour lineColour =
    drawPoly (vertsForCell (toFloat colNum * toFloat b.cellWidth + (toFloat rowNum * toFloat b.cellWidth / tan angle)) (toFloat b.cellWidth * toFloat b.dimY - (toFloat rowNum * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []


drawRow : Int -> Board -> Float -> Float -> String -> String -> Svg msg
drawRow rowNum b angle hFact fillColour lineColour =
    drawPoly (vertsForCell (0.0 * toFloat b.cellWidth + (0.0 * toFloat b.cellWidth / tan angle)) (toFloat b.cellWidth * toFloat b.dimY - (toFloat rowNum * hFact * toFloat b.cellWidth)) (toFloat b.cellWidth) angle hFact) fillColour lineColour []


shiftVerts : List ( Float, Float ) -> Float -> Float -> List ( Float, Float )
shiftVerts vertices xShift yShift =
    [ ( 1.0, 1.0 ), ( 2.0, 2.0 ) ]


drawPoly : List ( Float, Float ) -> String -> String -> List (Svg msg) -> Svg msg
drawPoly ps fColour bColour =
    polygon [ fill fColour, stroke bColour, points (vertsToString ps) ]


vertsForCell : Float -> Float -> Float -> Float -> Float -> List ( Float, Float )
vertsForCell x y cellWidth angle hFact =
    [ ( x, y )
    , ( x + cellWidth, y )
    , ( x + cellWidth + cellWidth * cos angle, y - hFact * cellWidth )
    , ( x + cellWidth * cos angle, y - hFact * cellWidth )
    ]


vertsToString : List ( Float, Float ) -> String
vertsToString pairs =
    pairs |> List.map (\p -> fromFloat (Tuple.first p) ++ "," ++ fromFloat (Tuple.second p)) |> List.reverse |> List.foldl (\p1 p2 -> p1 ++ " " ++ p2) ""
