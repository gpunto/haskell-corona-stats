module Main where

import           Control.Lens ((^.))
import           Covid        (Covid19)
import           Lib          (covidList)
import           Network.Wreq (Response, asJSON, get, responseBody)

url = "https://api.covid19api.com/summary"

main :: IO ()
main = do
  resp <- asJSON =<< get url :: IO (Response Covid19)
  mapM_ putStrLn . covidList $ resp ^. responseBody
