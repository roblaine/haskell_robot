module Types exposing (..)


type alias Board =
    { dimX : Int
    , dimY : Int
    , cellWidth : Int
    }


type Direction
    = NORTH
    | EAST
    | SOUTH
    | WEST
    | NODIR


type alias Robot =
    { posX : Int
    , posY : Int
    , dir : Direction
    , status : RobotStatus
    }


type RobotStatus
    = Placed
    | Unplaced
