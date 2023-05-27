module Bob (responseFor) where
import Data.Char (isAlpha, isUpper, isSpace)


isQ :: String -> Bool
isQ "" = False
-- isQ xs = if last xs == ' ' then isQ xs else last xs == '?'
isQ xs = last pxs == '?'
  where pxs = reverse $ dropWhile isSpace $ reverse xs

isYell :: String -> Bool
isYell xs = (fcr /= "") && all isUpper fcr
  where fcr = filter isAlpha xs

isSilence :: String -> Bool
isSilence = all isSpace

responseFor :: String -> String
responseFor xs
  | isSilence xs = "Fine. Be that way!"
  | isQ xs && isYell xs = "Calm down, I know what I'm doing!"
  | isQ xs = "Sure."
  | isYell xs = "Whoa, chill out!"
  | otherwise = "Whatever."
