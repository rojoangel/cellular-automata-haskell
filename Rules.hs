module Rules
( rule30
, rule90
) where

import qualified Data.Map as Map
import CellularAutomata

-- +-----------------------------------------------------------------+
-- | Neighborhood    | 111 | 110 | 101 | 100 | 011 | 010 | 001 | 000 |
-- +-----------------------------------------------------------------+
-- | New Center Cell |  0  |  0  |  0  |  1  |  1  |  1  |  1  |  0  |
-- +-----------------------------------------------------------------+
rule30 :: Map.Map [Cell] Cell
rule30 = Map.fromList [
  ([Cell 1, Cell 1, Cell 1], Cell 0),
  ([Cell 1, Cell 1, Cell 0], Cell 0),
  ([Cell 1, Cell 0, Cell 1], Cell 0),
  ([Cell 1, Cell 0, Cell 0], Cell 1),
  ([Cell 0, Cell 1, Cell 1], Cell 1),
  ([Cell 0, Cell 1, Cell 0], Cell 1),
  ([Cell 0, Cell 0, Cell 1], Cell 1),
  ([Cell 0, Cell 0, Cell 0], Cell 0)]

-- +-----------------------------------------------------------------+
-- | Neighborhood    | 111 | 110 | 101 | 100 | 011 | 010 | 001 | 000 |
-- +-----------------------------------------------------------------+
-- | New Center Cell |  0  |  1  |  0  |  1  |  1  |  0  |  1  |  0  |
-- +-----------------------------------------------------------------+
rule90 :: Map.Map [Cell] Cell
rule90 = Map.fromList [
  ([Cell 1, Cell 1, Cell 1], Cell 0),
  ([Cell 1, Cell 1, Cell 0], Cell 1),
  ([Cell 1, Cell 0, Cell 1], Cell 0),
  ([Cell 1, Cell 0, Cell 0], Cell 1),
  ([Cell 0, Cell 1, Cell 1], Cell 1),
  ([Cell 0, Cell 1, Cell 0], Cell 0),
  ([Cell 0, Cell 0, Cell 1], Cell 1),
  ([Cell 0, Cell 0, Cell 0], Cell 0)]
