module VTC.List(vlength, vreverse, vzip, vunzip, vfilter, vmap, vfoldl) where

-- Some first order functions...

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
        

-- Some higher order functions...
        
        
vfilter :: (a -> Bool) -> [a] -> [a]
vfilter _ [] = []
vfilter predicate (x:xs)
        | predicate x = x : vfilter predicate xs
        | otherwise   = vfilter predicate xs


vmap :: (a -> b) -> [a] -> [b]
vmap _ [] = []
vmap transformer (x:xs) = (transformer x) : vmap transformer xs


vfoldl :: (b -> a -> b) -> b -> [a] -> b
vfoldl _  accumulator [] = accumulator
vfoldl combiner accumulator (x:xs) = vfoldl combiner (combiner accumulator x) xs
