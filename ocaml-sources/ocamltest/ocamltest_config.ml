(**************************************************************************)
(*                                                                        *)
(*                                 OCaml                                  *)
(*                                                                        *)
(*             Sebastien Hinderer, projet Gallium, INRIA Paris            *)
(*                                                                        *)
(*   Copyright 2016 Institut National de Recherche en Informatique et     *)
(*     en Automatique.                                                    *)
(*                                                                        *)
(*   All rights reserved.  This file is distributed under the terms of    *)
(*   the GNU Lesser General Public License version 2.1, with the          *)
(*   special exception on linking described in the file LICENSE.          *)
(*                                                                        *)
(**************************************************************************)

(* The configuration module for ocamltest *)

let arch = "amd64"

let afl_instrument = false

let asm = "as"

let cc = "colorgcc"

let cflags = "-O2 -fno-strict-aliasing -fwrapv -pthread -Wall -Wdeclaration-after-statement -Werror -fno-common -fexcess-precision=standard -fno-tree-vrp -ffunction-sections"

let ccomptype = "cc"

let shared_libraries = true

let libunix = Some true

let systhreads = true

let str = true

let objext = "o"

let asmext = "s"

let system = "linux"

let c_preprocessor = "colorgcc -E"

let ocamlsrcdir = "/home/lilian/publis/ocaml.git"

let flambda = false

let ocamlc_default_flags = ""
let ocamlopt_default_flags = ""

let safe_string = true

let flat_float_array = true

let ocamldoc = true

let ocamldebug = true

let native_compiler = true

let native_dynlink = true

let shared_library_cflags = "-fPIC"

let sharedobjext = "so"

let csc = ""

let csc_flags = ""

let exe = ""

let mkdll = "colorgcc -shared "
let mkexe = "colorgcc -O2 -fno-strict-aliasing -fwrapv -pthread -Wall -Wdeclaration-after-statement -Werror -fno-common -fexcess-precision=standard -fno-tree-vrp -ffunction-sections  -Wl,-E "

let bytecc_libs = "-lm -ldl  -lpthread"

let nativecc_libs = "-lm -ldl "

let windows_unicode = 0 != 0

let function_sections = true

let instrumented_runtime = true

let naked_pointers = true
