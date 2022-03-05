module Main
  where

import Coordinate hiding (loc_to_str)
-- import Data.Char

size = 5 :: Int
coord = Coordinate (Location (0, 0), "F")
moves = []
blocker = ()

main = do
  putStrLn "Please enter a command:"  
  word <- getLine
  if word == "PLACE"
    then main
  else if word == "MOVE"
    then main
  else if word == "LEFT"
    then main
  else if word == "RIGHT"
    then main
  else if word == "REPORT"
    then main
  else if word == "EXIT"
    then return ()
  else main
