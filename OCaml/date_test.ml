(***************************************************************************
FILE          : date_test.ml
LAST REVISION : 2007-10-01
SUBJECT       : Test program for the OCaml date module.
PROGRAMMER    : (C) Copyright 2007 by Peter C. Chapin

Please send comments or bug reports to

     Peter C. Chapin
     Electrical and Computer Engineering Technology
     Vermont Technical College
     Randolph Center, VT 05061
     Peter.Chapin@vtc.vsc.edu
****************************************************************************)

open Date;;

let date_A = make 1999 12 31 in
let date_B = make 2000  2 28 in
let date_C = make 2001  2 28 in
let date_D = make 1900  2 28 in
  if
    is_notequal (advance 1 date_A) (make 2000 1  1) ||
    is_notequal (advance 1 date_B) (make 2000 2 29) ||
    is_notequal (advance 1 date_C) (make 2001 3  1) ||
    is_notequal (advance 1 date_D) (make 1900 3  1)
  then
    print_string "FAILURE!\n"
  else
    print_string "SUCCESS!\n"
