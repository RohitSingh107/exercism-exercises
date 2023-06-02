module CryptoSquare (encode) where
import Data.Char (isAlpha, toLower, isAlphaNum)

data Square a = Square a a deriving (Eq, Show)

encode :: String -> String
encode xs = unwords $ map (rightSize r) $ filter notEmpty [[ns !! i | i <- [t, t+c..l-1]] | t <- [0.. c-1]]
  where ns = normalize xs
        l = length ns
        Square r c = findRC l (round (sqrt $ fromIntegral l))

normalize :: String -> String
normalize xs = map toLower $ filter isAlphaNum xs


notEmpty :: String -> Bool
notEmpty [] = False
notEmpty _ = True

rightSize :: Int -> String -> String
rightSize r xs = if l == r then xs else xs ++ replicate (r - l) ' '
  where l = length xs

findRC :: Int -> Int -> Square Int
findRC l r
  | r * r == l = Square r r
  | r * r < l = if  r *  (r+1) < l then Square (r +1) (r+1) else Square r (r +1)
  | otherwise = Square r r
