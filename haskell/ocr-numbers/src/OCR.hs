module OCR (convert) where

import Data.List (intercalate, transpose)
import Data.List.Split (chunksOf)

convert :: String -> String
convert xs = intercalate "," $ map (convert'' . unlines) (f (lines xs))

convert'' :: String -> String
convert'' xs = concatMap (convert' . unlines) (transpose $ map (chunksOf 3) z)
  where
    y = lines xs
    z = concat $ chunksOf 4 y

convert' :: String -> String
convert' xs = if validSize then fontToNum (zip [0 ..] digits) else "?"
  where
    matrix = lines xs
    rows = length matrix
    cols = length $ head matrix
    validSize = rows == 4 && cols == 3

    fontToNum :: [(Int, [String])] -> String
    fontToNum [] = "?"
    fontToNum (y : ys)
      | xs == unlines (snd y) = show $ fst y
      | otherwise = fontToNum ys


f :: [String] -> [[String]]
f s
  | length s <= 4 = [s]
  | otherwise = take 4 s : f (drop 4 s)


digits :: [[String]]
digits =
  [ [ " _ ",
      "| |",
      "|_|",
      "   "
    ],
    [ "   ",
      "  |",
      "  |",
      "   "
    ],
    [ " _ ",
      " _|",
      "|_ ",
      "   "
    ],
    [ " _ ",
      " _|",
      " _|",
      "   "
    ],
    [ "   ",
      "|_|",
      "  |",
      "   "
    ],
    [ " _ ",
      "|_ ",
      " _|",
      "   "
    ],
    [ " _ ",
      "|_ ",
      "|_|",
      "   "
    ],
    [ " _ ",
      "  |",
      "  |",
      "   "
    ],
    [ " _ ",
      "|_|",
      "|_|",
      "   "
    ],
    [ " _ ",
      "|_|",
      " _|",
      "   "
    ]
  ]

