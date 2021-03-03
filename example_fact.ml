(**
 * A small OCaml (https://OCaml.org) program, written with keywords in English,
 * It defines a recursive factorial function, and run some test on it.
 *
 * See <https://github.com/Naereen/ocaml-mots-cles-en-francais/>
 *
 * Copyright Lilian Besson, 2021, released under the MIT License
 * See <https://lbesson.mit-license.org/>
*)

let rec fact (n : int) =
  match n with
  | n when n < 0 -> failwith "Error: n has to be >= 0 for fact."
  | 0 -> 1
  | 1 | 2 -> if n=1 then 1 else 2
  | n -> n * (fact (n-1))
;;

let print = Format.printf;;

print "Test with fact written with the keywords in English! (default mode)\n%!";;
assert (1 = (fact 1));;
assert (2 = (fact 2));;
assert (6 = (fact 3));;
for n = 6 to 10 do
  print "fact(%i) = %i\n%!" n (fact n);
done;;
for n = 13 downto 11 do
  print "fact(%i) = %i\n%!" n (fact n);
done;;

let n = ref 3 in
while !n < 6 do
  print "fact(%i) = %i\n%!" !n (fact !n);
  incr n;
done;;