module Draw exposing (..)

import String exposing (fromFloat, fromInt)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Types exposing (Board, Robot)


boardSquares : Board -> List ( Float, Float )
boardSquares b =
    [ ( -1, -1 ) ]


-- TODO implement a fn to offset each x vertex to the correct new x based on the b.viewingAngle
drawRobot : Board -> Robot -> String -> String -> Svg msg
drawRobot b r fColour bColour =
    let
        vertices =
            [ ( 35.0, 0.0 )
            , ( 65.0, 0.0 )
            , ( 65.0, -55.0 )
            , ( 85.0, -55.0 )
            , ( 50.0, -70.0 )
            , ( 15.0, -55.0 )
            , ( 35.0, -55.0 )
            ]

        xShift = toFloat( b.cellWidth * r.posX )
        yShift = toFloat ( b.cellWidth * b.dimY ) - b.heightFactor * (toFloat ( b.cellWidth * r.posY ))
        xShiftedVerts = xShiftVerts vertices xShift
        shiftedVerts = yShiftVerts xShiftedVerts yShift
    in
    drawPoly shiftedVerts fColour bColour []


drawBoard : Board -> Robot -> String -> String -> Svg msg
drawBoard b r fillColour lineColour =
    svg
        [ width (fromInt (2 * b.cellWidth * b.dimX + 100)) -- Total width with enough to account for x * offset from angle
        , height (fromInt (b.cellWidth * b.dimY)) -- Total height
        , viewBox ("0 0 " ++ fromInt (2 * b.cellWidth * b.dimX + 100) ++ " " ++ fromInt (b.cellWidth * b.dimY))
        ]
        [ drawCell 0 0 b fillColour lineColour
        , drawCell 0 1 b fillColour lineColour
        , drawCell 0 2 b fillColour lineColour
        , drawCell 0 3 b fillColour lineColour
        , drawCell 0 4 b fillColour lineColour

        -- Second Row
        , drawCell 1 0 b fillColour lineColour
        , drawCell 1 1 b fillColour lineColour
        , drawCell 1 2 b fillColour lineColour
        , drawCell 1 3 b fillColour lineColour
        , drawCell 1 4 b fillColour lineColour

        -- Third Row
        , drawCell 2 0 b fillColour lineColour
        , drawCell 2 1 b fillColour lineColour
        , drawCell 2 2 b fillColour lineColour
        , drawCell 2 3 b fillColour lineColour
        , drawCell 2 4 b fillColour lineColour

        -- Fourth
        , drawCell 3 0 b fillColour lineColour
        , drawCell 3 1 b fillColour lineColour
        , drawCell 3 2 b fillColour lineColour
        , drawCell 3 3 b fillColour lineColour
        , drawCell 3 4 b fillColour lineColour

        -- Fifth
        , drawCell 4 0 b fillColour lineColour
        , drawCell 4 1 b fillColour lineColour
        , drawCell 4 2 b fillColour lineColour
        , drawCell 4 3 b fillColour lineColour
        , drawCell 4 4 b fillColour lineColour

        -- Robot
        , drawRobot b r "red" "red"
        ]


drawCell : Int -> Int -> Board -> String -> String -> Svg msg
drawCell rowNum colNum b fillColour lineColour =
    drawPoly (vertsForCell (toFloat colNum * toFloat b.cellWidth + (toFloat rowNum * toFloat b.cellWidth / tan b.viewingAngle)) (toFloat b.cellWidth * toFloat b.dimY - (toFloat rowNum * b.heightFactor * toFloat b.cellWidth)) (toFloat b.cellWidth) b) fillColour lineColour []


drawRow : Int -> Board -> String -> String -> Svg msg
drawRow rowNum b fillColour lineColour =
    drawPoly (vertsForCell (0.0 * toFloat b.cellWidth + (0.0 * toFloat b.cellWidth / tan b.viewingAngle)) (toFloat b.cellWidth * toFloat b.dimY - (toFloat rowNum * b.heightFactor * toFloat b.cellWidth)) (toFloat b.cellWidth) b) fillColour lineColour []


shiftVerts : List ( Float, Float ) -> Float -> Float -> List ( Float, Float )
shiftVerts vertices xShift yShift =
    [ ( 1.0, 1.0 ), ( 2.0, 2.0 ) ]

xShiftVerts : List ( Float, Float ) -> Float -> List ( Float, Float )
xShiftVerts verts xShift =
    verts |> List.map (\p -> (Tuple.first p + xShift, Tuple.second p))

yShiftVerts : List ( Float, Float ) -> Float -> List ( Float, Float )
yShiftVerts verts yShift =
    verts |> List.map (\p -> (Tuple.first p, Tuple.second p + yShift))


drawPoly : List ( Float, Float ) -> String -> String -> List (Svg msg) -> Svg msg
drawPoly ps fColour bColour =
    polygon [ fill fColour, stroke bColour, points (vertsToString ps) ]


vertsForCell : Float -> Float -> Float -> Board -> List ( Float, Float )
vertsForCell x y w b =
    [ ( x, y )
    , ( x + w, y )
    , ( x + w + w / tan b.viewingAngle, y - b.heightFactor * w )
    , ( x + w / tan b.viewingAngle, y - b.heightFactor * w )
    ]


vertsToString : List ( Float, Float ) -> String
vertsToString pairs =
    pairs |> List.map (\p -> fromFloat (Tuple.first p) ++ "," ++ fromFloat (Tuple.second p)) |> List.reverse |> List.foldl (\p1 p2 -> p1 ++ " " ++ p2) ""
