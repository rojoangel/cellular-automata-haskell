module CellularAutomata where

import qualified Data.List.Split as List.Split

extractNeighborhoods :: [Int] -> [[Int]]
extractNeighborhoods xs = List.Split.divvy 3 1 (0 : xs ++ [0])
