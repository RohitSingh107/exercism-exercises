module LinkedList --- where
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

-- data LinkedList a = LinkedList
--     {
--           datum :: a
--         , next :: LinkedList a
--
--     }

data LinkedList a = Cons !a !(LinkedList a) | None deriving (Eq, Show)

datum :: LinkedList a -> a
datum (Cons a _) = a
datum None = error "None can't have a value"

fromList :: [a] -> LinkedList a
fromList = foldr Cons None

isNil :: LinkedList a -> Bool
isNil None = True
isNil _ = False

new :: a -> LinkedList a -> LinkedList a
new = Cons
-- new v None = Cons v None
-- new v (Cons d n) = Cons d (new v n)

next :: LinkedList a -> LinkedList a
next None = None 
next (Cons _ n) = n

nil :: LinkedList a
nil = None 

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = revLL None
  where
    revLL :: LinkedList a -> LinkedList a -> LinkedList a
    revLL prev None = prev
    revLL prev (Cons d nt) = revLL (Cons d prev) nt
-- reverseLinkedList = fromList . reverse . toList

toList :: LinkedList a -> [a]
toList None = [] 
toList (Cons d n) = d : toList n

