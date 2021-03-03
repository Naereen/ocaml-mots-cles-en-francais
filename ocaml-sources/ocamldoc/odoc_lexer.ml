# 1 "odoc_lexer.mll"
 
(**************************************************************************)
(*                                                                        *)
(*                                 OCaml                                  *)
(*                                                                        *)
(*             Maxence Guesdon, projet Cristal, INRIA Rocquencourt        *)
(*                                                                        *)
(*   Copyright 2001 Institut National de Recherche en Informatique et     *)
(*     en Automatique.                                                    *)
(*                                                                        *)
(*   All rights reserved.  This file is distributed under the terms of    *)
(*   the GNU Lesser General Public License version 2.1, with the          *)
(*   special exception on linking described in the file LICENSE.          *)
(*                                                                        *)
(**************************************************************************)

(** The lexer for special comments. *)

open Lexing
open Odoc_parser

let line_number = ref 0


let string_buffer = Buffer.create 32

(** Reset the buffer *)
let reset_string_buffer () = Buffer.reset string_buffer

(** Add a character to the buffer *)
let add_char_string = Buffer.add_char string_buffer

(** Add a string to the buffer. *)
let add_string = Buffer.add_string string_buffer

let read_string () = Buffer.contents string_buffer

(** The variable which will contain the description string.
   Is initialized when we encounter the start of a special comment. *)
let description = ref ""

let blank = "[ \013\009\012]"

(** The nested comments level. *)
let comments_level = ref 0

(** This function returns the given string without the leading and trailing blanks.*)
let remove_blanks s =
  let l = Str.split_delim (Str.regexp "\n") s in
  let l2 =
    let rec iter liste =
      match liste with
        h :: q ->
          let h2 = Str.global_replace (Str.regexp ("^"^blank^"+")) "" h in
          if h2 = "" then
            (
             (* we remove this line and must remove leading blanks of the next one *)
             iter q
            )
          else
            (* we don't remove leading blanks in the remaining lines *)
            h2 :: q
      | _ ->
          []
    in iter l
  in
  let l3 =
    let rec iter liste =
      match liste with
        h :: q ->
          let h2 = Str.global_replace (Str.regexp (blank^"+$")) "" h in
          if h2 = "" then
            (
             (* we remove this line and must remove trailing blanks of the next one *)
             iter q
            )
          else
            (* we don't remove trailing blanks in the remaining lines *)
            h2 :: q
      | _ ->
          []
    in
    List.rev (iter (List.rev l2))
  in
  String.concat "\n" l3

(** Remove first blank characters of each line of a string, until the first '*' *)
let remove_stars s =
  Str.global_replace (Str.regexp ("^"^blank^"*\\*")) "" s

# 93 "odoc_lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\246\255\000\000\249\255\001\000\254\255\002\000\002\000\
    \004\000\006\000\253\255\252\255\008\000\248\255\011\000\251\255\
    \009\000\000\000\010\000\013\000\255\255\254\255\253\255\045\000\
    \036\000\253\255\013\000\015\000\255\255\254\255\036\001\250\255\
    \009\000\010\000\109\000\109\000\101\001\097\001\050\000\247\255\
    \016\000\249\255\016\000\254\255\007\000\019\000\024\000\252\255\
    \026\000\248\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\009\000\255\255\009\000\255\255\000\000\008\000\
    \005\000\004\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \004\000\004\000\004\000\004\000\255\255\255\255\255\255\003\000\
    \255\255\255\255\002\000\002\000\255\255\255\255\255\255\255\255\
    \004\000\004\000\002\000\001\000\000\000\003\000\255\255\255\255\
    \008\000\255\255\008\000\255\255\000\000\005\000\004\000\255\255\
    \002\000\255\255";
  Lexing.lex_default =
   "\001\000\000\000\255\255\000\000\255\255\000\000\255\255\255\255\
    \255\255\255\255\000\000\000\000\255\255\000\000\015\000\000\000\
    \255\255\255\255\255\255\255\255\000\000\000\000\000\000\255\255\
    \025\000\000\000\255\255\255\255\000\000\000\000\032\000\000\000\
    \032\000\032\000\255\255\032\000\032\000\255\255\039\000\000\000\
    \255\255\000\000\255\255\000\000\255\255\255\255\255\255\000\000\
    \255\255\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\006\000\005\000\006\000\006\000\006\000\006\000\006\000\
    \044\000\000\000\000\000\044\000\044\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \006\000\000\000\006\000\000\000\000\000\000\000\000\000\044\000\
    \004\000\013\000\002\000\007\000\008\000\010\000\009\000\011\000\
    \012\000\011\000\012\000\018\000\021\000\019\000\020\000\029\000\
    \028\000\049\000\045\000\044\000\043\000\046\000\044\000\044\000\
    \022\000\047\000\048\000\047\000\048\000\000\000\000\000\000\000\
    \000\000\255\255\000\000\016\000\026\000\000\000\027\000\000\000\
    \000\000\000\000\044\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\042\000\000\000\040\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\033\000\033\000\017\000\
    \023\000\000\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\023\000\000\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \000\000\000\000\000\000\000\000\000\000\255\255\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\033\000\000\000\000\000\037\000\000\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \003\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\255\255\255\255\255\255\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\255\255\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\036\000\035\000\000\000\
    \036\000\036\000\041\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\036\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\034\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\255\255\036\000\000\000\
    \000\000\036\000\036\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \033\000\000\000\000\000\000\000\000\000\036\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\255\255\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \037\000\033\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\031\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \000\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\000\000\000\000\000\000\000\000\255\255";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\006\000\000\000\000\000\006\000\006\000\
    \044\000\255\255\255\255\044\000\044\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\006\000\255\255\255\255\255\255\255\255\044\000\
    \000\000\002\000\000\000\004\000\007\000\008\000\008\000\009\000\
    \009\000\012\000\012\000\014\000\018\000\014\000\019\000\026\000\
    \027\000\040\000\042\000\038\000\038\000\045\000\038\000\038\000\
    \017\000\046\000\046\000\048\000\048\000\255\255\255\255\255\255\
    \255\255\032\000\255\255\014\000\024\000\255\255\024\000\255\255\
    \255\255\255\255\038\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\038\000\255\255\038\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\032\000\033\000\014\000\
    \016\000\255\255\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\023\000\255\255\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \255\255\255\255\255\255\255\255\255\255\035\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\035\000\255\255\255\255\034\000\255\255\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \000\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\032\000\033\000\014\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\024\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\030\000\030\000\255\255\
    \030\000\030\000\038\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\030\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\030\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\034\000\034\000\035\000\036\000\255\255\
    \255\255\036\000\036\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \030\000\255\255\255\255\255\255\255\255\036\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\036\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \037\000\036\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\030\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \255\255\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
    \037\000\255\255\255\255\255\255\255\255\036\000";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec main lexbuf =
   __ocaml_lex_main_rec lexbuf 0
and __ocaml_lex_main_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 99 "odoc_lexer.mll"
      (
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length (Lexing.lexeme lexbuf));
        main lexbuf
      )
# 299 "odoc_lexer.ml"

  | 1 ->
# 105 "odoc_lexer.mll"
      (
        incr line_number;
        incr Odoc_comments_global.nb_chars;
        main lexbuf
      )
# 308 "odoc_lexer.ml"

  | 2 ->
# 111 "odoc_lexer.mll"
      (
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length (Lexing.lexeme lexbuf));
        Description ("", None)
      )
# 316 "odoc_lexer.ml"

  | 3 ->
# 117 "odoc_lexer.mll"
      (
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length (Lexing.lexeme lexbuf));
        main lexbuf
      )
# 324 "odoc_lexer.ml"

  | 4 ->
# 123 "odoc_lexer.mll"
      (
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length (Lexing.lexeme lexbuf));
        incr comments_level;
        main lexbuf
      )
# 333 "odoc_lexer.ml"

  | 5 ->
# 130 "odoc_lexer.mll"
      (
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length (Lexing.lexeme lexbuf));
        incr comments_level;
        if !comments_level = 1 then
          (
           reset_string_buffer ();
           description := "";
           special_comment lexbuf
          )
        else
          main lexbuf
      )
# 349 "odoc_lexer.ml"

  | 6 ->
# 144 "odoc_lexer.mll"
      ( EOF )
# 354 "odoc_lexer.ml"

  | 7 ->
# 147 "odoc_lexer.mll"
      (
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length (Lexing.lexeme lexbuf));
        decr comments_level ;
        main lexbuf
      )
# 363 "odoc_lexer.ml"

  | 8 ->
# 154 "odoc_lexer.mll"
      (
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length (Lexing.lexeme lexbuf));
        incr comments_level ;
        main lexbuf
      )
# 372 "odoc_lexer.ml"

  | 9 ->
# 161 "odoc_lexer.mll"
      (
        incr Odoc_comments_global.nb_chars;
        main lexbuf
      )
# 380 "odoc_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_main_rec lexbuf __ocaml_lex_state

and special_comment lexbuf =
   __ocaml_lex_special_comment_rec lexbuf 14
and __ocaml_lex_special_comment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 168 "odoc_lexer.mll"
      (
        let s = Lexing.lexeme lexbuf in
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length s);
        if !comments_level = 1 then
          (
           (* there is just a description *)
           let s2 = read_string () in
           let s3 = remove_blanks s2 in
           let s4 =
             if !Odoc_global.remove_stars then
               remove_stars s3
             else
               s3
           in
           Description (s4, None)
          )
        else
          (
           add_string s;
           decr comments_level;
           special_comment lexbuf
          )
      )
# 414 "odoc_lexer.ml"

  | 1 ->
# 193 "odoc_lexer.mll"
      (
        let s = Lexing.lexeme lexbuf in
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length s);
        incr comments_level ;
        add_string s;
        special_comment lexbuf
      )
# 425 "odoc_lexer.ml"

  | 2 ->
# 202 "odoc_lexer.mll"
      (
        let s = Lexing.lexeme lexbuf in
        let c = (Lexing.lexeme_char lexbuf 1) in
        add_char_string c;
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length s);
        special_comment lexbuf
      )
# 436 "odoc_lexer.ml"

  | 3 ->
# 211 "odoc_lexer.mll"
      (
        (* we keep the description before we go further *)
        let s = read_string () in
        description := remove_blanks s;
        reset_string_buffer ();
        let len = String.length (Lexing.lexeme lexbuf) in
        lexbuf.Lexing.lex_curr_pos <- lexbuf.Lexing.lex_curr_pos - len;
        lexbuf.Lexing.lex_curr_p <-
          { lexbuf.Lexing.lex_curr_p with
            pos_cnum = lexbuf.Lexing.lex_curr_p.pos_cnum - len
          } ;
        (* we don't increment the Odoc_comments_global.nb_chars *)
        special_comment_part2 lexbuf
      )
# 454 "odoc_lexer.ml"

  | 4 ->
# 227 "odoc_lexer.mll"
      (
        let c = (Lexing.lexeme_char lexbuf 0) in
        add_char_string c;
        if c = '\010' then incr line_number;
        incr Odoc_comments_global.nb_chars;
        special_comment lexbuf
      )
# 465 "odoc_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_special_comment_rec lexbuf __ocaml_lex_state

and special_comment_part2 lexbuf =
   __ocaml_lex_special_comment_part2_rec lexbuf 24
and __ocaml_lex_special_comment_part2_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 237 "odoc_lexer.mll"
      (
        let s = Lexing.lexeme lexbuf in
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length s);
        if !comments_level = 1 then
          (* finally we return the description we kept *)
          let desc =
            if !Odoc_global.remove_stars then
              remove_stars !description
             else
              !description
          in
          let remain = read_string () in
          let remain2 =
            if !Odoc_global.remove_stars then
              remove_stars remain
             else
               remain
          in
          Description (desc, Some remain2)
        else
          (
           add_string s ;
           decr comments_level ;
           special_comment_part2 lexbuf
          )
      )
# 502 "odoc_lexer.ml"

  | 1 ->
# 265 "odoc_lexer.mll"
      (
        let s = Lexing.lexeme lexbuf in
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length s);
        add_string s;
        incr comments_level ;
        special_comment_part2 lexbuf
      )
# 513 "odoc_lexer.ml"

  | 2 ->
# 274 "odoc_lexer.mll"
      (
        let c = (Lexing.lexeme_char lexbuf 0) in
        add_char_string c;
        if c = '\010' then incr line_number;
        incr Odoc_comments_global.nb_chars;
        special_comment_part2 lexbuf
      )
# 524 "odoc_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_special_comment_part2_rec lexbuf __ocaml_lex_state

and elements lexbuf =
   __ocaml_lex_elements_rec lexbuf 30
and __ocaml_lex_elements_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 284 "odoc_lexer.mll"
      (
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length (Lexing.lexeme lexbuf));
        elements lexbuf
      )
# 539 "odoc_lexer.ml"

  | 1 ->
# 290 "odoc_lexer.mll"
      ( incr line_number;
        incr Odoc_comments_global.nb_chars;
        elements lexbuf )
# 546 "odoc_lexer.ml"

  | 2 ->
# 294 "odoc_lexer.mll"
      (
        raise (Failure (Odoc_messages.should_escape_at_sign))
      )
# 553 "odoc_lexer.ml"

  | 3 ->
# 299 "odoc_lexer.mll"
      (
        let s = Lexing.lexeme lexbuf in
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length s);
        let s2 = String.sub s 1 ((String.length s) - 1) in
        match s2 with
          "param" ->
            T_PARAM
         | "author" ->
            T_AUTHOR
         | "version" ->
             T_VERSION
         | "see" ->
             T_SEE
         | "since" ->
             T_SINCE
         | "before" ->
             T_BEFORE
         | "deprecated" ->
             T_DEPRECATED
         | "raise" ->
             T_RAISES
         | "return" ->
             T_RETURN
         | s ->
             if !Odoc_global.no_custom_tags then
               raise (Failure (Odoc_messages.not_a_valid_tag s))
             else
               T_CUSTOM s
      )
# 586 "odoc_lexer.ml"

  | 4 ->
# 330 "odoc_lexer.mll"
      (
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length (Lexing.lexeme lexbuf));
        let s = Lexing.lexeme lexbuf in
        let s = Str.global_replace (Str.regexp_string "\\@") "@" s in
        let s = remove_blanks s in
        Desc s
      )
# 597 "odoc_lexer.ml"

  | 5 ->
# 338 "odoc_lexer.mll"
      (
        EOF
      )
# 604 "odoc_lexer.ml"

  | 6 ->
# 341 "odoc_lexer.mll"
      (
        let s = Lexing.lexeme lexbuf in
        failwith ("Unexpected character '"^s^"'")
      )
# 612 "odoc_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_elements_rec lexbuf __ocaml_lex_state

and simple lexbuf =
   __ocaml_lex_simple_rec lexbuf 38
and __ocaml_lex_simple_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 349 "odoc_lexer.mll"
      (
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length (Lexing.lexeme lexbuf));
        simple lexbuf
      )
# 627 "odoc_lexer.ml"

  | 1 ->
# 355 "odoc_lexer.mll"
      ( incr line_number;
        incr Odoc_comments_global.nb_chars;
        simple lexbuf
      )
# 635 "odoc_lexer.ml"

  | 2 ->
# 361 "odoc_lexer.mll"
      (
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length (Lexing.lexeme lexbuf));
        incr comments_level;
        simple lexbuf
      )
# 644 "odoc_lexer.ml"

  | 3 ->
# 368 "odoc_lexer.mll"
      (
        let s = Lexing.lexeme lexbuf in
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length s);
        simple lexbuf
      )
# 653 "odoc_lexer.ml"

  | 4 ->
# 374 "odoc_lexer.mll"
      (
        let s = Lexing.lexeme lexbuf in
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length s);
        incr comments_level;
        simple lexbuf
      )
# 663 "odoc_lexer.ml"

  | 5 ->
# 382 "odoc_lexer.mll"
      (
        let s = Lexing.lexeme lexbuf in
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length s);
        incr comments_level;
        if !comments_level = 1 then
          (
           reset_string_buffer ();
           description := "";
           special_comment lexbuf
          )
        else
          (
           add_string s;
           simple lexbuf
          )
      )
# 683 "odoc_lexer.ml"

  | 6 ->
# 400 "odoc_lexer.mll"
      ( EOF )
# 688 "odoc_lexer.ml"

  | 7 ->
# 403 "odoc_lexer.mll"
      (
        let s = Lexing.lexeme lexbuf in
        Odoc_comments_global.nb_chars := !Odoc_comments_global.nb_chars + (String.length s);
        decr comments_level ;
        simple lexbuf
      )
# 698 "odoc_lexer.ml"

  | 8 ->
# 411 "odoc_lexer.mll"
      (
        incr Odoc_comments_global.nb_chars;
        simple lexbuf
      )
# 706 "odoc_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_simple_rec lexbuf __ocaml_lex_state

;;

