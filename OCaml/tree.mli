(***************************************************************************
FILE          : tree.mli
LAST REVISION : 2008-02-12
SUBJECT       : Interface to a binary search tree abstract type.
PROGRAMMER    : (C) Copyright 2008 by Peter C. Chapin

Please send comments or bug reports to

     Peter C. Chapin
     Electrical and Computer Engineering Technology
     Vermont Technical College
     Randolph Center, VT 05061
     Peter.Chapin@vtc.vsc.edu
****************************************************************************)

type 'a t

val make    : unit -> 'a t
val insert  : 'a -> 'a t -> 'a t
val lookup  : 'a -> 'a t -> bool
val delete  : 'a -> 'a t -> 'a t
val to_list : 'a t -> 'a list
