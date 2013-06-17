module ChallengeFour (solve) where

import Control.Monad
import Network.HTTP
import Text.Regex.Posix

-- The linkedlist responds with either a Number "12345", the Answer "peak", or
-- Other "divide by two and keep going"
data NothingResponse = Number String
                     | Answer String
                     | Other String

solve :: IO String
solve = getAnswer "12345"

getAnswer :: String -> IO String
getAnswer currentNothing = do
  nextNothing currentNothing >>= decide
  where decide (Number nothing) = getAnswer nothing
        -- message tells us to divide the current nothing by two
        -- 16044 / 2 = 8022
        decide (Other  message) = getAnswer "8022"
        decide (Answer url)     = return url


nextNothing :: String -> IO (NothingResponse)
nextNothing nothing = do
  response <- getNothing nothing
  putStrLn response
  return $ parseNothing response

getNothing :: String -> IO String
getNothing nothing =
  simpleHTTP (getRequest url) >>= getResponseBody
  where url = "http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=" ++ nothing

parseNothing :: String -> NothingResponse
parseNothing nothing =
  getNumberMatch $ nothing =~ "the next nothing is ([0-9]{3,5})$"
  where getNumberMatch  []      = getAnswerMatch $ nothing =~ "(.*)\\.html$"
        getNumberMatch  matches = Number $ last $ last matches
        getAnswerMatch  []      = Other  nothing
        getAnswerMatch  matches = Answer $ last $ last matches
