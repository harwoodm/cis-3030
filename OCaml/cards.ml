(***************************************************************************
FILE          : cards.ml
LAST REVISION : 2007-10-01
SUBJECT       : Implementation of a playing card module.
PROGRAMMER    : (C) Copyright 2007 by Peter C. Chapin

Please send comments or bug reports to

     Peter C. Chapin
     Electrical and Computer Engineering Technology
     Vermont Technical College
     Randolph Center, VT 05061
     Peter.Chapin@vtc.vsc.edu
****************************************************************************)

exception Card_Error

type value = Ace | Number of int | Jack | Queen | King
type suit  = Spades | Diamonds | Clubs | Hearts
type card  = value * suit

let make v s =
  match v with
     Number(n) -> if n < 2 || n > 10 then raise Card_Error else (v, s)
  |  _         -> (v, s)

let get_value c = fst c
let get_suit  c = snd c
  
let next (v, s) =
 ((match v with
     Ace       -> Number(2)
  |  Number(n) -> if n = 10 then Jack else Number(n+1)
  |  Jack      -> Queen
  |  Queen     -> King
  |  King      -> raise Card_Error), s)
     
let previous (v, s) =
 ((match v with
     Ace       -> raise Card_Error
  |  Number(n) -> if n = 2 then Ace else Number(n-1)
  |  Jack      -> Number(10)
  |  Queen     -> Jack
  |  King      -> Queen), s)

