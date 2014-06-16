(***************************************************************************
FILE          : poker.mli
LAST REVISION : 2007-10-01
SUBJECT       : Interface to a collection of poker related entites.
PROGRAMMER    : (C) Copyright 2007 by Peter C. Chapin

Please send comments or bug reports to

     Peter C. Chapin
     Electrical and Computer Engineering Technology
     Vermont Technical College
     Randolph Center, VT 05061
     Peter.Chapin@vtc.vsc.edu
****************************************************************************)

type deck

(* Deck manipulation functions. Note: shuffle has side effects! *)
val make_deck : unit -> deck
val shuffle   : deck -> deck
val deal      : deck -> deck * Cards.card list

