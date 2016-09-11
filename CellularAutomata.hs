module CellularAutomata
( evolve
, renderEvolution
) where

import qualified Data.List as List
import qualified Data.List.Split as List.Split
import qualified Data.Map as Map

extractNeighborhoods :: [Int] -> [[Int]]
extractNeighborhoods xs = List.Split.divvy 3 1 (0 : xs ++ [0])

evolveOnce :: Map.Map [Int] Int -> [Int] -> [Int]
evolveOnce rule state = map applyRuleToNeighborhood $ extractNeighborhoods state
  where applyRuleToNeighborhood x = case Map.lookup x rule of Just y -> y

evolve :: Map.Map [Int] Int -> [Int] -> Int -> [[Int]]
evolve rule state steps = take (succ steps) $ iterate (evolveOnce rule) state

renderState :: [Int] -> [Char]
renderState = map renderCell
  where renderCell x
          | x == 1    = 'x'
          | otherwise = ' '

renderEvolution :: [[Int]] -> [Char]
renderEvolution xs = List.intercalate "\n" $ map renderState xs
