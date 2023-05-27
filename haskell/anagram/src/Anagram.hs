module Anagram (anagramsFor) where

import Data.List as L
import Data.Char (toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor _ [] = []
anagramsFor s (x:xs)
  | map toLower s == map toLower x = anagramsFor s xs
  | (L.sort . map toLower) s == (L.sort . map toLower) x = x : anagramsFor s xs
  | otherwise = anagramsFor s xs

