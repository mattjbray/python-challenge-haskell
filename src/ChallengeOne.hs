module ChallengeOne (solve) where

import Data.Char

solve :: IO String
solve = do
  dataContents <- readFile "data/1.data"
  return $ (translate 2 dataContents) ++ url
  where
    -- Translate the URL
    url  = translate 2 "map"


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
