module Acronym (abbreviate) where
import Data.Char (isUpper)

abbreviate :: String -> String
abbreviate xs = unwords $ map f $ words xs

f :: String -> String
f = undefined
