-- Main.hs

module Main where

import Control.Exception
import System.Environment
import System.IO

import qualified ChallengeZero
import qualified ChallengeOne
import qualified ChallengeTwo
import qualified ChallengeThree
import qualified ChallengeFour

solvers = [ ChallengeZero.solve
          , ChallengeOne.solve
          , ChallengeTwo.solve
          , ChallengeThree.solve
          , ChallengeFour.solve
          ]


-- |The main function simply passes the command line arguments to parseArgs
main :: IO [()]
main = getArgs >>= parseArgs


parseArgs :: [String] -> IO [()]
parseArgs [] = do
  putStrLn "Running all challenges..."
  sequence $ map runChallenge $ map show [0..(length solvers - 1)]
parseArgs challenges = sequence $ map runChallenge challenges


runChallenge :: String -> IO ()
runChallenge challenge = do
  putStrLn $ "Running challenge " ++ challenge ++ "..."
  solvers !! read(challenge) >>= putStrLn.("Answer: " ++)
