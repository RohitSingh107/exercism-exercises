module Pangram (isPangram) where

import Data.Char

check_every_element :: String -> [Char] -> [Bool]
check_every_element [] _ = []
check_every_element (x:xs) s = elem x s : check_every_element xs s

isPangram :: String -> Bool
isPangram text = and $ check_every_element ['a'..'z'] [toLower y | y <- [x | x <- text, isAlpha x]]

