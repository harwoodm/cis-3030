
let rec has_divisors n d =
  if d = 1 then false else
    if (n mod d = 0) then true else has_divisors n (d-1);;

let is_prime n = not (has_divisors n (n-1));;

let rec prime_list n =
  if n = 1 then []
  else if (is_prime n) then (n :: prime_list (n-1))
  else prime_list (n-1);;
