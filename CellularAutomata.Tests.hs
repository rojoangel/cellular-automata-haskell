module CellularAutomata.Test where
import CellularAutomata
import Rules
import Test.Hspec

main = hspec $ do
  describe "evolve" $ do
    it "evolve should work on rule90" $ do
       evolve rule90 [1,1,0,1,0,1,0] 5 `shouldBe` [[1,1,0,1,0,1,0],
                                                   [1,1,0,0,0,0,1],
                                                   [1,1,1,0,0,1,0],
                                                   [1,0,1,1,1,0,1],
                                                   [0,0,1,0,1,0,0],
                                                   [0,1,0,0,0,1,0]]
  describe "renderEvolution" $ do
    it "render an evolution" $ do
      renderEvolution [[1,1,0,1,0,1,0],
                       [1,1,0,0,0,0,1],
                       [1,1,1,0,0,1,0]] `shouldBe` "xx x x \nxx    x\nxxx  x \n"
