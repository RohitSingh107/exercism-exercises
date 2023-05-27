module SumOfMultiples (sumOfMultiples) where


sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ foldl (\seen x -> if x `elem` seen then seen else seen ++ [x]) [] $ concat [[f, f + f .. limit - 1] | f <- factors, f /= 0]
