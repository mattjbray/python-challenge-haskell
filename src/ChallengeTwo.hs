module ChallengeTwo (solve) where

import Data.Char

solve data_contents =
  filter isLetter data_contents
