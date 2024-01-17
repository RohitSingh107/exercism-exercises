module Change (findFewestCoins) where

-- import Data.HashMap.Strict (HashMap)
import Data.Vector (Vector, (!), fromListN)
-- import qualified Data.HashMap.Strict as HM
-- import Data.Maybe (fromMaybe)





-- findFewestCoins :: Integer -> [Integer] -> Maybe [Integer]
-- findFewestCoins target coins = case findFewestCoins' target (length coins -1) (fromListN (length coins) coins) HM.empty of
--                                  Nothing -> Nothing
--                                  Just xs -> Just (reverse xs)
--
--
-- findFewestCoins' :: Integer -> Int -> Vector Integer -> HashMap (Integer, Int) (Maybe [Integer]) -> Maybe [Integer]
-- findFewestCoins' target c coins memoization
--   | target == 0 = Just []
--   | target < 0 || c < 0 = Nothing
--   -- | otherwise = case HM.lookup (target, c) memoization of
--   --                 Just result -> result
--   --                 Nothing -> undefined
--   | otherwise = Data.Maybe.fromMaybe calculate (HM.lookup (target, c) memoization)
--     where
--       calculate = case (take', not_take) of
--                     (Nothing, Nothing) -> Nothing
--                     (Nothing, Just xs) -> Just xs
--                     (Just xs, Nothing) -> Just (coin : xs)
--                     (Just xs, Just ys) -> if length xs + 1 < length ys then Just (coin : xs) else Just ys
--       coin = coins ! c
--       take' = findFewestCoins' (target - coin) c coins memoization
--       not_take = findFewestCoins' target (c-1) coins memoization
--       memo = HM.insert (target, c) calculate memoization


findFewestCoins :: Integer -> [Integer] -> Maybe [Integer]
findFewestCoins target coins = case findFewestCoins' target (length coins -1) (fromListN (length coins) coins) of
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
