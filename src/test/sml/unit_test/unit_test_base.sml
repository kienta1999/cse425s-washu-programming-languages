(* Dennis Cosgrove *)
structure UnitTestBase :> UNIT_TEST_BASE = struct
    exception AssertFailure of string;

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

    fun assertTrueWithMessage(message : string, actual : bool) =
        if actual
        then success(" true is  true. " ^ message)
        else failure("expected:  true; actual: false. " ^ message)

    fun assertFalseWithMessage(message : string, actual : bool) =
        if actual
        then failure("expected: false; actual:  true. " ^ message)
        else success("false is false. " ^ message)

    fun assertTrue(actual : bool) =
        assertTrueWithMessage("", actual)

    fun assertFalse(actual : bool) =
        assertFalseWithMessage("", actual)

    fun assertEquals (to_string : ''a -> string) ((expected : ''a), (actual : ''a)) =
        if expected = actual
        then success( "equals: " ^ to_string(actual))
        else failure( "expected: " ^ to_string(expected) ^ "; actual: " ^ to_string(actual) )

    fun to_flexible_actual_string(to_string, actual) =
        if isActualToStringDesiredForFlexibleTests()
        then to_string(actual)
        else "OMITTED ACTUAL LIST"

    fun assertEqualsOneOf (to_string : ''a->string) ((expecteds : ''a list), (actual : ''a)) : unit =
		let 
			fun equals_one_of(expecteds : ''a list) : bool =
			case expecteds of
				[] => false
				| expected::expecteds' => 
					if expected = actual
					then true
					else equals_one_of(expecteds')
			val list_to_string = (Repr.toString o (Repr.listToRepr (Repr.S o to_string)))
		in
			if equals_one_of(expecteds)
			then success( "equals one of: " ^ to_flexible_actual_string(to_string,actual))
			else failure( "expected one of: " ^ list_to_string(expecteds) ^ "; actual: " ^ to_string(actual) )
		end

    fun assertEqualsForwardOrReverse (to_string : ''a list -> string) ((expected : ''a list), (actual : ''a list)) =
        if (expected = actual) orelse (expected = rev(actual))
        then success( "equals (forward or reverse): " ^ to_flexible_actual_string(to_string, actual))
        else failure( "expected (forward or reverse): " ^ to_string(expected) ^ "; actual: " ^ to_string(actual) )

    fun assertEqualsAnyOrder (to_string : ''a list -> string) (compare : ((''a * ''a) -> bool)) ((expected : ''a list), (actual : ''a list)) =
        if (ListMergeSort.sort compare expected) = (ListMergeSort.sort compare actual)
        then 
        (*
        (
            print("\nactual:       " ^ to_string(actual))
            ;
            print("\nexpected:     " ^ to_string(expected))
            ;
            print("\ns_actual:     " ^ to_string((ListMergeSort.sort compare actual)))
            ;
            print("\ns_expected:   " ^ to_string((ListMergeSort.sort compare expected)))
            ;
            print("\n")
            ;
            print("\n")
            ;
        *)
            success( "equals (any order): " ^ to_flexible_actual_string(to_string, actual))
        (*
        )
        *)
        else failure( "expected (any order): " ^ to_string(expected) ^ "; actual: " ^ to_string(actual) )

    fun assertEqualsAnyOrder_Option (to_string : ''a list option -> string) (compare : ((''a * ''a) -> bool)) ((expected : ''a list option), (actual : ''a list option)) =
        case (expected, actual) of
                                        (NONE, NONE) => success( "equals (any order): " ^ to_string(actual))
        |                          (SOME(_), NONE) => failure( "expected (any order): " ^ to_string(expected) ^ "; actual: " ^ to_string(actual) )
        |                          (NONE, SOME(_)) => failure( "expected (any order): " ^ to_string(expected) ^ "; actual: " ^ to_string(actual) )
        | (SOME(expected_list), SOME(actual_list)) =>
            if (ListMergeSort.sort compare expected_list) = (ListMergeSort.sort compare actual_list)
            then success( "equals (any order): " ^ to_flexible_actual_string(to_string,actual))
            else failure( "expected (any order): " ^ to_string(expected) ^ "; actual: " ^ to_string(actual) )

    fun assertWithinDelta( expected : real, actual : real, delta : real ) = 
        if abs(expected-actual)<=delta
        then success( "within delta: " ^ Real.toString(actual))
        else failure( "expected: " ^ Real.toString(expected) ^ "; actual: " ^ Real.toString(actual))

    fun assertWithinEpsilon( expected : real, actual : real, epsilon : real ) = 
        raise Fail("TODO")
end
