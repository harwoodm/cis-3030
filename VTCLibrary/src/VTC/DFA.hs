module VTC.DFA(Symbol(..), State(..), DFA, simulate) where

import Data.Set (Set)
import qualified Data.Set as Set

data Symbol = Zero | One
data State = Q Int deriving (Eq, Ord)

-- Conceptually the machine has infinitely many states, even if most are not used.
-- The initial state is always (Q 0).
type DFA = ((State, Symbol) -> State, Set State)

simulate :: DFA -> [Symbol] -> Bool
simulate machine sentence = simulateFrom machine sentence (Q 0)
    where simulateFrom (_, acceptStates) [] currentState = currentState `Set.member` acceptStates
          simulateFrom (transition, acceptStates) (x:xs) currentState =
              simulateFrom (transition, acceptStates) xs (transition (currentState, x))