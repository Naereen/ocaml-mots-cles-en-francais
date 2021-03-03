#**************************************************************************
#*                                                                        *
#*                                 OCaml                                  *
#*                                                                        *
#*                     Mark Shinwell, Jane Street Europe                  *
#*                                                                        *
#*   Copyright 1999 Institut National de Recherche en Informatique et     *
#*     en Automatique.                                                    *
#*   Copyright 2018--2019 Jane Street Group LLC                           *
#*                                                                        *
#*   All rights reserved.  This file is distributed under the terms of    *
#*   the GNU Lesser General Public License version 2.1, with the          *
#*   special exception on linking described in the file LICENSE.          *
#*                                                                        *
#**************************************************************************

$(LOCAL_SRC)/.depend: $(COMPILERLIBS_COPIED_SOURCES) \
  $(COMPILERLIBS_COPIED_SOURCES_INTFS) $(LOCAL_SRC)/Makefile
	$(BEST_OCAMLDEP) -slash -I $(LOCAL_SRC) \
	$(COMPILERLIBS_COPIED_SOURCES) \
	$(COMPILERLIBS_COPIED_SOURCES_INTFS) \
        > $(LOCAL_SRC)/.depend

-include $(LOCAL_SRC)/.depend

$(LOCAL_SRC)/%.ml:
	cp $< $@

$(LOCAL_SRC)/%.mli:
	cp $< $@
dynlink_compilerlibs/binutils.ml: ../../utils/binutils.ml
dynlink_compilerlibs/binutils.mli: ../../utils/binutils.mli
dynlink_compilerlibs/config.ml: ../../utils/config.ml
dynlink_compilerlibs/config.mli: ../../utils/config.mli
dynlink_compilerlibs/build_path_prefix_map.ml: ../../utils/build_path_prefix_map.ml
dynlink_compilerlibs/build_path_prefix_map.mli: ../../utils/build_path_prefix_map.mli
dynlink_compilerlibs/misc.ml: ../../utils/misc.ml
dynlink_compilerlibs/misc.mli: ../../utils/misc.mli
dynlink_compilerlibs/identifiable.ml: ../../utils/identifiable.ml
dynlink_compilerlibs/identifiable.mli: ../../utils/identifiable.mli
dynlink_compilerlibs/numbers.ml: ../../utils/numbers.ml
dynlink_compilerlibs/numbers.mli: ../../utils/numbers.mli
dynlink_compilerlibs/arg_helper.ml: ../../utils/arg_helper.ml
dynlink_compilerlibs/arg_helper.mli: ../../utils/arg_helper.mli
dynlink_compilerlibs/clflags.ml: ../../utils/clflags.ml
dynlink_compilerlibs/clflags.mli: ../../utils/clflags.mli
dynlink_compilerlibs/profile.ml: ../../utils/profile.ml
dynlink_compilerlibs/profile.mli: ../../utils/profile.mli
dynlink_compilerlibs/consistbl.ml: ../../utils/consistbl.ml
dynlink_compilerlibs/consistbl.mli: ../../utils/consistbl.mli
dynlink_compilerlibs/terminfo.ml: ../../utils/terminfo.ml
dynlink_compilerlibs/terminfo.mli: ../../utils/terminfo.mli
dynlink_compilerlibs/warnings.ml: ../../utils/warnings.ml
dynlink_compilerlibs/warnings.mli: ../../utils/warnings.mli
dynlink_compilerlibs/local_store.ml: ../../utils/local_store.ml
dynlink_compilerlibs/local_store.mli: ../../utils/local_store.mli
dynlink_compilerlibs/load_path.ml: ../../utils/load_path.ml
dynlink_compilerlibs/load_path.mli: ../../utils/load_path.mli
dynlink_compilerlibs/int_replace_polymorphic_compare.ml: ../../utils/int_replace_polymorphic_compare.ml
dynlink_compilerlibs/int_replace_polymorphic_compare.mli: ../../utils/int_replace_polymorphic_compare.mli
dynlink_compilerlibs/lazy_backtrack.ml: ../../utils/lazy_backtrack.ml
dynlink_compilerlibs/lazy_backtrack.mli: ../../utils/lazy_backtrack.mli
dynlink_compilerlibs/location.ml: ../../parsing/location.ml
dynlink_compilerlibs/location.mli: ../../parsing/location.mli
dynlink_compilerlibs/longident.ml: ../../parsing/longident.ml
dynlink_compilerlibs/longident.mli: ../../parsing/longident.mli
dynlink_compilerlibs/docstrings.ml: ../../parsing/docstrings.ml
dynlink_compilerlibs/docstrings.mli: ../../parsing/docstrings.mli
dynlink_compilerlibs/syntaxerr.ml: ../../parsing/syntaxerr.ml
dynlink_compilerlibs/syntaxerr.mli: ../../parsing/syntaxerr.mli
dynlink_compilerlibs/ast_helper.ml: ../../parsing/ast_helper.ml
dynlink_compilerlibs/ast_helper.mli: ../../parsing/ast_helper.mli
dynlink_compilerlibs/ast_mapper.ml: ../../parsing/ast_mapper.ml
dynlink_compilerlibs/ast_mapper.mli: ../../parsing/ast_mapper.mli
dynlink_compilerlibs/attr_helper.ml: ../../parsing/attr_helper.ml
dynlink_compilerlibs/attr_helper.mli: ../../parsing/attr_helper.mli
dynlink_compilerlibs/builtin_attributes.ml: ../../parsing/builtin_attributes.ml
dynlink_compilerlibs/builtin_attributes.mli: ../../parsing/builtin_attributes.mli
dynlink_compilerlibs/ident.ml: ../../typing/ident.ml
dynlink_compilerlibs/ident.mli: ../../typing/ident.mli
dynlink_compilerlibs/path.ml: ../../typing/path.ml
dynlink_compilerlibs/path.mli: ../../typing/path.mli
dynlink_compilerlibs/primitive.ml: ../../typing/primitive.ml
dynlink_compilerlibs/primitive.mli: ../../typing/primitive.mli
dynlink_compilerlibs/type_immediacy.ml: ../../typing/type_immediacy.ml
dynlink_compilerlibs/type_immediacy.mli: ../../typing/type_immediacy.mli
dynlink_compilerlibs/types.ml: ../../typing/types.ml
dynlink_compilerlibs/types.mli: ../../typing/types.mli
dynlink_compilerlibs/btype.ml: ../../typing/btype.ml
dynlink_compilerlibs/btype.mli: ../../typing/btype.mli
dynlink_compilerlibs/subst.ml: ../../typing/subst.ml
dynlink_compilerlibs/subst.mli: ../../typing/subst.mli
dynlink_compilerlibs/predef.ml: ../../typing/predef.ml
dynlink_compilerlibs/predef.mli: ../../typing/predef.mli
dynlink_compilerlibs/datarepr.ml: ../../typing/datarepr.ml
dynlink_compilerlibs/datarepr.mli: ../../typing/datarepr.mli
dynlink_compilerlibs/cmi_format.ml: ../../file_formats/cmi_format.ml
dynlink_compilerlibs/cmi_format.mli: ../../file_formats/cmi_format.mli
dynlink_compilerlibs/persistent_env.ml: ../../typing/persistent_env.ml
dynlink_compilerlibs/persistent_env.mli: ../../typing/persistent_env.mli
dynlink_compilerlibs/env.ml: ../../typing/env.ml
dynlink_compilerlibs/env.mli: ../../typing/env.mli
dynlink_compilerlibs/debuginfo.ml: ../../lambda/debuginfo.ml
dynlink_compilerlibs/debuginfo.mli: ../../lambda/debuginfo.mli
dynlink_compilerlibs/lambda.ml: ../../lambda/lambda.ml
dynlink_compilerlibs/lambda.mli: ../../lambda/lambda.mli
dynlink_compilerlibs/runtimedef.ml: ../../lambda/runtimedef.ml
dynlink_compilerlibs/runtimedef.mli: ../../lambda/runtimedef.mli
dynlink_compilerlibs/instruct.ml: ../../bytecomp/instruct.ml
dynlink_compilerlibs/instruct.mli: ../../bytecomp/instruct.mli
dynlink_compilerlibs/opcodes.ml: ../../bytecomp/opcodes.ml
dynlink_compilerlibs/opcodes.mli: ../../bytecomp/opcodes.mli
dynlink_compilerlibs/bytesections.ml: ../../bytecomp/bytesections.ml
dynlink_compilerlibs/bytesections.mli: ../../bytecomp/bytesections.mli
dynlink_compilerlibs/dll.ml: ../../bytecomp/dll.ml
dynlink_compilerlibs/dll.mli: ../../bytecomp/dll.mli
dynlink_compilerlibs/meta.ml: ../../bytecomp/meta.ml
dynlink_compilerlibs/meta.mli: ../../bytecomp/meta.mli
dynlink_compilerlibs/symtable.ml: ../../bytecomp/symtable.ml
dynlink_compilerlibs/symtable.mli: ../../bytecomp/symtable.mli
dynlink_compilerlibs/asttypes.mli: ../../parsing/asttypes.mli
dynlink_compilerlibs/asttypes.ml: ../../parsing/asttypes.mli
dynlink_compilerlibs/parsetree.mli: ../../parsing/parsetree.mli
dynlink_compilerlibs/parsetree.ml: ../../parsing/parsetree.mli
dynlink_compilerlibs/outcometree.mli: ../../typing/outcometree.mli
dynlink_compilerlibs/outcometree.ml: ../../typing/outcometree.mli
dynlink_compilerlibs/cmo_format.mli: ../../file_formats/cmo_format.mli
dynlink_compilerlibs/cmo_format.ml: ../../file_formats/cmo_format.mli
dynlink_compilerlibs/cmxs_format.mli: ../../file_formats/cmxs_format.mli
dynlink_compilerlibs/cmxs_format.ml: ../../file_formats/cmxs_format.mli
