(***************************************************************************
FILE          : calendar.ml
LAST REVISION : 2007-10-15
SUBJECT       : Demonstration of OCaml's module system.
PROGRAMMER    : (C) Copyright 2007 by Peter C. Chapin

Please send comments or bug reports to

     Peter C. Chapin
     Electrical and Computer Engineering Technology
     Vermont Technical College
     Randolph Center, VT 05061
     Peter.Chapin@vtc.vsc.edu
****************************************************************************)

(* Define a module type for date abstract types *)
module type DateSig = sig
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
end


(* Extend the module type above with relational operators. *)
module type DateWithCompareSig = sig
  include DateSig

  (* Relationals. *)
  val is_equal         : date -> date -> bool
  val is_notequal      : date -> date -> bool
  val is_before        : date -> date -> bool
  val is_beforeorequal : date -> date -> bool
  val is_after         : date -> date -> bool
  val is_afterorequal  : date -> date -> bool
end

(****************************************************************************)

(* A date module of type DateWithCompareSig. *)
module BasicDate : DateWithCompareSig = struct
  type date = { y : int; m : int; d : int }

  exception Not_Implemented
  exception Bad_Date

  let month_lengths =
    [| 31; 28; 31; 30; 31; 30; 31; 31; 30; 31; 30; 31 |]

  let is_leap year =
    if year mod 4 != 0 then false
    else if year mod 100 != 0 then true
    else if year mod 400 != 0 then false
    else true

  let last_day year month =
    if month = 2 && is_leap year then 29
    else month_lengths.(month - 1)

  let next the_date =
    if the_date.d != last_day the_date.y the_date.m then
      { y = the_date.y; m = the_date.m; d = the_date.d + 1 }
    else if the_date.m != 12 then
      { y = the_date.y; m = the_date.m + 1; d = 1 }
    else
      { y = the_date.y + 1; m = 1; d = 1 }

  let previous the_date = raise Not_Implemented

  let make year month day =
    {
      y = if year  < 1900 || year  > 2099 then raise Bad_Date else year;
      m = if month < 1    || month > 12   then raise Bad_Date else month;
      d = if day   < 1    || day   > 31   then raise Bad_Date else day;
    }

  let get_year  the_date = the_date.y
  let get_month the_date = the_date.m
  let get_day   the_date = the_date.d

  let rec advance delta the_date =
    if delta = 0 then the_date
    else if delta > 0 then advance (delta - 1) (next the_date)
    else advance (delta + 1) (previous the_date)

  let is_equal         d1 d2 = d1.y = d2.y && d1.m = d2.m && d1.d = d2.d
  let is_notequal      d1 d2 = not (is_equal d1 d2)
  let is_before        d1 d2 =
    if d1.y < d2.y then true
    else if d1.y = d2.y then
      if d1.m < d2.m then true
      else if d1.m = d2.m then
        if d1.d < d2.d then true
        else false
      else false
    else false

  let is_beforeorequal d1 d2 = (is_before d1 d2) || (is_equal d1 d2)
  let is_after         d1 d2 = is_before d2 d1
  let is_afterorequal  d1 d2 = (is_after d1 d2) || (is_equal d1 d2)
end


(* Another date module with the same signature as above. *)
module JDDate : DateWithCompareSig = struct
  type date = { jd_number : int }

  exception Not_Implemented
  exception Bad_Date

  (* Wrong! *)
  let get_year  the_date = 2000
  let get_month the_date = 1
  let get_day   the_date = 1

  (* Very wrong! *)
  let make year month day = { jd_number = 1 }

  let advance delta the_date = { jd_number = the_date.jd_number + delta }

  let is_equal         d1 d2 = d1.jd_number =  d2.jd_number
  let is_notequal      d1 d2 = d1.jd_number != d2.jd_number
  let is_before        d1 d2 = d1.jd_number <  d2.jd_number
  let is_beforeorequal d1 d2 = d1.jd_number <= d2.jd_number
  let is_after         d1 d2 = d1.jd_number >  d2.jd_number
  let is_afterorequal  d1 d2 = d1.jd_number >= d2.jd_number
end


(* A module that is parameterized by another module. *)
module Calendar( Date : DateWithCompareSig ) = struct

  (* ... various calendar functions using services of module Date ... *)
end


(* Now create modules by "calling" the module function defined above. *)
module BasicCalendar = Calendar( BasicDate )
module JDCalendar = Calendar( JDDate )
