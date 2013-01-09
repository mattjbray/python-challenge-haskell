import Data.Char
import System.IO

main = do 
  handle <- openFile "1.data" ReadMode
  contents <- hGetContents handle

  -- Translate the clue
  putStrLn $ translate 2 contents

  -- Translate the URL
  putStrLn $ translate 2 "map"

  hClose handle

translate :: Int -> [Char] -> [Char]
translate n phrase = map (translateChar n) phrase

translateChar :: Int -> Char -> Char
translateChar n x = chr $ (ord x) + (wrapOffset n x)

-- Don't translate punctuation and wrap offsets past 'z'
wrapOffset :: Int -> Char -> Int
wrapOffset n x
  | ord x > 122     = 0
  | ord x < 97      = 0
  | ord x + n > 122 = n - 26
  | otherwise       = n 
