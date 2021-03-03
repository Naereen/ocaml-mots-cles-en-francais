type token =
  | ARGUMENT of (string)
  | LIDENT of (string)
  | UIDENT of (string)
  | OPERATOR of (string)
  | INTEGER of (int64)
  | STAR
  | MINUS
  | DOT
  | COLON
  | HASH
  | AT
  | DOLLAR
  | BANG
  | LPAREN
  | RPAREN
  | LBRACKET
  | RBRACKET
  | EOL

open Parsing;;
let _ = parse_error;;
# 18 "debugger_parser.mly"

open Int64ops
open Input_handling
open Longident
open Parser_aux
open Debugcom

# 32 "debugger_parser.ml"
let yytransl_const = [|
  262 (* STAR *);
  263 (* MINUS *);
  264 (* DOT *);
  265 (* COLON *);
  266 (* HASH *);
  267 (* AT *);
  268 (* DOLLAR *);
  269 (* BANG *);
  270 (* LPAREN *);
  271 (* RPAREN *);
  272 (* LBRACKET *);
  273 (* RBRACKET *);
  274 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* ARGUMENT *);
  258 (* LIDENT *);
  259 (* UIDENT *);
  260 (* OPERATOR *);
  261 (* INTEGER *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\003\000\003\000\004\000\005\000\006\000\
\007\000\007\000\022\000\022\000\008\000\008\000\009\000\009\000\
\023\000\023\000\023\000\023\000\023\000\024\000\024\000\019\000\
\020\000\020\000\020\000\020\000\021\000\010\000\010\000\011\000\
\012\000\012\000\013\000\013\000\014\000\025\000\025\000\025\000\
\025\000\025\000\025\000\025\000\025\000\025\000\015\000\015\000\
\016\000\016\000\016\000\016\000\016\000\016\000\017\000\017\000\
\018\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000"

let yylen = "\002\000\
\002\000\001\000\002\000\002\000\001\000\002\000\002\000\001\000\
\002\000\001\000\002\000\001\000\002\000\001\000\002\000\001\000\
\001\000\003\000\001\000\003\000\005\000\001\000\003\000\002\000\
\001\000\001\000\003\000\000\000\002\000\001\000\001\000\002\000\
\001\000\001\000\001\000\000\000\002\000\001\000\001\000\002\000\
\003\000\005\000\005\000\003\000\002\000\003\000\002\000\001\000\
\001\000\001\000\003\000\002\000\004\000\004\000\003\000\001\000\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\057\000\
\058\000\002\000\000\000\059\000\000\000\060\000\005\000\000\000\
\061\000\000\000\062\000\008\000\063\000\000\000\064\000\010\000\
\000\000\014\000\065\000\000\000\000\000\066\000\012\000\016\000\
\030\000\031\000\067\000\000\000\068\000\033\000\069\000\034\000\
\035\000\070\000\000\000\071\000\017\000\022\000\019\000\039\000\
\000\000\000\000\000\000\072\000\048\000\038\000\000\000\000\000\
\000\000\000\000\050\000\073\000\049\000\000\000\026\000\000\000\
\074\000\000\000\056\000\000\000\075\000\076\000\000\000\077\000\
\000\000\078\000\001\000\003\000\004\000\006\000\007\000\009\000\
\013\000\011\000\015\000\032\000\037\000\040\000\045\000\000\000\
\000\000\000\000\047\000\000\000\000\000\052\000\000\000\029\000\
\000\000\024\000\046\000\018\000\023\000\020\000\000\000\044\000\
\041\000\000\000\000\000\051\000\000\000\000\000\055\000\000\000\
\000\000\000\000\000\000\053\000\054\000\021\000\043\000\042\000"

let yydgoto = "\022\000\
\025\000\028\000\030\000\033\000\035\000\037\000\039\000\043\000\
\046\000\057\000\053\000\055\000\058\000\060\000\068\000\076\000\
\081\000\040\000\086\000\082\000\083\000\048\000\070\000\071\000\
\072\000"

let yysindex = "\117\000\
\004\255\016\255\011\255\029\255\044\255\052\255\051\255\020\255\
\054\255\102\255\102\255\006\255\102\255\102\255\137\255\040\255\
\142\255\048\255\107\255\142\255\142\255\000\000\004\255\000\000\
\000\000\000\000\048\255\000\000\011\255\000\000\000\000\048\255\
\000\000\048\255\000\000\000\000\000\000\048\255\000\000\000\000\
\029\255\000\000\000\000\048\255\044\255\000\000\000\000\000\000\
\000\000\000\000\000\000\048\255\000\000\000\000\000\000\000\000\
\000\000\000\000\048\255\000\000\000\000\000\000\000\000\000\000\
\069\255\150\255\150\255\000\000\000\000\000\000\072\255\094\255\
\022\255\142\255\000\000\000\000\000\000\015\255\000\000\000\000\
\000\000\055\255\000\000\079\255\000\000\000\000\048\255\000\000\
\048\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\071\255\
\080\255\034\255\000\000\029\255\058\255\000\000\051\255\000\000\
\074\255\000\000\000\000\000\000\000\000\000\000\085\255\000\000\
\000\000\086\255\096\255\000\000\051\255\029\255\000\000\000\000\
\084\255\127\255\129\255\000\000\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\147\000\130\255\000\000\000\000\
\060\255\000\000\000\000\157\000\140\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\083\255\000\000\000\000\000\000\000\000\000\000\001\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\136\000\000\000\131\000\243\255\116\000\083\000\248\255\000\000\
\000\000\104\000\000\000\000\000\152\000\000\000\095\000\000\000\
\000\000\003\000\000\000\249\255\148\000\000\000\149\000\246\255\
\004\000"

let yytablesize = 276
let yytable = "\042\000\
\025\000\027\000\075\000\026\000\023\000\031\000\084\000\049\000\
\050\000\084\000\084\000\047\000\088\000\089\000\056\000\029\000\
\027\000\069\000\077\000\078\000\085\000\024\000\106\000\024\000\
\038\000\026\000\041\000\097\000\024\000\092\000\108\000\031\000\
\024\000\032\000\094\000\120\000\095\000\024\000\121\000\024\000\
\096\000\061\000\062\000\063\000\073\000\064\000\098\000\122\000\
\034\000\123\000\074\000\065\000\066\000\067\000\100\000\038\000\
\036\000\024\000\044\000\036\000\045\000\101\000\125\000\084\000\
\028\000\024\000\109\000\126\000\024\000\103\000\104\000\024\000\
\024\000\102\000\069\000\094\000\128\000\028\000\106\000\105\000\
\110\000\116\000\117\000\118\000\112\000\115\000\113\000\028\000\
\129\000\114\000\130\000\112\000\028\000\119\000\124\000\061\000\
\062\000\063\000\134\000\064\000\131\000\106\000\127\000\049\000\
\050\000\065\000\066\000\067\000\061\000\062\000\063\000\024\000\
\133\000\051\000\052\000\054\000\132\000\001\000\002\000\003\000\
\004\000\005\000\006\000\007\000\008\000\009\000\010\000\011\000\
\012\000\013\000\014\000\015\000\016\000\017\000\018\000\019\000\
\020\000\021\000\061\000\062\000\063\000\135\000\064\000\079\000\
\080\000\136\000\036\000\036\000\065\000\066\000\067\000\061\000\
\062\000\063\000\024\000\064\000\028\000\028\000\091\000\093\000\
\099\000\065\000\066\000\067\000\111\000\059\000\107\000\087\000\
\090\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\025\000\027\000\000\000\
\022\000\023\000\025\000\027\000\000\000\000\000\000\000\000\000\
\000\000\000\000\025\000\027\000"

let yycheck = "\008\000\
\000\000\000\000\016\000\001\000\001\001\003\000\017\000\002\001\
\003\001\020\000\021\000\009\000\020\000\021\000\012\000\005\001\
\001\001\015\000\016\000\016\000\018\000\018\001\008\001\018\001\
\005\001\023\000\007\001\041\000\018\001\027\000\009\001\029\000\
\018\001\005\001\032\000\002\001\034\000\018\001\005\001\018\001\
\038\000\002\001\003\001\004\001\005\001\006\001\044\000\014\001\
\005\001\016\001\011\001\012\001\013\001\014\001\052\000\005\001\
\005\001\018\001\005\001\005\001\007\001\059\000\005\001\074\000\
\005\001\018\001\074\000\010\001\018\001\066\000\067\000\018\001\
\018\001\005\001\072\000\073\000\003\001\018\001\008\001\008\001\
\078\000\002\001\003\001\004\001\082\000\015\001\008\001\005\001\
\004\001\087\000\005\001\089\000\010\001\014\001\108\000\002\001\
\003\001\004\001\015\001\006\001\005\001\008\001\111\000\002\001\
\003\001\012\001\013\001\014\001\002\001\003\001\004\001\018\001\
\126\000\010\000\011\000\012\000\125\000\001\000\002\000\003\000\
\004\000\005\000\006\000\007\000\008\000\009\000\010\000\011\000\
\012\000\013\000\014\000\015\000\016\000\017\000\018\000\019\000\
\020\000\021\000\002\001\003\001\004\001\015\001\006\001\002\001\
\003\001\017\001\000\000\018\001\012\001\013\001\014\001\002\001\
\003\001\004\001\018\001\006\001\000\000\018\001\023\000\029\000\
\045\000\012\001\013\001\014\001\082\000\014\000\072\000\019\000\
\021\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\005\001\005\001\255\255\
\008\001\008\001\010\001\010\001\255\255\255\255\255\255\255\255\
\255\255\255\255\018\001\018\001"

let yynames_const = "\
  STAR\000\
  MINUS\000\
  DOT\000\
  COLON\000\
  HASH\000\
  AT\000\
  DOLLAR\000\
  BANG\000\
  LPAREN\000\
  RPAREN\000\
  LBRACKET\000\
  RBRACKET\000\
  EOL\000\
  "

let yynames_block = "\
  ARGUMENT\000\
  LIDENT\000\
  UIDENT\000\
  OPERATOR\000\
  INTEGER\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string list) in
    Obj.repr(
# 118 "debugger_parser.mly"
      ( _1::_2 )
# 257 "debugger_parser.ml"
               : string list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 120 "debugger_parser.mly"
      ( [] )
# 264 "debugger_parser.ml"
               : string list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 124 "debugger_parser.mly"
      ( _1 )
# 272 "debugger_parser.ml"
               : string))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : int64) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int list) in
    Obj.repr(
# 130 "debugger_parser.mly"
      ( (to_int _1) :: _2 )
# 280 "debugger_parser.ml"
               : int list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 132 "debugger_parser.mly"
      ( [] )
# 287 "debugger_parser.ml"
               : int list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : int64) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 136 "debugger_parser.mly"
      ( to_int _1 )
# 295 "debugger_parser.ml"
               : int))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : int64) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 140 "debugger_parser.mly"
      ( _1 )
# 303 "debugger_parser.ml"
               : int64))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int64) in
    Obj.repr(
# 144 "debugger_parser.mly"
      ( to_int _1 )
# 310 "debugger_parser.ml"
               : int))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : int64) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 148 "debugger_parser.mly"
      ( Some (to_int _1) )
# 318 "debugger_parser.ml"
               : int option))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 150 "debugger_parser.mly"
      ( None )
# 325 "debugger_parser.ml"
               : int option))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : int64) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 154 "debugger_parser.mly"
      ( Some _1 )
# 333 "debugger_parser.ml"
               : 'opt_int64_eol))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 156 "debugger_parser.mly"
      ( None )
# 340 "debugger_parser.ml"
               : 'opt_int64_eol))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 160 "debugger_parser.mly"
      ( Some (- _2) )
# 347 "debugger_parser.ml"
               : int option))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int option) in
    Obj.repr(
# 162 "debugger_parser.mly"
      ( _1 )
# 354 "debugger_parser.ml"
               : int option))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int64) in
    Obj.repr(
# 166 "debugger_parser.mly"
      ( Some (Int64.neg _2) )
# 361 "debugger_parser.ml"
               : int64 option))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'opt_int64_eol) in
    Obj.repr(
# 168 "debugger_parser.mly"
      ( _1 )
# 368 "debugger_parser.ml"
               : int64 option))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 173 "debugger_parser.mly"
                                ( Lident _1 )
# 375 "debugger_parser.ml"
               : 'longident))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'module_path) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 174 "debugger_parser.mly"
                                ( Ldot(_1, _3) )
# 383 "debugger_parser.ml"
               : 'longident))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 175 "debugger_parser.mly"
                                ( Lident _1 )
# 390 "debugger_parser.ml"
               : 'longident))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'module_path) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 176 "debugger_parser.mly"
                                ( Ldot(_1, _3) )
# 398 "debugger_parser.ml"
               : 'longident))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'module_path) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 177 "debugger_parser.mly"
                                           ( Ldot(_1, _4) )
# 406 "debugger_parser.ml"
               : 'longident))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 181 "debugger_parser.mly"
                                ( Lident _1 )
# 413 "debugger_parser.ml"
               : 'module_path))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'module_path) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 182 "debugger_parser.mly"
                                ( Ldot(_1, _3) )
# 421 "debugger_parser.ml"
               : 'module_path))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'longident) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 186 "debugger_parser.mly"
                                ( _1 )
# 429 "debugger_parser.ml"
               : Longident.t))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 189 "debugger_parser.mly"
                                ( Some (Lident _1) )
# 436 "debugger_parser.ml"
               : Longident.t option))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 190 "debugger_parser.mly"
                                ( Some (Lident _1) )
# 443 "debugger_parser.ml"
               : Longident.t option))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'module_path) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 191 "debugger_parser.mly"
                                ( Some (Ldot(_1, _3)) )
# 451 "debugger_parser.ml"
               : Longident.t option))
; (fun __caml_parser_env ->
    Obj.repr(
# 192 "debugger_parser.mly"
                                ( None )
# 457 "debugger_parser.ml"
               : Longident.t option))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Longident.t option) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 195 "debugger_parser.mly"
                                ( _1 )
# 465 "debugger_parser.ml"
               : Longident.t option))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 198 "debugger_parser.mly"
                                ( _1 )
# 472 "debugger_parser.ml"
               : string))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 199 "debugger_parser.mly"
                                ( _1 )
# 479 "debugger_parser.ml"
               : string))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 202 "debugger_parser.mly"
                                ( _1 )
# 487 "debugger_parser.ml"
               : string))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 205 "debugger_parser.mly"
                                ( Some _1 )
# 494 "debugger_parser.ml"
               : string option))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 206 "debugger_parser.mly"
                                ( None )
# 501 "debugger_parser.ml"
               : string option))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 209 "debugger_parser.mly"
                                ( Some _1 )
# 508 "debugger_parser.ml"
               : string option))
; (fun __caml_parser_env ->
    Obj.repr(
# 210 "debugger_parser.mly"
                                ( None )
# 514 "debugger_parser.ml"
               : string option))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string option) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 213 "debugger_parser.mly"
                                ( _1 )
# 522 "debugger_parser.ml"
               : string option))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'longident) in
    Obj.repr(
# 218 "debugger_parser.mly"
                                               ( E_ident _1 )
# 529 "debugger_parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    Obj.repr(
# 219 "debugger_parser.mly"
                                                ( E_result )
# 535 "debugger_parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int64) in
    Obj.repr(
# 220 "debugger_parser.mly"
                                                ( E_name (to_int _2) )
# 542 "debugger_parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int64) in
    Obj.repr(
# 221 "debugger_parser.mly"
                                                ( E_item(_1, (to_int _3)) )
# 550 "debugger_parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'expression) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : int64) in
    Obj.repr(
# 222 "debugger_parser.mly"
                                                ( E_item(_1, (to_int _4)) )
# 558 "debugger_parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'expression) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : int64) in
    Obj.repr(
# 223 "debugger_parser.mly"
                                                ( E_item(_1, (to_int _4)) )
# 566 "debugger_parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 224 "debugger_parser.mly"
                                                ( E_field(_1, _3) )
# 574 "debugger_parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 225 "debugger_parser.mly"
                                                ( E_field(_2, "contents") )
# 581 "debugger_parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 226 "debugger_parser.mly"
                                                ( _2 )
# 588 "debugger_parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Parser_aux.expression list) in
    Obj.repr(
# 232 "debugger_parser.mly"
                                                ( _1::_2 )
# 596 "debugger_parser.ml"
               : Parser_aux.expression list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 233 "debugger_parser.mly"
                                                ( [] )
# 603 "debugger_parser.ml"
               : Parser_aux.expression list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 239 "debugger_parser.mly"
                                                ( BA_none )
# 610 "debugger_parser.ml"
               : Parser_aux.break_arg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 240 "debugger_parser.mly"
                                                ( BA_pc {frag = 0; pos = _1} )
# 617 "debugger_parser.ml"
               : Parser_aux.break_arg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : int64) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 241 "debugger_parser.mly"
                                                ( BA_pc {frag = to_int _1;
                                                         pos = _3} )
# 626 "debugger_parser.ml"
               : Parser_aux.break_arg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 243 "debugger_parser.mly"
                                                ( BA_function _1 )
# 634 "debugger_parser.ml"
               : Parser_aux.break_arg))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Longident.t option) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : int64) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : int option) in
    Obj.repr(
# 244 "debugger_parser.mly"
                                                ( BA_pos1 (_2, (to_int _3), _4))
# 643 "debugger_parser.ml"
               : Parser_aux.break_arg))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Longident.t option) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 245 "debugger_parser.mly"
                                                ( BA_pos2 (_2, _4) )
# 651 "debugger_parser.ml"
               : Parser_aux.break_arg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Longident.t option) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : int) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int option) in
    Obj.repr(
# 252 "debugger_parser.mly"
      ( (_1, Some _2, _3) )
# 660 "debugger_parser.ml"
               : Longident.t option * int option * int option))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Longident.t option) in
    Obj.repr(
# 254 "debugger_parser.mly"
      ( (_1, None, None) )
# 667 "debugger_parser.ml"
               : Longident.t option * int option * int option))
; (fun __caml_parser_env ->
    Obj.repr(
# 259 "debugger_parser.mly"
        ( stop_user_input () )
# 673 "debugger_parser.ml"
               : unit))
(* Entry argument_list_eol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry argument_eol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry integer_list_eol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry integer_eol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry int64_eol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry integer *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry opt_integer_eol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry opt_signed_integer_eol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry opt_signed_int64_eol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry identifier *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry identifier_eol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry identifier_or_eol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry opt_identifier *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry opt_identifier_eol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry expression_list_eol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry break_argument_eol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry list_arguments_eol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry end_of_line *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry longident_eol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry opt_longident *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry opt_longident_eol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let argument_list_eol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : string list)
let argument_eol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 2 lexfun lexbuf : string)
let integer_list_eol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 3 lexfun lexbuf : int list)
let integer_eol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 4 lexfun lexbuf : int)
let int64_eol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 5 lexfun lexbuf : int64)
let integer (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 6 lexfun lexbuf : int)
let opt_integer_eol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 7 lexfun lexbuf : int option)
let opt_signed_integer_eol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 8 lexfun lexbuf : int option)
let opt_signed_int64_eol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 9 lexfun lexbuf : int64 option)
let identifier (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 10 lexfun lexbuf : string)
let identifier_eol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 11 lexfun lexbuf : string)
let identifier_or_eol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 12 lexfun lexbuf : string option)
let opt_identifier (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 13 lexfun lexbuf : string option)
let opt_identifier_eol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 14 lexfun lexbuf : string option)
let expression_list_eol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 15 lexfun lexbuf : Parser_aux.expression list)
let break_argument_eol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 16 lexfun lexbuf : Parser_aux.break_arg)
let list_arguments_eol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 17 lexfun lexbuf : Longident.t option * int option * int option)
let end_of_line (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 18 lexfun lexbuf : unit)
let longident_eol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 19 lexfun lexbuf : Longident.t)
let opt_longident (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 20 lexfun lexbuf : Longident.t option)
let opt_longident_eol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 21 lexfun lexbuf : Longident.t option)
