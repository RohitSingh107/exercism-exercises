
module Minesweeper (annotate) where
import Data.Char (intToDigit)
import Data.Ix (Ix(inRange))
import Control.Monad (guard)
import qualified Data.Vector as V
enumerate :: V.Vector b -> V.Vector (Int, b)
enumerate = V.zip $ V.fromList [0..]
convert :: Int -> Char
convert 0 = ' '
convert x = intToDigit x
annotate' :: V.Vector (V.Vector Char) -> V.Vector (V.Vector Char)
-- annotate' board = V.fromList [V.fromList [f i j cell | (j, cell) <- V.toList $ enumerate row] | (i, row) <- V.toList $ enumerate board]
annotate' board = do
  (i, row) <- enumerate board
  pure (
      do
      (j, cell) <- enumerate row
      pure (f i j cell)
      )
  where
    f :: Int -> Int -> Char -> Char
    f i j c
      | c == '*' = c
      | otherwise = convert $ V.length $ V.filter (== '*') neighbours
          where
            rows = length board
            cols = length $ V.head board
            neighbours :: V.Vector Char
            -- neighbours = [board !! ni !! nj |
            --                 dx <- [- 1, 0, 1],
            --                 let ni = i + dx,
            --                 dy <- [- 1, 0, 1],
            --                 let nj = j + dy,
            --                 inRange (0, rows-1) ni,
            --                 inRange (0, cols-1) nj]
            neighbours = do
              dx <- V.fromList [-1, 0, 1]
              let ni = i + dx
              dy <- V.fromList [-1, 0, 1]
              let nj = j + dy
              guard $ inRange (0, rows-1) ni
              guard $ inRange (0, cols-1) nj
              pure $ board V.! ni V.! nj
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
annotate :: [String] -> [String]
annotate board = toList' $ annotate' $ fromList' board
toList' :: V.Vector (V.Vector Char) -> [String]
toList' v = do
  row <- V.toList v
  pure $ V.toList row
fromList' :: [String] -> V.Vector (V.Vector Char)
fromList' l = V.fromList [V.fromList row | row <- l]
