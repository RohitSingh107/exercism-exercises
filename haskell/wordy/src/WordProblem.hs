
module WordProblem (answer) where

import Data.Char (isNumber)


answer :: String -> Maybe Integer
answer problem
  | even cpl = Nothing
  | cpl == 1 =  Just (read (head cleanedProb) :: Integer)
  | otherwise = calculate cleanedProb 0 (+) True 
    where
      cleanedProb = filter (/= "by") $ drop 2 $ words $ init problem
      cpl = length cleanedProb


calculate :: [String] -> Integer -> (Integer -> Integer -> Integer) -> Bool -> Maybe Integer
calculate [] r _ _ = Just r
calculate (x:xs) r o b
  | any isNumber x = if b then calculate xs (o r (read x :: Integer)) o False else Nothing
  | otherwise = if not b then calculate xs r (op x) True else Nothing
    where
      op "plus" = (+) 
      op "minus" = (-)
      op "multiplied" = (*)
      op _ = div
