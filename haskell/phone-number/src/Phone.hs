module Phone (number) where

import Data.Char

number :: String -> Maybe String
number xs = f cleaned
  where
    cleaned = filter isNumber xs

f :: String -> Maybe String
f xs
  | length xs == 11 = if head xs == '1' then check10 (tail xs) else Nothing
  | length xs == 10 = check10 xs
  | otherwise = Nothing
    where
      check10 :: String -> Maybe String
      check10 n = if zeroth /= '0' && zeroth /= '1' && third /= '0' && third /= '1' then Just n else Nothing
        where zeroth = head n
              third = n !! 3
