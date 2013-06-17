module ChallengeThree (solve) where

import Text.Regex.Posix

solve :: IO String
solve = do
  dataContents <- readFile "data/3.data"
  return $ (concatSubMatches . getMatches) dataContents

-- extracts submatches from a list of [match, submatch] and concatenates them
concatSubMatches :: [[String]] -> String
concatSubMatches = concatMap f
  where f [_,x] = x

-- returns a list of [match, submatch]
getMatches :: String -> [[String]]
getMatches x = x =~ "[^A-Z][A-Z]{3}([a-z])[A-Z]{3}[^A-Z]"
