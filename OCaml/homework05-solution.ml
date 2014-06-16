(***************************************************************************
FILE          : homework05-solution.ml
LAST REVISION : 2008-12-11
SUBJECT       : Solution to CIS-3030, Homework #5
PROGRAMMER    : (C) Copyright 2008 by Peter C. Chapin

Please send comments or bug reports to

     Peter C. Chapin
     Computer Information Systems Department
     Vermont Technical College
     Randolph Center, VT 05061
     Peter.Chapin@vtc.vsc.edu
****************************************************************************)

(* 1 *)
let rec fib n =
  if n = 0 then 0
  else if n = 1 then 1
       else fib (n - 1) + fib (n - 2);;


(* 2a *)
let list_mult some_list =
  List.fold_left (fun x y -> x * y) 1 some_list;;

(* 2b *)
let list_mult2 some_list =
  let rec helper accumulator remaining_list =
    match remaining_list with
        []    -> accumulator
      | x::xs -> helper (accumulator * x) xs
  in
    helper 1 some_list;;


(* 3 *)
let rec unzip zipped =
  match zipped with
      []    -> ([], [])
    | x::xs -> let unzipped_tail = unzip xs in
        ( fst x :: fst unzipped_tail, snd x :: snd unzipped_tail );;


(* 4 *)
let rec zip two_lists =
    match two_lists with
        ([], _) -> []
      | (_, []) -> []
      | (x::xs, y::ys) -> (x, y) :: zip (xs, ys);;
