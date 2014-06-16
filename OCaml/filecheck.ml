
let outfile = open_out "afile.txt" in
  begin
    output_string outfile "Hello, World!\n";
    close_out outfile
  end
