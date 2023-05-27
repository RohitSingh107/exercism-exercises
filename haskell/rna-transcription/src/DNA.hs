module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA [] = Right ""
toRNA (x : xs)
  | x == 'G' = fmap ('C' :) (toRNA xs)
  | x == 'C' = fmap ('G' :) (toRNA xs)
  | x == 'T' = fmap ('A' :) (toRNA xs)
  | x == 'A' = fmap ('U' :) (toRNA xs)
  | otherwise = Left x
