{-# OPTIONS_GHC -F -pgmF htfpp #-}
module VTC.DFATest where
import VTC.DFA

import Data.Set (Set)
import qualified Data.Set as Set
import Test.Framework

convertSymbols :: String -> [Symbol]
convertSymbols w = map letterToSymbol w
    where letterToSymbol '0' = Zero
          letterToSymbol '1' = One
          letterToSymbol  _  = undefined
          
t1 :: (State, Symbol) -> State
t1 (Q 0, Zero) = Q 0
t1 (Q 0, One ) = Q 3
t1 (Q 1, Zero) = Q 2
t1 (Q 1, One ) = Q 0
t1 (Q 2, Zero) = Q 3
t1 (Q 2, One ) = Q 1
t1 (Q 3, Zero) = Q 2
t1 (Q 3, One ) = Q 0
t1 _ = undefined

acceptStates1 :: Set State
acceptStates1 = Set.fromList [Q 2, Q 3]

test_dfa1 = do assertEqual False (simulate (t1, acceptStates1) (convertSymbols "10110"))
               assertEqual True  (simulate (t1, acceptStates1) (convertSymbols "10011"))

