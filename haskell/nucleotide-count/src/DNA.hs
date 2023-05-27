module DNA (nucleotideCounts, Nucleotide (..)) where

import Data.Map (Map, fromList, insertWith)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts [] = Right (fromList [(A, 0), (C, 0), (G, 0), (G, 0)])
nucleotideCounts xs = go xs (fromList [(A, 0), (C, 0), (G, 0), (G, 0)])
  where
    go [] m = Right m
    go (c : cs) m
      | c == 'A' = go cs (insertWith (+) A 1 m)
      | c == 'C' = go cs (insertWith (+) C 1 m)
      | c == 'G' = go cs (insertWith (+) G 1 m)
      | c == 'T' = go cs (insertWith (+) T 1 m)
      | otherwise = Left "error"
