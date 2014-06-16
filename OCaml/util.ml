

(* Helper functions. How does one create a generic list printer? *)
let rec print_ilist lst = match lst with
  []    -> ()
| x::xs -> (print_int x; print_string " "; print_ilist xs)

let rec print_slist lst = match lst with
  []    -> ()
| x::xs -> (print_string x; print_string " "; print_slist xs)

