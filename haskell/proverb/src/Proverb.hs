module Proverb(recite) where

-- import Data.Array ((!), listArray)

-- recite :: [String] -> String
-- recite [] = ""
-- recite [x] = "And all for the want of a " <> x <> "."
-- recite l@(x:_) = f 1 <> "And all for the want of a " <> x <> "."
--   where n = length l
--         arr = listArray (0,n-1) l
--
--         f :: Int -> String
--         f i = if i == n then "" else forWantLost (arr ! (i-1)) (arr ! i) <> "\n" <> f (i+1)
--
--
--
-- forWantLost :: String -> String -> String
-- forWantLost want lost = "For want of a " <> want <> " the " <> lost <> " was lost."

recite :: [String] -> String
recite [] = ""
recite xs@(x:_) = (\y -> y <> "And all for the want of a " <> x <> ".") $ unlines $ fmap (\(f,s) -> "For want of a " <> f <> " the " <> s <> " was lost.")  $ zip xs $ tail xs
