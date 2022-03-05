module Main
  where

import Data.Char
  
size = 5 :: Int
-- location is a triple of x y and a char repr facing direction.
location = (0,0,'f')
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
