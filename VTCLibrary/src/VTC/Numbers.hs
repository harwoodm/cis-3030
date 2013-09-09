module VTC.Numbers(isPrime) where

isPrime :: Int -> Bool
isPrime n = not $ hasDivisor n $ n - 1
             where hasDivisor _ 1 = False
                   hasDivisor n trialNumber =
                       if n `mod` trialNumber == 0
                       then True
                       else hasDivisor n $ trialNumber - 1

