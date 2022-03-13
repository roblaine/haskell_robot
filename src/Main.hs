module Main
  where

import Robot

-- TODO put state into a data structure

main :: IO ()
main = do
  let dir = Nothing
  let blocker = Nothing
  let pos = Nothing
  let size = 5 :: Integer
  let board = (size, size)

  -- TODO: Implement user input inside of a recursive fn
  let pos = place (0,0) board 'n'
  putStrLn (report pos)
  let pos' = go pos board
  putStrLn (report pos')
  main
