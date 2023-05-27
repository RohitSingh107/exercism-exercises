module Grains (square, total) where

import Data.Bits

square :: Integer -> Maybe Integer
square n
  | n <= 0 || n >= 65 = Nothing
  | otherwise = Just $ 2 ^ (n - 1)

total :: Integer
total =  shiftL 1 64 -1
