module VTC.Tree(Tree, size, insert, contains, makeTree) where

data Tree = Leaf | Node Tree Int Tree deriving (Show)

size :: Tree -> Int
size Leaf = 0
size (Node left _ right) = 1 + size left + size right

insert :: Tree -> Int -> Tree
insert Leaf n = Node Leaf n Leaf
insert (Node left value right) n
    | n == value = Node left value right
    | n <  value = Node (insert left n) value right
    | otherwise  = Node left value (insert right n)
    
contains :: Tree -> Int -> Bool
Leaf `contains` _ = False
(Node left value right) `contains` n
    | n == value = True
    | n <  value = contains left n
    | otherwise  = contains right n
    
makeTree :: Tree
makeTree = Leaf