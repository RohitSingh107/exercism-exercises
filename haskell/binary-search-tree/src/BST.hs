module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

data BST a = Leaf | Node (BST a) a (BST a) deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft Leaf = Just Leaf
bstLeft (Node Leaf _ _) = Just Leaf
bstLeft (Node ln _ _) = Just ln

bstRight :: BST a -> Maybe (BST a)
bstRight Leaf = Just Leaf
bstRight (Node _ _ Leaf) = Just Leaf
bstRight (Node _ _ rn) = Just rn

bstValue :: BST Int -> Maybe Int
bstValue Leaf = Nothing
bstValue (Node _ r _) = Just r

empty :: BST a
empty = Leaf

fromList :: Ord a => [a] -> BST a
fromList [] = Leaf
fromList (x:xs) = fromList' xs (singleton x)

fromList' :: Ord a => [a] -> BST a -> BST a
fromList' [] n = n
fromList' (x:xs) n = fromList' xs (insert x n)
-- fromList' xs n = foldl (flip insert) n xs

insert :: Ord a => a -> BST a -> BST a
insert x Leaf = singleton x
insert x (Node ln r rn)
  | x <= r = Node (insert x ln) r rn
  | x > r = Node ln r (insert x rn)
  -- | x == r = Node ln r rn

singleton :: a -> BST a
singleton x = Node Leaf x Leaf 

toList :: BST a -> [a]
toList Leaf = []
toList (Node ln r rn) = toList ln ++ [r] ++ toList rn



