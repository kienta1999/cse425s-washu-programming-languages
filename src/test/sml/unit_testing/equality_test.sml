functor EqualityTestFn (EqualityWithToString : sig
	eqtype t
	val toString : t -> string
	val compare : t * t -> order
end) : sig
	eqtype t

	val toString : t -> string
	val toListString : t list -> string
	val toListListString : t list list -> string
	val toOptionString : t option -> string

	val assertListEqualsWithMessageAndStrictnessLevel : t list * t list * string * UnitTesting.list_strictness_level -> unit

    val assertEqualsWithMessage : t * t * string -> unit
    val assertEquals : t * t -> unit
    val assertListEqualsWithMessage : t list * t list * string -> unit
    val assertListEquals : t list * t list -> unit
    val assertListListEqualsWithMessage : t list list * t list list * string -> unit
    val assertListListEquals : t list list * t list list -> unit
    val assertOptionEqualsWithMessage : t option * t option * string -> unit
    val assertOptionEquals : t option * t option -> unit

    val assertListEqualsAnyOrderWithMessage : (t list * t list * string) -> unit
    val assertListEqualsAnyOrder : (t list * t list) -> unit
    val assertListEqualsSortedExpectedWithMessage : (t list * t list * string) -> unit
    val assertListEqualsSortedExpected : (t list * t list) -> unit

(*
    val assertEqualsOneOf : (''a->string) -> (''a list * ''a) -> unit
    val assertEqualsForwardOrReverse : (''a list->string) -> (''a list * ''a list) -> unit

    val assertEqualsAnyOrder_Option : (''a list option->string) -> ((''a * ''a) -> bool) -> (''a list option * ''a list option) -> unit
*)
end = struct
	open EqualityWithToString

	fun to_list_string item_to_string xs =
		let
			fun helper nil = ""
			  | helper (sting::nil) = item_to_string(sting)
			  | helper (head::neck::rest) = item_to_string(head) ^ ", " ^ helper(neck::rest)
		in
			"[" ^ helper(xs) ^ "]"
		end

	fun to_option_string item_to_string (NONE) = "NONE" 
	  | to_option_string item_to_string (SOME(v)) = "SOME(" ^ item_to_string(v) ^ ")"

	val toListString = to_list_string toString
	val toListListString = to_list_string toListString

	val toOptionString = to_option_string toString
(* 
	val toOptionListString = to_option_string toListString
	val toListOptionString = to_list_string toOptionString
 *)

	fun assert_equals to_string (expected : ''a, actual : ''a, message : string) : unit =
        if expected = actual
        then UnitTesting.success( message ^ "\n             equals: " ^ to_string(actual))
        else UnitTesting.failure( message ^ "\n!!!                    expected: " ^ to_string(expected) ^ "; actual: " ^ to_string(actual) )

   	fun assert_strictness strictness to_list_string (expected : t list, actual : t list, message : string) : unit =
		let
			fun order_to_bool(order) = 
				case order of
				  LESS => false
				| EQUAL => true
				| GREATER => true

			fun compare_order_to_bool(a, b) =
				order_to_bool(compare(a,b))

			fun to_flexible_actual_string(to_string, actual) =
				if UnitTesting.isActualToStringDesiredForFlexibleTests()
				then to_string(actual)
				else "OMITTED ACTUAL LIST"

			val expected_sorted = ListMergeSort.sort compare_order_to_bool expected
			val actual_possibly_sorted = if strictness=UnitTesting.ANY_ORDER then (ListMergeSort.sort compare_order_to_bool actual) else actual
			val text = if strictness=UnitTesting.ANY_ORDER then "any order" else "sorted"
		in
			if expected_sorted = actual_possibly_sorted
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
				UnitTesting.success( message ^ "\n             equals (" ^ text ^ "): " ^ to_flexible_actual_string(to_list_string, actual))
			(*
			)
			*)
			else UnitTesting.failure( message ^ "\n!!!                    expected (" ^ text ^ "): " ^ to_list_string(expected_sorted) ^ "; actual: " ^ to_list_string(actual_possibly_sorted) )
		end

	fun assertEqualsWithMessage(expected : t, actual : t, message : string) : unit =
		assert_equals toString (expected, actual, message)

	fun assertEquals(expected : t, actual : t) : unit =
		assertEqualsWithMessage(expected, actual, "")


	fun assertListEqualsWithMessageAndStrictnessLevel(expected : t list, actual : t list, message : string, strictness : UnitTesting.list_strictness_level) : unit =
		case(strictness) of
		  UnitTesting.EXACT_MATCH => assert_equals toListString (expected, actual, message)
		| _ => assert_strictness strictness toListString (expected, actual, message)

	fun assertListEqualsWithMessage(expected : t list, actual : t list, message : string) : unit =
		assertListEqualsWithMessageAndStrictnessLevel(expected, actual, message, UnitTesting.EXACT_MATCH)

	fun assertListEquals(expected : t list, actual : t list) : unit =
		assertListEqualsWithMessage(expected, actual, "")

	fun assertListListEqualsWithMessage(expected : t list list, actual : t list list, message : string) : unit =
		assert_equals toListListString (expected, actual, message)

	fun assertListListEquals(expected : t list list, actual : t list list) : unit =
		assertListListEqualsWithMessage(expected, actual, "")

	fun assertOptionEqualsWithMessage(expected : t option, actual : t option, message : string) : unit =
		assert_equals toOptionString (expected, actual, message)

	fun assertOptionEquals(expected : t option, actual : t option) : unit =
		assertOptionEqualsWithMessage(expected, actual, "")

	(*
	fun assertNotEquals(expected : t, actual : t, message : string) : unit =
		raise Fail "TODO"

	fun assertAll(heading : string, subs : (unit -> unit) list) : unit =
		raise Fail "TODO"
	*)

	(*
    fun assertEquals (to_string : ''a -> string) ((expected : ''a), (actual : ''a)) =
        if expected = actual
        then success( "equals: " ^ to_string(actual))
        else failure( "expected: " ^ to_string(expected) ^ "; actual: " ^ to_string(actual) )
	*)

	(*
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

*)


 	fun assertListEqualsAnyOrderWithMessage(expected : t list, actual : t list, message : string) =
		assertListEqualsWithMessageAndStrictnessLevel(expected, actual, message, UnitTesting.ANY_ORDER)

 	fun assertListEqualsAnyOrder(expected : t list, actual : t list) =
	 	assertListEqualsAnyOrderWithMessage(expected, actual, "")

 	fun assertListEqualsSortedExpectedWithMessage(expected : t list, actual : t list, message : string) =
		assertListEqualsWithMessageAndStrictnessLevel(expected, actual, message, UnitTesting.EXACT_MATCH_OF_SORTED_EXPECTED)

 	fun assertListEqualsSortedExpected(expected : t list, actual : t list) =
	 	assertListEqualsSortedExpectedWithMessage(expected, actual, "")

(*
    fun assertEqualsAnyOrder_Option (to_string : ''a list option -> string) (compare : ((''a * ''a) -> bool)) ((expected : ''a list option), (actual : ''a list option)) =
        case (expected, actual) of
                                        (NONE, NONE) => success( "equals (any order): " ^ to_string(actual))
        |                          (SOME(_), NONE) => failure( "expected (any order): " ^ to_string(expected) ^ "; actual: " ^ to_string(actual) )
        |                          (NONE, SOME(_)) => failure( "expected (any order): " ^ to_string(expected) ^ "; actual: " ^ to_string(actual) )
        | (SOME(expected_list), SOME(actual_list)) =>
            if (ListMergeSort.sort compare expected_list) = (ListMergeSort.sort compare actual_list)
            then success( "equals (any order): " ^ to_flexible_actual_string(to_string,actual))
            else failure( "expected (any order): " ^ to_string(expected) ^ "; actual: " ^ to_string(actual) )
	*)
end