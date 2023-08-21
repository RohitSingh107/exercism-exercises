{-# LANGUAGE OverloadedStrings #-}

module FoodChain (song) where

import Data.Text (Text)
import qualified Data.Text as T

-- song :: String
-- song =
--     "I know an old lady who swallowed a fly.\n\
--     \I don't know why she swallowed the fly. Perhaps she'll die.\n\
--     \\n\
--     \I know an old lady who swallowed a spider.\n\
--     \It wriggled and jiggled and tickled inside her.\n\
--     \She swallowed the spider to catch the fly.\n\
--     \I don't know why she swallowed the fly. Perhaps she'll die.\n\
--     \\n\
--     \I know an old lady who swallowed a bird.\n\
--     \How absurd to swallow a bird!\n\
--     \She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n\
--     \She swallowed the spider to catch the fly.\n\
--     \I don't know why she swallowed the fly. Perhaps she'll die.\n\
--     \\n\
--     \I know an old lady who swallowed a cat.\n\
--     \Imagine that, to swallow a cat!\n\
--     \She swallowed the cat to catch the bird.\n\
--     \She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n\
--     \She swallowed the spider to catch the fly.\n\
--     \I don't know why she swallowed the fly. Perhaps she'll die.\n\
--     \\n\
--     \I know an old lady who swallowed a dog.\n\
--     \What a hog, to swallow a dog!\n\
--     \She swallowed the dog to catch the cat.\n\
--     \She swallowed the cat to catch the bird.\n\
--     \She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n\
--     \She swallowed the spider to catch the fly.\n\
--     \I don't know why she swallowed the fly. Perhaps she'll die.\n\
--     \\n\
--     \I know an old lady who swallowed a goat.\n\
--     \Just opened her throat and swallowed a goat!\n\
--     \She swallowed the goat to catch the dog.\n\
--     \She swallowed the dog to catch the cat.\n\
--     \She swallowed the cat to catch the bird.\n\
--     \She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n\
--     \She swallowed the spider to catch the fly.\n\
--     \I don't know why she swallowed the fly. Perhaps she'll die.\n\
--     \\n\
--     \I know an old lady who swallowed a cow.\n\
--     \I don't know how she swallowed a cow!\n\
--     \She swallowed the cow to catch the goat.\n\
--     \She swallowed the goat to catch the dog.\n\
--     \She swallowed the dog to catch the cat.\n\
--     \She swallowed the cat to catch the bird.\n\
--     \She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n\
--     \She swallowed the spider to catch the fly.\n\
--     \I don't know why she swallowed the fly. Perhaps she'll die.\n\
--     \\n\
--     \I know an old lady who swallowed a horse.\n\
--     \She's dead, of course!\n"

song :: String
song = ""

swallowedToCatch :: Text -> Text -> Text
swallowedToCatch swallow catch = "She swallowed the " `T.append` swallow `T.append` " to catch the " `T.append` catch `T.append` "."

willDie :: Text
willDie  = "I don't know why she swallowed the fly. Perhaps she'll die."

knowLady :: Text -> Text
knowLady animal = "I know an old lady who swallowed a " `T.append` animal `T.append` "."

reactions :: [Text]
reactions = [
    ""
  , "It wriggled and jiggled and tickled inside her."
  , "How absurd to swallow a bird!"
  , "Imagine that, to swallow a cat!"
  , "What a hog, to swallow a dog!"
  , "Just opened her throat and swallowed a goat!"
  , "I don't know how she swallowed a cow!"
  , ""
  ]

animals :: [Text]
animals = [
    "fly"
  , "spider"
  , "bird"
  , "cat"
  , "dog"
  , "goat"
  , "cow"
  , "horse"
  ]

swallowChain :: Int -> Text
swallowChain 1 = swallowedToCatch (animals !! 1)  (head animals)
swallowChain i = swallowedToCatch (animals !! i) (animals !! (i-1)) `T.append` "\n" `T.append` swallowChain (i-1)

blocks :: Int -> Text
blocks 7 = T.append (knowLady (animals !! 7)) "She's dead, of course!"
blocks i = knowLady (animals !! i) `T.append` "\n" `T.append` (reactions !! i) `T.append` "\n" `T.append` swallowChain i `T.append` willDie
