module Matrix (saddlePoints, potentialPoints) where

import Data.Array (Array, bounds, (!))

saddlePoints :: Array i e -> [i]
saddlePoints matrix = error "You need to implement this function."


potentialPoints :: Array (Int,Int) Int -> [(Int, Int)]
potentialPoints matrix = fromAllRows
  where
    ((ri,ci), (rows, cols)) = bounds matrix

    fromAllRows = [(r, fromRow r cols cols) | r <- [ri..rows]]

    fromRow _ 0 p = p
    fromRow r c p = fromRow r (c-1) np
      where np = if matrix ! (r,c) > (matrix ! (r,p)) then c else p


