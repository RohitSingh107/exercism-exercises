module OCR (convert) where

convert :: String -> String
convert xs = if validSize then "" else "?"
  where
    matrix = lines xs
    rows = length matrix
    cols = length $ head matrix
    validSize = rows == 4 && cols == 3
