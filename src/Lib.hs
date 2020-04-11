{-# LANGUAGE OverloadedStrings #-}

module Lib
  ( covidList
  ) where

import           Covid     (Country (..), Covid19 (..))
import           Data.List (sortOn)
import           Data.Ord  (Down (Down))

covidList :: Covid19 -> [String]
covidList = map format . sortOn descendingCases . filter withSomeCases . countries

withSomeCases :: Country -> Bool
withSomeCases = (> 0) . totalConfirmed

descendingCases :: Country -> Down Int
descendingCases = Down . totalConfirmed

format :: Country -> String
format c = country c ++ "\n  Total\t" ++ show (totalConfirmed c) ++ "\tDeaths\t" ++ show (totalDeaths c)
