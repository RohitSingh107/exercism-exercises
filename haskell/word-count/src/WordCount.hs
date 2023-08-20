{-# LANGUAGE OverloadedStrings #-}
module WordCount (wordCount) where

import qualified Data.Text as T


import qualified Data.Map as Map
import Data.Foldable (Foldable(foldl'))
import Data.Char (toLower, isAlphaNum)

wordCount :: T.Text -> Map.Map T.Text Int
wordCount xs = count worded Map.empty
  where worded = T.words cleanedWords
        cleanedWords = T.map (\x -> if x `T.elem` ":,!?\t\n\"&@$%^&." then ' ' else x) xs

count :: [T.Text] -> Map.Map T.Text Int -> Map.Map T.Text Int
count ws mp = foldl' (\ m w -> Map.insertWith (+) (convert w) 1 m) mp ws


convert :: T.Text -> T.Text
convert xs
  | "'s" `T.isSuffixOf` xs || "'t" `T.isSuffixOf` xs = T.map toLower xs
  | otherwise = T.map toLower $ T.filter isAlphaNum xs 
