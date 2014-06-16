
(*
1. Write a function merge_i which takes as input two integer lists
   sorted in increasing order and returns a new sorted list containing
   the elements of the first two.

2. Write a general function merge which takes as argument a comparison
   function and two lists sorted in this order and returns the list
   merged in the same order. The comparison function will be of type 'a
   -> 'a -> bool.

3. Apply this function to two integer lists sorted in decreasing order,
   then to two string lists sorted in decreasing order.

4. What happens if one of the lists is not in the required decreasing
   order?

5. Write a new list type in the form of a record containing three
   fields: the conventional list, an order function and a boolean
   indicating whether the list is in that order.

6. Write the function insert which adds an element to a list of this type.

7. Write a function sort which insertion sorts the elements of a list.

8. Write a new function merge for these lists.
*)

(* Merges two sorted lists into a single list. *)
let rec merge lst1 lst2 = match lst1 with
  []    -> lst2
| x::xs -> (match lst2 with
    []    -> lst1
  | y::ys -> if x < y then x :: (merge xs lst2) else y :: (merge lst1 ys))

(* Generalized merge also takes a comparison function. *)
let rec g_merge lst1 lst2 comp = match lst1 with
  []    -> lst2
| x::xs -> (match lst2 with
    []    -> lst1
  | y::ys -> if (comp x y) then x :: (g_merge xs lst2 comp)
                           else y :: (g_merge lst1 ys comp))

(* Some test lists. *)
let list1 = [5;3;1]
let list2 = [4;2;0]
let list3 = ["zebra"; "moose"; "bat"]
let list4 = ["orange"; "grapefruit"; "apple"]

(* Comparison function for decreasing order. Note that this is generic. *)
let my_comp x y = x > y

(* Compute merged lists. *)
let result1 = g_merge list1 list2 my_comp
let result2 = g_merge list3 list4 my_comp

(* Helper functions. How does one create a generic list printer? *)
let rec print_ilist lst = match lst with
  []    -> ()
| x::xs -> (print_int x; print_string " "; print_ilist xs)

let rec print_slist lst = match lst with
  []    -> ()
| x::xs -> (print_string x; print_string " "; print_slist xs)

(* New list type that remembers if it is sorted. *)
type 'a sorted_list = {
  lst       : 'a list;
  comp      : 'a -> 'a -> bool;
  is_sorted : bool
}

(* Insert an item into the sorted_lists above. *)
let insert item lst = if lst.is_sorted
                      then
                        { lst       = g_merge [ item ] lst.lst lst.comp;
                          comp      = lst.comp;
                          is_sorted = lst.is_sorted }
                      else
                        { lst       = (item :: lst.lst);
                          comp      = lst.comp;
                          is_sorted = lst.is_sorted }

(* Helper function for sorting sorted_list objects. *)
let rec raw_sort lst s_list comp = match lst with
  []    -> s_list
| x::xs -> raw_sort xs (g_merge [ x ] s_list comp) comp

(* Function to sort a sorted_list object. *)
let sort lst =
  { lst       = raw_sort lst.lst [] lst.comp;
    comp      = lst.comp;
    is_sorted = true }

let test_list = {
  lst       = [10; 12; 8; 14; 6; 16; 4; 18; 2; 20; 0];
  comp      = my_comp;
  is_sorted = false }

let result_list = sort test_list;;
print_ilist result_list.lst
