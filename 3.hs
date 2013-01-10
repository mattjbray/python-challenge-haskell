import Text.Regex.Posix
import System.IO

main = do
  handle <- openFile "3.data" ReadMode
  contents <- hGetContents handle
  putStrLn $ (concatSubMatches . getMatches) contents
  hClose handle

-- extracts submatches from a list of [match, submatch] and concatenates them
concatSubMatches :: [[String]] -> String
concatSubMatches = concatMap f
  where f [_,x] = x

-- returns a list of [match, submatch]
getMatches :: String -> [[String]]
getMatches x = x =~ "[^A-Z][A-Z]{3}([a-z])[A-Z]{3}[^A-Z]"
