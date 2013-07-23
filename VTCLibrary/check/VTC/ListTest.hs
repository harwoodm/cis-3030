{-# OPTIONS_GHC -F -pgmF htfpp #-}
module VTC.ListTest where
import VTC.List

import Test.Framework

-- Tests for vlength
test_lengthEmpty    = assertEqual 0 (vlength [])

test_lengthNonEmpty = do assertEqual 1 (vlength [1])
                         assertEqual 2 (vlength [1, 2])
                         assertEqual 3 (vlength [1, 2, 3])
                         
prop_length :: [Int] -> Bool
prop_length xs = vlength (1:xs) == 1 + vlength xs


-- Tests for vreverse
test_reverseEmpty    = assertEqual ([] :: [Int]) (vreverse [])

test_reverseNonEmpty = do assertEqual [1]       (vreverse [1])
                          assertEqual [2, 1]    (vreverse [1, 2])
                          assertEqual [3, 2, 1] (vreverse [1, 2, 3])

prop_reverse :: [Int] -> Bool
prop_reverse xs = xs == vreverse (vreverse xs)


-- Tests for vzip
test_zipEmpty    = do assertEqual ([] :: [(Int, Int)]) (vzip ([] , []))
                      assertEqual ([] :: [(Int, Int)]) (vzip ([1], []))
                      assertEqual ([] :: [(Int, Int)]) (vzip ([] , [1]))

test_zipNonEmpty = do assertEqual [(1, "Hello")] (vzip ([1], ["Hello"]))
                      assertEqual [(1, "Hello"), (2, "World")] (vzip ([1, 2], ["Hello", "World"]))
                      
test_zipUnequal  = do assertEqual [(1, "Hello")] (vzip ([1, 2], ["Hello"]))
                      assertEqual [(1, "Hello")] (vzip ([1], ["Hello", "World"]))
                      

-- Tests for vunzip
test_unzipEmpty    = assertEqual ([], []) (vunzip ([] :: [(Int, Int)]))

test_unzipNonEmpty = do assertEqual ([1], ["Hello"]) (vunzip [(1, "Hello")])
                        assertEqual ([1, 2], ["Hello", "World"]) (vunzip [(1, "Hello"), (2, "World")]) 


prop_zip :: [(Int, Int)] -> Bool
prop_zip xs = xs == vzip (vunzip xs)
-- Another useful property is that the unzip of a zip results in lists that are prefixes of the originals.