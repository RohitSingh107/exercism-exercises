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
-- song = T.unpack $ T.unlines $ intersperse "\n" $ blocks <$> [0..7]
song = T.unpack $ T.unlines $ blocks <$> [0..7]

swallowText :: Text
swallowText = "She swallowed the "

catchText :: Text
catchText = " to catch the "

willDie :: Text
willDie  = "I don't know why she swallowed the fly. Perhaps she'll die.\n"

knowLady :: Text -> Text
knowLady animal = "I know an old lady who swallowed a " `T.append` animal `T.append` ".\n"

reactions :: [Text]
reactions = [
    ""
  , "It wriggled and jiggled and tickled inside her.\n"
  , "How absurd to swallow a bird!\n"
  , "Imagine that, to swallow a cat!\n"
  , "What a hog, to swallow a dog!\n"
  , "Just opened her throat and swallowed a goat!\n"
  , "I don't know how she swallowed a cow!\n"
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

swallowedToCatch :: Text -> Text -> Text
swallowedToCatch swallow catch = swallowText `T.append` swallow `T.append` catchText `T.append` catch `T.append` ".\n"



swallowChain :: Int -> Text
swallowChain 1 = swallowedToCatch (animals !! 1)  (head animals)
swallowChain 2 = swallowText `T.append` (animals !! 2) `T.append` catchText `T.append` (animals !! 1) `T.append` " that wriggled and jiggled and tickled inside her.\n" `T.append` swallowChain 1
swallowChain i = swallowedToCatch (animals !! i) (animals !! (i-1)) `T.append` swallowChain (i-1)

blocks :: Int -> Text
blocks 0 = knowLady (head animals) `T.append` willDie
blocks 7 = T.append (knowLady (animals !! 7)) "She's dead, of course!"
blocks i = knowLady (animals !! i) `T.append` (reactions !! i) `T.append` swallowChain i `T.append` willDie
