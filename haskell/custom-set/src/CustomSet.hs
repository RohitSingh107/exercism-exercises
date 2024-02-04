module CustomSet
  ( delete
  , difference
  , empty
  , fromList
  , insert
  , intersection
  , isDisjointFrom
  , isSubsetOf
  , member
  , null
  , size
  , toList
  , union
  ) where

import           Prelude hiding (null)


newtype CustomSet a = CustomSet [a] deriving Show

instance Eq a => Eq (CustomSet a) where
  CustomSet [] == CustomSet [] = True
  CustomSet [] == CustomSet _ = False
  CustomSet _ == CustomSet [] = False
  setA == setB = isSubsetOf setA setB && isSubsetOf setB setA

delete :: Eq a => a -> CustomSet a -> CustomSet a
delete _ (CustomSet []) = empty
delete x (CustomSet ys) = CustomSet $ filter (/= x) ys
-- delete x (CustomSet (y:ys))
--   | x == y = CustomSet ys
--   | otherwise = CustomSet $ y : toList (delete x (CustomSet ys))


difference :: Eq a => CustomSet a -> CustomSet a -> CustomSet a
difference (CustomSet setA) (CustomSet setB) = CustomSet [x | x <- setA, x `notElem` setB]

empty :: CustomSet a
empty = CustomSet []

fromList :: Eq a => [a] -> CustomSet a
fromList ys  = CustomSet $ foldr (\ x xs -> if x `elem` xs then xs else x : xs) [] ys

insert :: Eq a => a -> CustomSet a -> CustomSet a
insert x set@(CustomSet xs) = if x `elem` xs then set else CustomSet (x:xs)

intersection :: Eq a => CustomSet a -> CustomSet a -> CustomSet a
intersection (CustomSet setA) (CustomSet setB) = CustomSet [x | x <- setA, x `elem` setB]

isDisjointFrom :: Eq a => CustomSet a -> CustomSet a -> Bool
isDisjointFrom (CustomSet setA) (CustomSet setB) = not $ any (`elem` setA) setB

isSubsetOf :: Eq a => CustomSet a -> CustomSet a -> Bool
isSubsetOf (CustomSet setA) (CustomSet setB) = all (`elem` setB) setA

member :: Eq a => a -> CustomSet a -> Bool
member x (CustomSet xs) = x `elem` xs

null :: Eq a => CustomSet a -> Bool
null (CustomSet xs) = [] == xs

size :: CustomSet a -> Int
size (CustomSet xs) = length xs

toList :: CustomSet a -> [a]
toList (CustomSet xs) = xs

union :: Eq a => CustomSet a -> CustomSet a -> CustomSet a
union (CustomSet setA) (CustomSet setB) = CustomSet $ setA ++ [x | x <- setB, x `notElem` setA]
