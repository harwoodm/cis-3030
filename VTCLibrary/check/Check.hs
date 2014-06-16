{-# OPTIONS_GHC -F -pgmF htfpp #-}
module Main where


import Test.Framework

import {-@ HTF_TESTS @-} VTC.DFATest
import {-@ HTF_TESTS @-} VTC.ListTest
import {-@ HTF_TESTS @-} VTC.NumbersTest

main :: IO()
main = htfMain htf_importedTests
