import System.Environment
import qualified Data.Map as Map
import CellularAutomata
import Rules

ruleFromString :: [(String, Map.Map [Cell] Cell)]
ruleFromString = [ ("rule90", rule90)
                  ,("rule30", rule30)]

main = do
    (ruleArg:stepsArg:_) <- getArgs
    let (Just rule) = lookup ruleArg ruleFromString
    let steps = read stepsArg :: Int
    let initialState = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                       0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                       0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                       0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    putStr . renderEvolution $ evolve rule (map Cell initialState) steps
