structure RealTest : sig
    val assertWithinDelta : real * real * real -> unit
    val assertWithinEpsilon : real * real * real -> unit
end = struct
    fun assertWithinDelta( expected : real, actual : real, delta : real ) = 
        if abs(expected-actual)<=delta
        then UnitTesting.success( "within delta: " ^ Real.toString(actual))
        else UnitTesting.failure( "expected: " ^ Real.toString(expected) ^ "; actual: " ^ Real.toString(actual))

    fun assertWithinEpsilon( expected : real, actual : real, epsilon : real ) = 
        raise Fail("TODO")
end