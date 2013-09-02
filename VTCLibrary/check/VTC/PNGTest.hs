{-# OPTIONS_GHC -F -pgmF htfpp #-}
module VTC.PNGTest where
import VTC.PNG

import Test.Framework

test_pngCRC = do assertEqual          0 (computeCRC [])
                 assertEqual  622876539 (computeCRC [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
                 assertEqual 3435948266 (computeCRC [0xFF, 0xFE, 0xFD, 0xFC, 0xFB, 0xFA, 0xF9, 0xF8])
