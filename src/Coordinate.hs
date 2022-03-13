-- module Coordinate
--   where

-- -- define the types that we're going to need
-- data Location = Location (Int, Int) deriving (Show)
-- data Coordinate = Coordinate (Location, String) deriving (Show)

-- -- TODO: Define a function for getting fst and snd from Location & Coordinate

-- loc_to_str :: Location -> String
-- loc_to_str loc = "(" ++ show (fst loc) ++ ", " ++ show (snd loc) ++ ")"

-- crd_to_str :: Coordinate -> String
-- crd_to_str c = lp ++ " facing " ++ snd c
--                where lp = loc_to_str (fst c)
