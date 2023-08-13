module Prime (nth) where

sieve' :: [Integer] -> [Integer]
sieve' [] = []
sieve' (x:xs) = x : sieve' [y | y <- xs, y `rem` x /= 0]
-- sieve' (x:xs) = x : sieve'  (filter (\y -> y `rem` x /= 0) xs) -- Correct

sieve :: [Integer]
sieve = sieve' [2..]

nth :: Int -> Maybe Integer
-- nth n = Just ((!!) sieve (n-1))
nth n
  | n <= 0 = Nothing
  | otherwise = Just ((!!) sieve (n-1))
