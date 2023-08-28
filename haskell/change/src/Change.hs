module Change (findFewestCoins) where

import Data.Vector (Vector, (!), fromList)




findFewestCoins :: Integer -> [Integer] -> Maybe [Integer]
findFewestCoins target coins = case findFewestCoins' target (length coins -1) (fromList coins) of
                                 Nothing -> Nothing
                                 Just xs -> Just (reverse xs)


findFewestCoins' :: Integer -> Int -> Vector Integer -> Maybe [Integer]
findFewestCoins' target c coins
  | target == 0 = Just []
  | target < 0 || c < 0 = Nothing
  | otherwise = case (take', not_take) of
                  (Nothing, Nothing) -> Nothing
                  (Nothing, Just xs) -> Just xs
                  (Just xs, Nothing) -> Just (coin : xs)
                  (Just xs, Just ys) -> if length xs + 1 < length ys then Just (coin : xs) else Just ys
    where
      coin = coins ! c
      take' = findFewestCoins' (target - coin) c coins
      not_take = findFewestCoins' target (c-1) coins

