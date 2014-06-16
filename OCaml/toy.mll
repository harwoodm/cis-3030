
{
 (* This is used to remove quotation marks from string literals. *)
 let string_chars s =
   String.sub s 1 ((String.length s) - 2);;
}

let op_ar   = ['-' '+' '*' '%' '/']
let op_bool = ['!' '&' '|']
let op_rel  = ['=' '<' '>']

rule lexer = parse
    [' ']          { lexer lexbuf }
  | op_ar          { Lexing.lexeme lexbuf }
  | op_bool        { Lexing.lexeme lexbuf }
  | op_rel         { Lexing.lexeme lexbuf }
  | "<="           { Lexing.lexeme lexbuf }
  | ">="           { Lexing.lexeme lexbuf }
  | "<>"           { Lexing.lexeme lexbuf }
  | "let"          { Lexing.lexeme lexbuf }
  | "in"           { Lexing.lexeme lexbuf }
  | "if"           { Lexing.lexeme lexbuf }
  | "then"         { Lexing.lexeme lexbuf }
  | '-'?['0'-'9']+ { Lexing.lexeme lexbuf }
  | ['A'-'z']+     { Lexing.lexeme lexbuf }
  | '"'[^ '"']*'"' { string_chars (Lexing.lexeme lexbuf) }
  | eof            { "EOF" }

(* For now, let's just put the main program here. *)
{
 let input_data = "let x = 4 * 3 in x - 1" in
 let work_buffer = Lexing.from_string input_data in
 let rec output_tokens buffer =
   let token = lexer buffer in
     if token = "EOF" then print_string "DONE!\n"
     else (print_string token; output_tokens buffer) in
output_tokens work_buffer   
}
