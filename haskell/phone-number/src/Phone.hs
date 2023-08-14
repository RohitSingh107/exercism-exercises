module Phone (number) where

import Data.Char

number :: String -> Maybe String
number xs = f $ filter isNumber xs

f :: String -> Maybe String
f ('1':xs) = Just xs
f x = Just x
