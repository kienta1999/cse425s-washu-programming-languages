(* Dennis Cosgrove *)
signature UNIT_TEST_BASE = sig
    exception AssertFailure of string;

    val getOutFilePath : unit -> string option
    val setOutFilePath : string option -> unit

    val isRaiseOnFailure : unit -> bool
    val setRaiseOnFailure : bool -> unit

    val isActualToStringDesiredForFlexibleTests : unit -> bool
    val setActualToStringDesiredForFlexibleTests : bool -> unit

    val processCommandLineArgs : unit -> unit

    val enter : string -> unit
    val leave : unit -> unit

    val assertTrue : bool -> unit
    val assertFalse : bool -> unit

    val assertTrueWithMessage : string * bool -> unit
    val assertFalseWithMessage : string * bool -> unit

    val assertEquals : (''a->string) -> (''a * ''a) -> unit
    val assertWithinDelta : real * real * real -> unit
    val assertWithinEpsilon : real * real * real -> unit

    val assertEqualsOneOf : (''a->string) -> (''a list * ''a) -> unit
    val assertEqualsForwardOrReverse : (''a list->string) -> (''a list * ''a list) -> unit
    val assertEqualsAnyOrder : (''a list->string) -> ((''a * ''a) -> bool) -> (''a list * ''a list) -> unit

    val assertEqualsAnyOrder_Option : (''a list option->string) -> ((''a * ''a) -> bool) -> (''a list option * ''a list option) -> unit

    (* TODO: remove??? *)
    val success : string -> unit
    val failure : string -> unit
end
