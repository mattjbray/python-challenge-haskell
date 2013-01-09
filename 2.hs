import Data.Char
import System.IO

main = do
  handle <- openFile "2.data" ReadMode
  contents <- hGetContents handle
  putStr $ filter isLetter contents
  hClose handle
