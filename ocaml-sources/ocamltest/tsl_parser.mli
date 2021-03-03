type token =
  | TSL_BEGIN_C_STYLE
  | TSL_END_C_STYLE
  | TSL_BEGIN_OCAML_STYLE
  | TSL_END_OCAML_STYLE
  | COMMA
  | TEST_DEPTH of (int)
  | EQUAL
  | PLUSEQUAL
  | INCLUDE
  | SET
  | WITH
  | IDENTIFIER of (string)
  | STRING of (string)

val tsl_block :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Tsl_ast.tsl_block
