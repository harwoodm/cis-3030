(***************************************************************************
FILE          : date.mli
LAST REVISION : 2007-10-01
SUBJECT       : Interface to a date module.
PROGRAMMER    : (C) Copyright 2007 by Peter C. Chapin

Please send comments or bug reports to

     Peter C. Chapin
     Electrical and Computer Engineering Technology
     Vermont Technical College
     Randolph Center, VT 05061
     Peter.Chapin@vtc.vsc.edu
****************************************************************************)

(* Abstract. Implementation hidden. *)
type date

exception Not_Implemented
exception Bad_Date

(* Accept a year, month, and day, and return a date. *)
val make : int -> int -> int -> date

(* Accessor functions. *)
val get_year  : date -> int
val get_month : date -> int
val get_day   : date -> int

(* Computation. *)
val advance : int -> date -> date

(* Relationals. *)
val is_equal         : date -> date -> bool
val is_notequal      : date -> date -> bool
val is_before        : date -> date -> bool
val is_beforeorequal : date -> date -> bool
val is_after         : date -> date -> bool
val is_afterorequal  : date -> date -> bool

