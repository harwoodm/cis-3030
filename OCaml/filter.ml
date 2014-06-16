
try while true do
  let ch = input_char stdin in
    output_char stdout ch
  done
with End_of_file -> ()

