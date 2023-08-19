module Minesweeper (annotate) where
import Data.Char (intToDigit)
import Data.Ix (Ix(inRange))
import Control.Monad (guard)

-- import qualified Data.Vector as V


enumerate :: [b] -> [(Int, b)] 
enumerate = zip [(0::Int) ..]

convert :: Int -> Char
convert 0 = ' '
convert x = intToDigit x

annotate :: [String] -> [String]
-- annotate board = [[f i j cell | (j, cell) <- enumerate row] | (i, row) <- enumerate board]
annotate board = do

  (i, row) <- enumerate board
  -- let newRow = [f i j cell | (j, cell) <- enumerate row]
  pure (
      do
      (j, cell) <- enumerate row
      pure (f i j cell)
      )
    
  where 
    f :: Int -> Int -> Char -> Char
    f i j c
      | c == '*' = c
      | otherwise = convert $ length $ filter (== '*') neighbours
          where
            rows = length board
            cols = length $ head board
            neighbours :: [Char]
            -- neighbours = [board !! ni !! nj |
            --                 dx <- [- 1, 0, 1],
            --                 let ni = i + dx,
            --                 dy <- [- 1, 0, 1],
            --                 let nj = j + dy,
            --                 inRange (0, rows-1) ni,
            --                 inRange (0, cols-1) nj]
            neighbours = do
              
              dx <- [-1, 0, 1]
              let ni = i + dx

              dy <- [-1, 0, 1]
              let nj = j + dy

              guard $ inRange (0, rows-1) ni
              guard $ inRange (0, cols-1) nj

              pure $ board !! ni !! nj

-- -- map f xs = [ f x | x <- xs ]
-- mymap f xs = do
--   x <- xs
--   pure (f x)
--
-- -- myfilter p xs = [ x | x <- xs, p x ]
-- myfilter p xs = do
--   x <- xs
--   guard (p x)
--   pure x
