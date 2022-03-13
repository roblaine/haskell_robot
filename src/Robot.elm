module Robot exposing (..)

import Board exposing (inBounds)
import Types exposing (Board, Direction, Robot)

dirFromString : String -> Direction
dirFromString s =
  case s of
    "NORTH" -> Types.NORTH
    "WEST" -> Types.WEST
    "SOUTH" -> Types.SOUTH
    "EAST" -> Types.EAST
    _ -> Types.NODIR

dirToString : Direction -> String
dirToString d =
  case d of
    Types.NORTH -> "NORTH"
    Types.WEST -> "WEST"
    Types.SOUTH -> "SOUTH"
    Types.EAST -> "EAST"
    Types.NODIR -> "No Direction"

turnLeft : Direction -> Direction
turnLeft d = 
  case d of
    Types.NORTH -> Types.WEST
    Types.WEST -> Types.SOUTH
    Types.SOUTH -> Types.EAST
    Types.EAST -> Types.NORTH
    Types.NODIR -> Types.NODIR

turnRight : Direction -> Direction
turnRight d =
  case d of
    Types.NORTH -> Types.EAST
    Types.WEST -> Types.NORTH
    Types.SOUTH -> Types.WEST
    Types.EAST -> Types.SOUTH
    Types.NODIR -> Types.NODIR

statusToString : Types.RobotStatus -> String
statusToString s =
  case s of
    Types.Placed -> "Placed"
    Types.Unplaced -> "Unplaced"

move : Robot -> Board -> Robot
move r b =
  case r.dir of
    Types.NORTH ->
      if inBounds r.posX (r.posY + 1) b then
        Robot r.posX (r.posY + 1) r.dir r.status
      else
        r
    Types.EAST ->
      if inBounds (r.posX + 1) r.posY b then
        Robot (r.posX + 1) r.posY r.dir r.status
      else
        r
    Types.SOUTH ->
      if inBounds r.posX (r.posY - 1) b then
        Robot r.posX (r.posY - 1) r.dir r.status
      else
        r
    Types.WEST ->
      if inBounds (r.posX - 1) r.posY b then
        Robot (r.posX - 1) r.posY r.dir r.status
      else
        r
    Types.NODIR ->
      r
