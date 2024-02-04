module ResistorColors (Color(..), Resistor(..), label, ohms) where

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded, Eq)

newtype Resistor = Resistor { bands :: (Color, Color, Color) }
  deriving Show

label :: Resistor -> String
label resistor = show (o `div` (10 ^ z)) <> (if o == 0 then "" else replicate (z `rem` 3) '0' ) <> metric (z `div` 3) <> "ohms"
    where
      (c1, c2, c3) = bands resistor

      o = ohms (Resistor (c1, c2, c3))
      z = length $ dropWhile (/= '0') $ show o

      metric :: Int -> String
      metric 1 = " kilo"
      metric 2 = " mega"
      metric 3 = " giga"
      metric _ = " "

ohms :: Resistor -> Int
ohms resistor = (fromEnum c1 * 10 + fromEnum c2) *  (10 ^ fromEnum c3)
    where
      (c1, c2, c3) = bands resistor
