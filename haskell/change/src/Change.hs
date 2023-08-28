module Change (findFewestCoins) where

{-
findFewestCoins :: Integer -> [Integer] -> Maybe [Integer]
findFewestCoins target coins = if head coins > target then Nothing else Just (sol target (n-1) [])
  where
    n = length coins
    sol :: Integer -> Int -> [Integer] -> [Integer]
    sol 0 _ ans = ans
    sol t i ans = if t >= (coins !! i) then sol (t `mod` (coins !! i)) i ((coins !! i) : ans)  else sol t (i-1) ans
-}


findFewestCoins :: Integer -> [Integer] -> Maybe [Integer]
findFewestCoins target coins = undefined


findFewestCoins' :: Integer -> [Integer] -> [Integer] -> Maybe [Integer]
findFewestCoins' target coins ans
  | target == 0 = Just ans
  | target < 0 = Nothing
  | otherwise = undefined
