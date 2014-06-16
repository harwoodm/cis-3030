(***************************************************************************
FILE          : poker.ml
LAST REVISION : 2007-10-01
SUBJECT       : Implementation to a collection of poker related entites.
PROGRAMMER    : (C) Copyright 2007 by Peter C. Chapin

Please send comments or bug reports to

     Peter C. Chapin
     Electrical and Computer Engineering Technology
     Vermont Technical College
     Randolph Center, VT 05061
     Peter.Chapin@vtc.vsc.edu
****************************************************************************)

open Cards

type deck = card list

let make_deck () =
  let rec make_suit base_card =
    try
      base_card :: make_suit (next base_card)
    with Card_Error -> [ base_card ]
  in
    (make_suit (make Ace Spades  )) @
    (make_suit (make Ace Diamonds)) @
    (make_suit (make Ace Clubs   )) @
    (make_suit (make Ace Hearts  ))

    
(* This helper function is used by shuffle, below. *)
let rec remove_nth d n =
  match d with
       [] -> []
  | x::xs -> if n = 0 then xs else x :: remove_nth xs (n - 1) 
    
  
let shuffle d =
  let dummy = Random.self_init () in
  let rec shuffle_card d count =
    if count = 0 then d
    else let n = Random.int count in
      (List.nth d n) :: shuffle_card (remove_nth d n) (count - 1)
  in
    dummy; shuffle_card d 52

    
let deal d =
  let rec deal_card (d, hand) count =
    match d with
         [] -> (d, hand)
    | x::xs -> if count = 0 then (d, hand)
                            else deal_card (xs, x::hand) (count - 1)
  in
    deal_card (d, []) 5

