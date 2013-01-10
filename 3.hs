import Text.Regex.Posix
import System.IO

main = do
  handle <- openFile "3.data" ReadMode
  contents <- hGetContents handle
  putStrLn $ show $ doStuff contents
  hClose handle

doStuff contents = concat $ map f ( doMatch contents)
  where f [_,x] = x

doMatch x = x =~ "[a-z][A-Z]{3}([a-z])[A-Z]{3}[a-z]" :: [[String]]
