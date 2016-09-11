module CellularAutomata
(
evolve
) where

import qualified Data.List.Split as List.Split
import qualified Data.Map as Map

-- +-----------------------------------------------------------------+
-- | Neighborhood    | 111 | 110 | 101 | 100 | 011 | 010 | 001 | 000 |
-- +-----------------------------------------------------------------+
-- | New Center Cell |  0  |  1  |  0  |  1  |  1  |  0  |  1  |  0  |
-- +-----------------------------------------------------------------+
rule90 :: Map.Map [Int] Int
rule90 = Map.fromList [
  ([1,1,1], 0),
  ([1,1,0], 1),
  ([1,0,1], 0),
  ([1,0,0], 1),
  ([0,1,1], 1),
  ([0,1,0], 0),
  ([0,0,1], 1),
  ([0,0,0], 0)]

extractNeighborhoods :: [Int] -> [[Int]]
extractNeighborhoods xs = List.Split.divvy 3 1 (0 : xs ++ [0])

evolveOnce :: Map.Map [Int] Int -> [Int] -> [Int]
evolveOnce rule state = map applyRuleToNeighborhood $ extractNeighborhoods state
  where applyRuleToNeighborhood x = case Map.lookup x rule of Just y -> y

evolve :: Map.Map [Int] Int -> [Int] -> Int -> [[Int]]
evolve rule state steps = take (succ steps) $ iterate (evolveOnce rule) state
