module RunLength (decode, encode) where

import Data.Char (isDigit)

decode :: String -> String
decode = decode' 0

encode :: String -> String
encode [] = []
encode text = encode' 0 (head text) text



encode' :: Int -> Char -> String -> String
encode' i c [] = (if i /= 1 then show i else "") <> [c]
encode' i c (x:xs)
  | x == c = encode' (i+1) x xs
  | otherwise = (if i /= 1 then show i else "") <> [c] <> encode' 1 x xs

decode' :: Int -> String -> String
decode' _ [] = []
decode' cnt (x:xs)
  | isDigit x = decode' (cnt * 10 + read [x]) xs
  | otherwise = replicate (if cnt == 0 then 1 else cnt) x <> decode' 0 xs

