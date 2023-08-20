{-# LANGUAGE OverloadedStrings #-}

module Acronym (abbreviate) where
import Data.Char (isAlpha, toUpper, isUpper)

import qualified Data.Text as T
import           Data.Text (Text)

-- abbreviate :: String -> String
-- abbreviate xs = concatMap f $ words xs

-- f :: String -> String
-- f [] = []
-- f (x:xs)
--   | not $ isAlpha x = f xs
--   | all isUpper (x:xs) = [x]
--   | '-' `elem` (x:xs) = g (x:xs)
--   | otherwise = toUpper x : filter isUpper xs

-- g :: String -> String
-- g [] = []
-- g xs = toUpper (head b) : [toUpper (head $ tail a)]
--   where b = takeWhile (/= '-') xs
--         a = dropWhile (/= '-') xs

abbreviate :: Text -> Text
abbreviate xs = T.concat $ map f $ T.words xs

f :: Text -> Text
f "" = ""
f text
  | not $ isAlpha x = f xs
  | T.all isUpper text = T.singleton x
  | '-' `T.elem` text = g text
  | otherwise = T.cons (toUpper x) (T.filter isUpper xs)
    where
      x = T.head text 
      xs = T.tail text


g :: Text -> Text
g "" = ""
g xs = T.cons (toUpper (T.head b)) (T.singleton $ toUpper (T.head $ T.tail a))
  where b = T.takeWhile (/= '-') xs
        a = T.dropWhile (/= '-') xs
