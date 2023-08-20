module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show)

-- data Robot = Robot Bearing (Integer, Integer) deriving (Eq, Show)


data Robot = Robot
    { bearing :: Bearing
    , coordinates :: (Integer, Integer)
    } deriving (Eq, Show)

-- bearing :: Robot -> Bearing
-- bearing robot = error "You need to implement this function."
--
-- coordinates :: Robot -> (Integer, Integer)
-- coordinates robot = error "You need to implement this function."

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot = Robot

move :: Robot -> String -> Robot
move r [] = r
move  (Robot North (x,y)) (i:is) = case i of
                                     'R' -> move (Robot East (x,y)) is
                                     'L' -> move (Robot West (x,y)) is
                                     _ -> move (Robot North (x,y+1)) is

move  (Robot East (x,y)) (i:is) =  case i of
                                     'R' -> move (Robot South (x,y)) is
                                     'L' -> move (Robot North (x,y)) is
                                     _ -> move (Robot East (x +1,y)) is
move  (Robot South (x,y)) (i:is) = case i of
                                     'R' -> move (Robot West (x,y)) is
                                     'L' -> move (Robot East (x,y)) is
                                     _ -> move (Robot South (x,y-1)) is
move  (Robot West (x,y)) (i:is) =  case i of
                                     'R' -> move (Robot North (x,y)) is
                                     'L' -> move (Robot South (x,y)) is
                                     _ -> move (Robot West (x-1,y)) is
