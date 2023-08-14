module PerfectNumbers (classify, Classification(..)) where


data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify 1 = Just Deficient
classify n
  | n <= 0 = Nothing
  | otherwise = f ((+1) $ factorsSum [(i,q) | i <- [2..(round $ sqrt (fromIntegral n))], let (q,r) = divMod n i, r == 0]) n

f :: Int -> Int -> Maybe Classification
f s n
  | s < n = Just Deficient
  | s > n = Just Abundant
  | otherwise = Just Perfect


factorsSum :: [(Int, Int)] -> Int
factorsSum [] = 0
factorsSum ((a,b) : xs) = addf a b + factorsSum xs
  where addf x y
                | x == y = x
                | otherwise = x + y


