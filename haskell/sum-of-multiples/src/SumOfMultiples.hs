module SumOfMultiples (sumOfMultiples) where

-- import Data.List
-- sumOfMultiples :: [Integer] -> Integer -> Integer
-- sumOfMultiples factors limit = sum $ foldl' (\seen x -> if x `elem` seen then seen else x : seen) [] $ concat [[f, f + f .. limit - 1] | f <- factors, f /= 0]
--

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ foldr merge [] [[f, f + f .. limit - 1] | f <- factors, f /= 0]

merge :: [Integer] -> [Integer] -> [Integer]
merge xs [] = xs
merge [] ys = ys
merge (x : xs) (y : ys) = case compare x y of
  LT -> x : merge xs (y : ys)
  GT -> y : merge (x : xs) ys
  EQ -> x : merge xs ys
