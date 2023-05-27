module Acronym (abbreviate) where
import Data.Char (isAlpha, toUpper, isUpper)

abbreviate :: String -> String
abbreviate xs = concatMap f $ words xs

f :: String -> String
f [] = []
f (x:xs)
  | not $ isAlpha x = f xs
  | all isUpper (x:xs) = [x]
  | '-' `elem` (x:xs) = g (x:xs)
  | otherwise = toUpper x : filter isUpper xs

g :: String -> String
g [] = []
g xs = toUpper (head b) : [toUpper (head $ tail a)]
  where b = takeWhile (/= '-') xs
        a = dropWhile (/= '-') xs
