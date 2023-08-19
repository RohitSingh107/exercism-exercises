module Queens (boardString, canAttack) where

import Data.List (intersperse)

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString Nothing Nothing = unlines $ replicate 8 (intersperse ' ' $ replicate 8 '_')
boardString Nothing (Just (x, y)) = unlines $ [intersperse ' ' [f i j | j <- [0..7]] | i <- [0..7]]
  where
    f :: Int -> Int -> Char
    f a b
      | a == x && b == y = 'B'
      | otherwise = '_'
boardString (Just (x, y)) Nothing = unlines $ [intersperse ' ' [f i j | j <- [0..7]] | i <- [0..7]]
  where
    f :: Int -> Int -> Char
    f a b
      | a == x && b == y = 'W'
      | otherwise = '_'
boardString (Just (wx, wy)) (Just (bx,by)) = unlines $ [intersperse ' ' [f i j | j <- [0..7]] | i <- [0..7]]
      where
        f :: Int -> Int -> Char
        f x y
          | wx == x && wy == y = 'W'
          | bx == x && by == y = 'B'
          | otherwise = '_'


canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (wx, wy) (bx, by)
  | wx == bx = True
  | wy == by = True
  | abs (bx - wx) == abs (by - wy) = True
  | otherwise = False
