(**
 * A small OCaml (https://OCaml.org) program, written with keywords in English,
 * It does a lot of basic OCaml stuff, and run some tests on them.
 *
 * See <https://github.com/Naereen/ocaml-mots-cles-en-francais/>
 *
 * Copyright Lilian Besson, 2021, released under the MIT License
 * See <https://lbesson.mit-license.org/>
*)

let print = Format.printf;;

print "Test almost all other English keywords...\n%!";;

let x:int = try begin 2021/0 end with _ -> 42;;
assert (x = 42);;

let y = 40
and z = 2
in begin
  let answertolife = y + z in
  assert (answertolife = 42)
end;;

assert true;;
assert (not false);;
assert (true || false);;
assert (true && (not false));;

open List;;
assert ((length [1;2;3]) = 3);;

print "Done for the tests in English!\n%!";;