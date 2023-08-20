{-# LANGUAGE OverloadedStrings #-} -- Require for automatic conversion between string literals and text
module Bob (responseFor) where
import Data.Char (isAlpha, isUpper, isSpace)
import qualified Data.Text as T
import           Data.Text (Text)


isQ :: Text -> Bool
isQ "" = False
-- isQ xs = if last xs == ' ' then isQ xs else last xs == '?'
isQ xs = T.last pxs == '?'
  where pxs = T.reverse $ T.dropWhile isSpace $ T.reverse xs

isYell :: Text -> Bool
isYell xs = (fcr /= "") && T.all isUpper fcr
  where fcr = T.filter isAlpha xs

isSilence :: Text -> Bool
isSilence = T.all isSpace

responseFor :: Text -> Text
responseFor xs
  | isSilence xs = "Fine. Be that way!"
  | isQ xs && isYell xs = "Calm down, I know what I'm doing!"
  | isQ xs = "Sure."
  | isYell xs = T.pack "Whoa, chill out!"
  | otherwise = "Whatever."
