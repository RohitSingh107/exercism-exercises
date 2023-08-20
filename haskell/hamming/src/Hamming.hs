module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance s1 s2
  | length s1 /= length s2 = Nothing
  | otherwise = Just $ go s1 s2 0
    where go :: String -> String -> Int -> Int
          go _ [] acc = acc
          go [] _ acc = acc
          go (x:xs) (y:ys) acc = go xs ys c
            where c = if x == y then acc else acc + 1
