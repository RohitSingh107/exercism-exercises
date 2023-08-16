module SecretHandshake (handshake) where

handshake :: Int -> [String]
handshake n = binaryToActions 0 (reverse $ decimalToBinary n) []


decimalToBinary :: Int -> [Int]
decimalToBinary 0 = [0]
decimalToBinary 1 = [1]
decimalToBinary n = decimalToBinary (div n 2) ++ [mod n 2]

binaryToActions :: Int -> [Int] -> [String] -> [String]
binaryToActions _ [] actions = reverse actions
binaryToActions 4 xs actions  = if head xs == 1 then actions else reverse actions
binaryToActions n (x:xs) actions = binaryToActions (n+1) xs act
  where
    act = if x == 0 then actions else action : actions
    action = case n of
      0 -> "wink"
      1 -> "double blink"
      2 -> "close your eyes"
      _ -> "jump"
