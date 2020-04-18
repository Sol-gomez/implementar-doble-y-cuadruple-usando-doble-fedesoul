import PdePreludat
import Library
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "Test costo de reparacion" $ do
    it "Patente AT001LN" $ do
      costoReparacion "AT001LN" `shouldBe` 12500
    it "Patente DJV214" $ do
      costoReparacion "DJV214" `shouldBe` 18000
    it "Patente DJV215" $ do
      costoReparacion "DJV215" `shouldBe` 20000
    it "Paatente DFH029" $ do
      costoReparacion "DFH029" `shouldBe` 15000
