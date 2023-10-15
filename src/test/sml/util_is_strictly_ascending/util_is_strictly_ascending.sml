(* Dennis Cosgrove *)
structure IsStrictlyAscendingUtil :> IS_STRICTLY_ASCENDING_UTIL = struct
    open UnitTest

    fun test_is_strictly_ascending(detail : string, is_strictly_ascending_function : int list -> bool) =
        let
            val int_list_to_string = Repr.toString o Repr.listToRepr Repr.I
            fun to_message(xs : int list) : string =
                "    " ^ detail ^ "(" ^ int_list_to_string(xs) ^ ")"
            fun assert_true(xs : int list) : unit =
                assertTrueWithMessage(to_message(xs), is_strictly_ascending_function(xs))
            fun assert_false(xs : int list) : unit =
                assertFalseWithMessage(to_message(xs), is_strictly_ascending_function(xs))
        in
            ( enter(detail)
            ; assert_true([])
            ; assert_true([231])
            ; assert_true([425])
            ; assert_true([1, 2])
            ; assert_false([1, 1])
            ; assert_false([2, 1])
            ; assert_true([231, 425])
            ; assert_false([425, 231])
            ; assert_true([1, 2, 3])
            ; assert_false([1, 1, 3])
            ; assert_false([1, 2, 2])
            ; assert_false([1, 1, 1])
            ; assert_false([2, 1, 3])
            ; assert_false([1, 3, 2])
            ; assert_false([2, 2, 1])
            ; assert_false([2, 1, 1])
            ; assert_false([425, 425, 425, 425])
            ; assert_false([231, 425, 425, 425])
            ; assert_false([231, 231, 425, 425])
            ; assert_false([231, 231, 231, 425])
            ; assert_false([425, 231, 425, 425])
            ; assert_false([425, 425, 231, 425])
            ; assert_false([425, 425, 425, 231])
            ; assert_true([1, 2, 3, 4, 5])
            ; assert_false([5, 4, 3, 2, 1])
            ; assert_false([1, 2, 3, 4, 5, 4, 3, 2, 1])
            ; leave() )
        end
end
