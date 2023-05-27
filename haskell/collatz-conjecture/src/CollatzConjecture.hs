module CollatzConjecture (collatz) where

-- collatz :: Double -> Maybe Double
collatz :: Integer -> Maybe Integer
collatz num = go num 0
  where go n c
          | n < 1 = Nothing
          | n == 1 = Just c
          | otherwise = if even n then go (div n 2) (c+1) else go (3*n + 1) (c+1)
 