module CellularAutomata
( Cell(..)
, evolve
, renderEvolution
) where

import qualified Data.List.Split as List.Split
import qualified Data.Map as Map

data Cell = Cell Integer deriving (Eq, Ord, Show)

extractNeighborhoods :: [Cell] -> [[Cell]]
extractNeighborhoods xs = List.Split.divvy 3 1 (Cell 0 : xs ++ [Cell 0])

evolveOnce :: Map.Map [Cell] Cell -> [Cell] -> [Cell]
evolveOnce rule state = map applyRuleToNeighborhood $ extractNeighborhoods state
  where applyRuleToNeighborhood x = case Map.lookup x rule of Just y -> y

evolve :: Map.Map [Cell] Cell -> [Cell] -> Int -> [[Cell]]
evolve rule state steps = take (succ steps) $ iterate (evolveOnce rule) state

renderCell :: Cell -> Char
renderCell (Cell 1) = 'x'
renderCell (Cell 0) = ' '

renderState :: [Cell] -> [Char]
renderState = map renderCell

renderEvolution :: [[Cell]] -> [Char]
renderEvolution xs = unlines $ map renderState xs
