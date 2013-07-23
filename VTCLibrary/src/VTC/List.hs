module VTC.List(vlength, vreverse, vzip, vunzip) where

vlength :: [a] -> Int
vlength []     = 0
vlength (_:xs) = 1 + vlength xs


vreverse :: [a] -> [a]
vreverse []     = []
vreverse (x:xs) = vreverse xs ++ [x]


vzip :: ([a], [b]) -> [(a, b)]
vzip ([]  , []  ) = []
vzip (_:_ , []  ) = []
vzip ([]  , _:_ ) = []
vzip (x:xs, y:ys) = (x, y) : vzip (xs, ys)


vunzip :: [(a, b)] -> ([a], [b])
vunzip [] = ([], [])
vunzip ((x, y):remainingPairs) = (x:xitems, y:yitems)
        where (xitems, yitems) = vunzip remainingPairs