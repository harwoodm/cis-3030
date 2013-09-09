{-# OPTIONS_GHC -F -pgmF htfpp #-}
module VTC.NumbersTest where
import VTC.Numbers

import Test.Framework

test_isPrime = do assertEqual True  (isPrime   2)
                  assertEqual True  (isPrime   3)
                  assertEqual True  (isPrime  17)
                  assertEqual True  (isPrime  31)
                  assertEqual False (isPrime   4)
                  assertEqual False (isPrime  15)
                  assertEqual False (isPrime 121)
