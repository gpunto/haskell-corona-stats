{-# LANGUAGE DeriveGeneric #-}

module Covid
  ( Covid19(..)
  , Country(..)
  ) where

import           Data.Aeson   (FromJSON (parseJSON), Options, defaultOptions,
                               fieldLabelModifier, genericParseJSON)

import           Data.Char    (toUpper)
import           GHC.Generics (Generic)

newtype Covid19 =
  Covid19
    { countries :: [Country]
    }
  deriving (Show, Generic)

data Country =
  Country
    { country        :: String
    , newConfirmed   :: Int
    , totalConfirmed :: Int
    , newDeaths      :: Int
    , totalDeaths    :: Int
    , newRecovered   :: Int
    , totalRecovered :: Int
    , date           :: String
    }
  deriving (Show, Generic)

instance FromJSON Covid19 where
  parseJSON = genericParseJSON pascalOptions

instance FromJSON Country where
  parseJSON = genericParseJSON pascalOptions

pascalOptions :: Options
pascalOptions = defaultOptions {fieldLabelModifier = applyFirst toUpper}

applyFirst :: (a -> a) -> [a] -> [a]
applyFirst f []     = []
applyFirst f (x:xs) = f x : xs
