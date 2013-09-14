module VTC.PNG(hasPNGHeader, chunkCount, splitPNG, computeCRC, verifyCRC) where

import           Data.Bits
import           Data.Word

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
computeCRC :: [Word8] -> Word32
computeCRC rawData = complement $ foldl update 0xFFFFFFFF rawData
    where update :: Word32 -> Word8 -> Word32
          update c dataItem =
              let cLowByte = fromIntegral (c .&. 0x000000FF)
                  index    = cLowByte `xor` dataItem
                  intIndex = fromIntegral index
              in (crcTable !! intIndex) `xor` shift c (-8)

          crcTable :: [Word32]
          crcTable = [ processByte n | n <- [0 .. 255]]
              where processByte :: Word32 -> Word32
                    processByte c = bitLoop 7 c

                    bitLoop :: Int -> Word32 -> Word32
                    bitLoop 0       c = processBit c
                    bitLoop counter c = processBit $ bitLoop (counter - 1) c

                    processBit :: Word32 -> Word32
                    processBit c
                        | testBit c 0 = 0xEDB88320 `xor` shift c (-1)
                        | otherwise   = shift c (-1)


-- Verifies the CRC checksum on each chunk in a list of chunks.
verifyCRC :: [[Word8]] -> [Bool]
verifyCRC chunkList = []
