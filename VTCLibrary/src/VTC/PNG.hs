module VTC.PNG(hasPNGHeader, chunkCount, splitPNG, computeCRC, verifyCRC) where

import Data.Bits
import Data.Word

-- Returns True if the given list starts with a valid PNG signature.
hasPNGHeader :: [Word8] -> Bool
hasPNGHeader pngData = False


-- Returns the number of PNG chunks in the list.
chunkCount :: [Word8] -> Int
chunkCount pngData = 0


-- Breaks the PNG file into a list of its chunks.
splitPNG :: [Word8] -> [[Word8]]
splitPNG pngData = []


-- Computes the CRC checksum over the given list using the algorithm in the PNG spec.
processBit :: Word32 -> Word32
processBit c =
    if (testBit c 0)
    then 0xEDB88320 `xor` (shift c (-1))
    else shift c (-1)
    
bitLoop :: Int -> Word32 -> Word32
bitLoop 0       c = processBit c
bitLoop counter c = processBit $ bitLoop (counter - 1) c

processByte :: Word32 -> Word32
processByte c = bitLoop 7 c

crcTable :: [Word32]
crcTable = [ processByte n | n <- [0 .. 255]]

computeCRC :: [Word8] -> Word32
computeCRC rawData = (foldl update 0xFFFFFFFF rawData) `xor` 0xFFFFFFFF
                     where update :: Word32 -> Word8 -> Word32
                           update c dataItem =
                                  let cLowByte = (fromIntegral (c .&. 0x000000FF))::Word8
                                      index    = cLowByte `xor` dataItem
                                      intIndex = (fromIntegral index)::Int
                                  in (crcTable !! intIndex) `xor` (shift c (-8))


-- Verifies the CRC checksum on each chunk in a list of chunks.
verifyCRC :: [[Word8]] -> [Bool]
verifyCRC chunkList = []
