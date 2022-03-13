module Main exposing (..)

import Board exposing (..)
import Robot exposing (..)
import Types exposing (Board, Robot)

import Browser
import Html exposing (Html, button, div)
import Html.Events exposing (onClick)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Html exposing (p)
import Html exposing (s)

-- MAIN
main : Program () Model Msg
main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL
type alias Model = 
  { robot : Robot
  , board : Board
  }

init : Model
init = Model (Robot 0 0 Types.NORTH Types.Unplaced) (Board 5 5)

-- UPDATE
type Msg =
  Move
  | Left
  | Right
  | Place String String String

update : Msg -> Model -> Model
update msg model = 
  case msg of
    Move ->
      if model.robot.status == Types.Placed then
        { model | robot = move model.robot model.board }
      else
        model

    Left ->
      if model.robot.status == Types.Placed then
        { model | robot = Robot model.robot.posX model.robot.posY (turnLeft model.robot.dir) Types.Placed }
      else 
        model

    Right ->
      if model.robot.status == Types.Placed then
        { model | robot = Robot model.robot.posX model.robot.posY (turnRight model.robot.dir) Types.Placed }
      else 
        model

    Place x y dir ->
      if model.robot.status == Types.Unplaced then
        { model | robot = (placeRobot (stringToInt x) (stringToInt y) (dirFromString dir) model.board) }
      else
        model

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ p [] [ Html.text "("
            , Html.text (String.fromInt model.robot.posX)
            , Html.text ", "
            , Html.text (String.fromInt model.robot.posY)
            , Html.text ") facing "
            , Html.text (dirToString model.robot.dir)
           ]
    , div [] [ Html.text (statusToString model.robot.status) ]
    , button [ onClick Move ] [ Html.text "Move" ] 
    , button [ onClick Left ] [ Html.text "Left" ]
    , button [ onClick Right ] [ Html.text "Right" ]
    , button [ onClick (Place "0" "0" "NORTH") ] [ Html.text "Place" ]
    , svg
    [ width "500"
    , height "500"
    , viewBox "0 0 500 500"
    ]
    [ drawSquare (getVertices 0 0 100 45) []
    ]
    ]

boolToString : Bool -> String
boolToString value =
  if value then
    "True"
  else
    "False"

stringToInt : String -> Int
stringToInt s =
  case (String.toInt s) of
    Just z -> z
    Nothing -> -1
