module Triangle (rows) where

import qualified Data.Vector as V
import Data.Vector (Vector, fromList, (!), toList)


rows :: Int -> [[Integer]]
-- rows n = take n pascalTriangle' 
rows n = take n (toList $ V.map toList pascalTriangle)



pascalTriangle :: Vector (Vector Integer)
pascalTriangle = fromList [ fromList [binomialCoeff n k | k <- [0..n]] | n <- [0..]]
      where
        binomialCoeff :: Int -> Int -> Integer
        binomialCoeff i r
          | r == 0 || r == i = 1
          | otherwise = (pascalTriangle ! (i-1) ! (r-1)) + (pascalTriangle ! (i-1) ! r)



pascalTriangle' :: [[Integer]]
pascalTriangle' = do
  n <- [0..]
  pure $ do
    -- k <- [0..n]
    -- pure $ binomialCoeff n k
    binomialCoeff n <$> [0..n]
      where
        binomialCoeff :: Int -> Int -> Integer
        binomialCoeff i r
          | r == 0 || r == i = 1
          | otherwise = pascalTriangle' !! (i-1) !! (r-1) + pascalTriangle' !! (i-1) !! r
