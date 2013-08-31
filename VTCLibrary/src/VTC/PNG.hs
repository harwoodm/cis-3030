module VTC.PNG(isPNG, chunkCount, splitPNG, computeCRC, verifyCRC) where

import Data.Bits
import Data.Word

-- Returns True if the given list starts with a valid PNG signature.
isPNG :: [Word8] -> Bool
isPNG pngData = False

-- Returns the number of PNG chunks in the list.
chunkCount :: [Word8] -> Int
chunkCount pngData = 0

-- Breaks the PNG file into a list of its chunks.
splitPNG :: [Word8] -> [[Word8]]
splitPNG pngData = []

-- Computes the CRC checksum over the given list using the algorithm in the PNG spec.
computeCRC :: [Word8] -> Word32
computeCRC rawData = 0

-- Verifies the CRC checksum on each chunk in a list of chunks.
verifyCRC :: [[Word8]] -> [Bool]
verifyCRC chunkList = []
