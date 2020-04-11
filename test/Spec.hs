import           Covid
import           Lib
import           Test.Hspec

main :: IO ()
main =
  hspec $ do
    let countries = map stubCountry [-5 .. 5]
    describe "covidList" $
      it "Should return the formatted list for valid countries" $ do
        let expected =
              [ "C5\n  Total\t5\tDeaths\t5"
              , "C4\n  Total\t4\tDeaths\t4"
              , "C3\n  Total\t3\tDeaths\t3"
              , "C2\n  Total\t2\tDeaths\t2"
              , "C1\n  Total\t1\tDeaths\t1"
              ]
        (covidList . Covid19 $countries) `shouldBe` expected

stubCountry :: Int -> Country
stubCountry i = Country ("C" ++ is) i i i i i i ("D" ++ is)
  where
    is = show i
