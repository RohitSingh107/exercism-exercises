module Minesweeper (annotate) where
import Data.Char (intToDigit)



annotate :: [String] -> [String]
annotate board = [[f i j cell board | (j, cell) <- enumerate row] | (i, row) <- enumerate board]
  where enumerate = zip [(0::Int) ..]




f :: Int -> Int -> Char -> [String] -> Char
f i j c b
  | c == '*' = c
  | otherwise = convert $ length $ filter (== '*') neighbours
      where
        rows = length b
        cols = length $ head b
        convert :: Int -> Char
        convert 0 = ' '
        convert x = intToDigit x
        neighbours :: [Char]
        neighbours = [b !! ni !! nj |
                        dx <- [- 1, 0, 1],
                        let ni = i + dx,
                        dy <- [- 1, 0, 1],
                        let nj = j + dy,
                        ni >= 0
                        && nj >= 0
                        && ni < rows
                        && nj < cols]
