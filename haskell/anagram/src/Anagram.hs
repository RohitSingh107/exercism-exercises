module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List as L

anagramsFor :: String -> [String] -> [String]
anagramsFor _ [] = []
anagramsFor s xs = anagramsFor' loweredS sortedLoweredS xs 
  where loweredS = map toLower s
        sortedLoweredS = L.sort loweredS 


anagramsFor' :: String -> String -> [String] -> [String]
anagramsFor' _ _ [] = []
anagramsFor' loweredS sortedLoweredS (x : xs)
  | loweredS == loweredX = anagramsFor' loweredS sortedLoweredS xs
  | sortedLoweredS == L.sort loweredX = x : anagramsFor' loweredS sortedLoweredS xs
  | otherwise = anagramsFor' loweredS sortedLoweredS xs
  where
    loweredX = map toLower x
