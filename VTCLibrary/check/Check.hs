{-# OPTIONS_GHC -F -pgmF htfpp #-}
module Main where


import Test.Framework

import {-@ HTF_TESTS @-} VTC.ListTest
import {-@ HTF_TESTS @-} VTC.NumbersTest
import {-@ HTF_TESTS @-} VTC.PNGTest

main :: IO()
main = htfMain htf_importedTests
