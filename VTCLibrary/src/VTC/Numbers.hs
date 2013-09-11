module VTC.Numbers(isPrime) where

isPrime :: Int -> Bool
isPrime n = not $ hasDivisor n $ n - 1
            where hasDivisor _ 1 = False
                  hasDivisor m trialNumber =
                      m `mod` trialNumber == 0 || hasDivisor m (trialNumber - 1)

