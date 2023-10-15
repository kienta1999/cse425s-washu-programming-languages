structure BoolTest : sig
    val assertWithMessage : bool * bool * string -> unit
    val assertTrueWithMessage : bool * string -> unit
    val assertFalseWithMessage : bool * string -> unit

    val assert : bool * bool -> unit
    val assertTrue : bool -> unit
    val assertFalse : bool -> unit
end = struct
    fun assertWithMessage(expected : bool, actual : bool, message : string) =
        if expected = actual
        then UnitTesting.success(message ^ "\n             " ^ Bool.toString(expected) ^ " is " ^ Bool.toString(actual))
        else UnitTesting.failure(message ^ "\n!!!                    " ^ "expected: " ^ Bool.toString(expected) ^ " is NOT actual: " ^ Bool.toString(actual))

    fun assertTrueWithMessage(actual : bool, message : string) =
		assertWithMessage(true, actual, message)

    fun assertFalseWithMessage(actual : bool, message : string) =
		assertWithMessage(false, actual, message)

    fun assert(expected : bool, actual : bool) =
        assertWithMessage(expected, actual, "")

    fun assertTrue(actual : bool) =
        assertTrueWithMessage(actual, "")

    fun assertFalse(actual : bool) =
        assertFalseWithMessage(actual, "")
end