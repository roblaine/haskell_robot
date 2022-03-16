module Types exposing (..)

type alias Board =
  { dimX : Int
  , dimY : Int
  , cellWidth : Int
  , heightFactor : Float
  , viewingAngle : Float
  }

type Direction
  = NORTH
  | EAST
  | SOUTH
  | WEST
  | NODIR

type alias Model =
    { robot : Robot
    , board : Board
    }

type alias Robot
  = { posX : Int
  , posY : Int
  , dir : Direction
  , status: RobotStatus
  }

type RobotStatus
  = Placed
  | Unplaced
