module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock Int Int deriving (Eq, Show)

fromHourMin :: Int -> Int -> Clock
fromHourMin hour minute
  | minute > 59 || minute < 0 = Clock (mod (hour + div minute 60) 24) (mod minute 60)
  | otherwise = Clock (mod hour 24) minute

toString :: Clock -> String
toString (Clock hour minute) = h ++ ":" ++ m
  where h :: String
        h = if length hs == 1 then '0' : hs else hs
        m :: String
        m = if length ms == 1 then '0' : ms else ms
        hs = show hour
        ms = show minute

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour minute (Clock ch cm) 
  | hour < 0 || minute < 0 = fromHourMin (hour + ch) (minute + cm)
  | otherwise = fromHourMin h m
        where h = mod (div totalMinutes 60) 24
              m = totalMinutes `rem` 60
              totalMinutes = (hour * 60 ) + minute + (ch * 60) + cm

