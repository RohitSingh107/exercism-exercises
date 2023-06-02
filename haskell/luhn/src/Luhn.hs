module Luhn (isValid) where

import Data.Char (digitToInt, intToDigit, isNumber)
import Data.List (foldl')

isValid :: String -> Bool
isValid [] = False
isValid [_] = False
isValid n = case spaceRemoved of
  [_] -> False
  _ -> rem digitsSum 10 == 0
  where
    digitsSum = foldl' (\x y -> x + digitToInt y) 0 modifiedDigits
    modifiedDigits = modifyAltNums spaceRemoved (even $ length spaceRemoved)
    spaceRemoved = filter isNumber n

modifyAltNums :: String -> Bool -> String
modifyAltNums [] _ = []
modifyAltNums (x : xs) False = x : modifyAltNums xs True
modifyAltNums (x : xs) True = transform x True : modifyAltNums xs False

transform :: Char -> Bool -> Char
transform x False = x
transform x True = if dx > 9 then intToDigit (dx - 9) else intToDigit dx
  where
    dx = (* 2) $ digitToInt x
