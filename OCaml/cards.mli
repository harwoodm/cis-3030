(***************************************************************************
FILE          : cards.mli
LAST REVISION : 2007-10-01
SUBJECT       : Interface to a playing card module.
PROGRAMMER    : (C) Copyright 2007 by Peter C. Chapin

Please send comments or bug reports to

     Peter C. Chapin
     Electrical and Computer Engineering Technology
     Vermont Technical College
     Randolph Center, VT 05061
     Peter.Chapin@vtc.vsc.edu
****************************************************************************)

(* Used when an attempt is made to create an invalid card *)
exception Card_Error

type value = Ace | Number of int | Jack | Queen | King
type suit  = Spades | Diamonds | Clubs | Hearts
type card  = value * suit  (* Probably should be abstract *)

(* Constructor *)
val make : value -> suit -> card

(* Access functions *)
val get_value : card -> value
val get_suit  : card -> suit

(* Compute the next/previous card in sequence *)
val next : card -> card
val previous : card -> card

