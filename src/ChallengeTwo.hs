module ChallengeTwo (solve) where

import Data.Char

solve :: IO String
solve = do
  dataContents <- readFile "data/2.data"
  return $ filter isLetter dataContents
