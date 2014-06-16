(***************************************************************************
FILE          : tree.ml
LAST REVISION : 2008-02-12
SUBJECT       : Implementation of a binary search tree abstract type.
PROGRAMMER    : (C) Copyright 2008 by Peter C. Chapin

Please send comments or bug reports to

     Peter C. Chapin
     Electrical and Computer Engineering Technology
     Vermont Technical College
     Randolph Center, VT 05061
     Peter.Chapin@vtc.vsc.edu
****************************************************************************)

(** This module provides support for unbalanced binary search trees. The basic operations are
    provided including a conversion to list. This module is largely for demonstration and
    educational purposes. *)


type 'a t = Leaf | Node of ( 'a t * 'a * 'a t )


(** @return an empty tree. *)
let make () = Leaf

    
(** Inserts a new item into a tree. If the item already exists in the tree, there is no effect.

    @param item The item to be inserted.
    @param my_tree The tree into which the item is inserted. 
    @return a new tree containing all the elements of the old tree plus the new item.
*)
let rec insert item my_tree =
    match my_tree with
        Leaf -> Node( Leaf, item, Leaf )
      | Node(t_left, value, t_right) ->
            if item = value then Node( t_left, value, t_right )
                            else if item < value then Node( insert item t_left, value, t_right )
                                                 else Node( t_left, value, insert item t_right )

    
(** Searches a tree looking for a particular item. Items are matched using '='.

    @param item The item for which to search.
    @param my_tree The tree to search.
    @return true if the item is in the tree; false otherwise.
*)
let rec lookup item my_tree =
    match my_tree with
        Leaf -> false
      | Node(t_left, value, t_right) ->
            if item = value then true
                            else if item < value then lookup item t_left
                                                 else lookup item t_right


let rec find_minimum my_tree =
    match my_tree with
        Node(Leaf, value, _) -> value
      | Node(t_left, value, _) -> find_minimum t_left
      | Leaf -> raise (Failure "Attempted to find minimum element of an empty tree")
      
    
(** Removes an item from a tree. The item is found using '='. If the item does not exist in the
    tree, there is no effect.

    @param item The item to remove.
    @param my_tree The tree from which the item should be removed.
    @return a new tree with the item removed.
*)
let rec delete item my_tree =
    match my_tree with
        Leaf -> Leaf
      | Node(t_left, value, Leaf) ->
            if item = value then t_left
                            else if item < value then Node(delete item t_left, value, Leaf)
                                                 else Node(t_left, value, Leaf)                    
      | Node(Leaf, value, t_right) ->
            if item = value then t_right
                            else if item < value then Node(Leaf, value, t_right)
                                                 else Node(Leaf, value, delete item t_right)
      | Node(t_left, value, t_right) ->
            if item = value then
                let minimum_element = find_minimum t_right in
                    Node(t_left, minimum_element, delete minimum_element t_right)
            else if item < value then Node(delete item t_left, value, t_right)
                                 else Node(t_left, value, delete item t_right)


(** Converts a tree into a list. The tree is traversed in order to obtain the list elements.

    @param my_tree The tree to convert.
    @return a list containing the same elements as the tree in order.
*)
let rec to_list my_tree =
    match my_tree with
        Leaf -> []
      | Node( t_left, value, t_right) ->
            (to_list t_left) @ [ value ] @ (to_list t_right)

