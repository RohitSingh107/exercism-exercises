module Matrix (saddlePoints) where

import Data.Array (Array, bounds, (!))
import Control.Monad (guard)

saddlePoints :: Array (Int, Int) Int -> [(Int, Int)]
saddlePoints matrix = [(i,j) | i <- [1..rows], j <- [1..cols], let height = matrix ! (i,j), height == maximum [matrix ! (i, k) | k <- [1..cols]], height == minimum [matrix ! (k, j) | k <- [1..rows]]]
  where
    (_, (rows, cols)) = bounds matrix

{-
saddlePoints :: Array (Int, Int) Int -> [(Int, Int)]
saddlePoints matrix = do
  i <- [1..rows]
  j <- [1..cols]
  let height = matrix ! (i, j)

 
  guard $ height == maximum [matrix ! (i, k) | k <- [1..cols]]
  guard $ height == minimum [matrix ! (k, j) | k <- [1..rows]]

  pure (i,j)
  where
    (_, (rows, cols)) = bounds matrix
-}
