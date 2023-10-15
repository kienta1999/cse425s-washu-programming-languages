CM.make "../../../core/sml/repr/repr.cm";
CM.make "../unit_test/unit_test.cm";
use "../../../main/sml/uw3/uw3.sml";

signature TEST_UW3 = sig
    val test_complete : unit -> unit
end

structure TestUW3 :> TEST_UW3 = struct
    open UnitTest

	val assertEqualsOneOf_IntListOption = assertEqualsOneOf (Repr.toString o (Repr.optToRepr (Repr.listToRepr Repr.I)))

	fun valu_to_string(v : valu) =
		case v of
		  Const(n) => "Const(" ^ Int.toString(n) ^ ")"
		| Unit => "Unit"
	    | Tuple(list) => "Tuple(" ^ 
			let
				val value_list_to_string = (Repr.toString o (Repr.listToRepr valu_to_repr)) 
			in
				value_list_to_string(list)
			end 
		^ ")"
	    | Constructor(s,u) => "Constructor(\"" ^ s ^ "," ^ valu_to_string(v) ^ "\")"

	and valu_to_repr(v : valu) =
		Repr.S(valu_to_string(v))
	
	val assertEquals_StringValuListOption = assertEquals (Repr.toString o (Repr.optToRepr (Repr.listToRepr (Repr.t2ToRepr Repr.S valu_to_repr))))

	fun typ_to_string(t : typ) : string =
		case t of
		  Anything => "Anything"
		| UnitT => "UnitT"
		| IntT => "IntT"
	    | TupleT(list) => "TupleT(" ^ 
			let
				val typ_list_to_string = (Repr.toString o (Repr.listToRepr typ_to_repr)) 
			in
				typ_list_to_string(list)
			end 
		^ ")"
	    | Datatype(s) => "Datatype(\"" ^ s ^ "\")"

	and typ_to_repr(t : typ) =
		Repr.S(typ_to_string(t))
	
	val assertEquals_TypOption = assertEquals (Repr.toString o (Repr.optToRepr typ_to_repr))

	fun test_only_capitals() = 
		( enter("only_capitals")
			; assertEquals_StringList(["A","B","C"], only_capitals ["A","B","C"])
			
		; leave() )

	fun test_longest_string1() = 
		( enter("longest_string1")
			; assertEquals_String("bc", longest_string1 ["A","bc","C"])
			
		; leave() )

	fun test_longest_string2() = 
		( enter("longest_string2")
			; assertEquals_String("bc", longest_string2 ["A","bc","C"])
			
		; leave() )

	fun test_longest_string3() = 
		( enter("longest_string3")
			; assertEquals_String("bc", longest_string3 ["A","bc","C"])
			
		; leave() )

	fun test_longest_string4() = 
		( enter("longest_string4")
			; assertEquals_String("C", longest_string4 ["A","B","C"])
			
		; leave() )

	fun test_longest_capitalized() = 
		( enter("longest_capitalized")
			; assertEquals_String("A", longest_capitalized ["A","bc","C"])
			
		; leave() )

	fun test_rev_string() = 
		( enter("rev_string")
			; assertEquals_String("cba", rev_string "abc")
			
		; leave() )

	fun test_first_answer() = 
		( enter("first_answer")
			; assertEquals_Int(4, first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5])
			
		; leave() )

	val all_answers_ascending = [2,20,3,30,4,40,5,50,6,60,7,70]
	val all_answers_descending = [7,70,6,60,5,50,4,40,3,30,2,20]

	fun test_all_answers() = 
		( enter("all_answers")
			; assertEqualsAnyOrder_IntListOption(NONE, all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7])
			
		; leave() )

	fun test_count_wildcards() = 
		( enter("count_wildcards")
			; assertEquals_Int(1, count_wildcards Wildcard)
			
		; leave() )

	fun test_count_wild_and_variable_lengths() = 
		( enter("count_wild_and_variable_lengths")
			; assertEquals_Int(1, count_wild_and_variable_lengths (Variable("a")))
			
		; leave() )

	fun test_count_some_var() = 
		( enter("count_some_var")
			; assertEquals_Int(1, count_some_var ("x", Variable("x")))
			
		; leave() )

	fun test_check_pat() = 
		( enter("check_pat")
			; assertTrue(check_pat (Variable("x")))
			
		; leave() )

	fun test_match() = 
		( enter("match")
			; assertEquals_StringValuListOption(NONE, match (Const(1), UnitP))
			
		; leave() )

	fun test_first_match() = 
		( enter("first_match")
			; assertEquals_StringValuListOption(SOME [], first_match Unit [UnitP])
			
		; leave() )

	fun test_typecheck_patterns() = 
		( enter("typecheck_patterns")
			; assertEquals_TypOption(
				SOME(TupleT[Anything,Anything]), 
				typecheck_patterns([],[TupleP[Variable("x"),Variable("y")], TupleP[Wildcard,Wildcard]]))
			; assertEquals_TypOption(
				SOME(TupleT[Anything,TupleT[Anything,Anything]]), 
				typecheck_patterns([],[TupleP[Wildcard,Wildcard], TupleP[Wildcard,TupleP[Wildcard,Wildcard]]]))
			
		; leave() )
	

	fun test_complete() = 
		( test_only_capitals() 
		; test_longest_string1() 
		; test_longest_string2() 
		; test_longest_string3() 
		; test_longest_string4() 
		; test_longest_capitalized() 
		; test_rev_string() 
		; test_first_answer() 
		; test_all_answers() 
		; test_count_wildcards() 
		; test_count_wild_and_variable_lengths() 
		; test_count_some_var() 
		; test_check_pat() 
		; test_match() 
		; test_first_match()
		; test_typecheck_patterns() )
	
end

val _ = ( UnitTest.processCommandLineArgs()
        ; TestUW3.test_complete()
        ; OS.Process.exit(OS.Process.success)
        )
