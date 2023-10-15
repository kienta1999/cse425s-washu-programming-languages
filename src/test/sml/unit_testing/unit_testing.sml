structure UnitTesting : sig
    exception AssertFailure of string;

	datatype list_strictness_level = EXACT_MATCH | EXACT_MATCH_OF_SORTED_EXPECTED | ANY_ORDER

    val getOutFilePath : unit -> string option
    val setOutFilePath : string option -> unit

    val isRaiseOnFailure : unit -> bool
    val setRaiseOnFailure : bool -> unit

    val isActualToStringDesiredForFlexibleTests : unit -> bool
    val setActualToStringDesiredForFlexibleTests : bool -> unit

    val processCommandLineArgs : unit -> unit

    val enter : string -> unit
    val leave : unit -> unit

    (* TODO: remove??? *)
    val success : string -> unit
    val failure : string -> unit
end = struct
    exception AssertFailure of string;

	datatype list_strictness_level = EXACT_MATCH | EXACT_MATCH_OF_SORTED_EXPECTED | ANY_ORDER

    val out_file_path_ref : string option ref = ref(NONE)
    val is_raise_on_failure_ref : bool ref = ref(true)
    val is_actual_to_string_desired_for_flexible_tests_ref : bool ref = ref(true)

    fun getOutFilePath() =
        !out_file_path_ref
    fun setOutFilePath(out_file_path : string option) : unit =
        ( out_file_path_ref := out_file_path
        ; case out_file_path of
                  NONE => ()
          | SOME(path) => OS.FileSys.remove(path) handle OS.SysErr(s) => ()
    )

    fun isRaiseOnFailure() =
        !is_raise_on_failure_ref
    fun setRaiseOnFailure(is_raise_on_failure: bool) :  unit = 
        is_raise_on_failure_ref := is_raise_on_failure

    fun isActualToStringDesiredForFlexibleTests() =
        !is_actual_to_string_desired_for_flexible_tests_ref
    fun setActualToStringDesiredForFlexibleTests(is_actual_to_string_desired_for_flexible_tests: bool) :  unit = 
        is_actual_to_string_desired_for_flexible_tests_ref := is_actual_to_string_desired_for_flexible_tests

    fun processCommandLineArgs() =
        ( setRaiseOnFailure(CommandLineArgs.getBoolOrDefault("raiseOnFailure", true))
        ; setOutFilePath(CommandLineArgs.getStringOption("outFilePath"))
        ; setActualToStringDesiredForFlexibleTests(CommandLineArgs.getBoolOrDefault("isActualToStringDesiredForFlexibleTests", true))
        )

    fun output(s:string) : unit =
        case getOutFilePath() of
                NONE => print(s)
        | SOME(path) =>
            let 
                val ostream = TextIO.openAppend path
                val _ = TextIO.output (ostream, s) handle e => (TextIO.closeOut ostream; raise e)
                val _ = TextIO.closeOut ostream
            in 
                ()
            end



    fun success(detail : string) : unit =
        output( "    success. " ^ detail ^ "\n" )

    fun failure(detail : string) : unit = 
        (
        output( "--------\n!!!\n!!!\n!!! ASSERTION FAILURE: " ^ detail ^ "\n!!!\n!!!\n--------\n" ) 
        ; 
        if isRaiseOnFailure()
        then raise AssertFailure( detail )
        else ()
        )


    fun enter( detail : string ) : unit =
        output( "testing " ^ detail ^ " {\n" )

    fun leave() : unit =
        output( "}\n" )
end