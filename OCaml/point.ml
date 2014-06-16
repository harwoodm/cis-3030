
class point (x_init, y_init) =
object
  val mutable x = x_init
  val mutable y = y_init
  method get_x = x
  method get_y = y
  method moveto (a, b) = x <- a; y <- b
  method rmoveto (dx, dy) = x <- x + dx; y <- y + dy
  method to_string () =
    "( " ^ (string_of_int x) ^ ", " ^ (string_of_int y) ^ " )"
  method distance () = sqrt (float(x*x + y*y))
end;;

class picture n =
object
  val mutable ind = 0
  val tab = Array.create n (new point (0,0))
  method add p = 
    try  tab.(ind) <- p; ind <- ind + 1
    with Invalid_argument("Array.set")
        -> failwith ("picture.add:ind = " ^ (string_of_int ind))
  method remove () = if (ind > 0) then ind <- ind - 1
  method to_string () =
    let s = ref "[" in
      for i = 0 to ind - 1 do
        s := !s ^ " " ^ tab.(i)#to_string () done;
      (!s) ^ " ]"
end;;

class colored_point (x, y) c =
object (self)
  inherit point (x, y) as super
  val mutable c = c
  method get_color = c
  method set_color nc = c <- nc
  method to_string () =
    (super#to_string ()) ^ " [" ^ self#get_color ^ "] "
end;;

class colored_point_1 coord c =
object
  inherit colored_point coord c
  val true_colors = ["white"; "black"; "red"; "green"; "blue"; "yellow"]
  method get_color = if List.mem c true_colors then c else "UNKNOWN"
end;;

