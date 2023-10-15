(* Dennis Cosgrove *)
structure UnitTest :> UNIT_TEST = struct 
    exception AssertFailure of string;

    val success = UnitTestBase.success
    val failure = UnitTestBase.failure

    val getOutFilePath = UnitTestBase.getOutFilePath
    val setOutFilePath = UnitTestBase.setOutFilePath
    val isRaiseOnFailure = UnitTestBase.isRaiseOnFailure
    val setRaiseOnFailure = UnitTestBase.setRaiseOnFailure
    val isActualToStringDesiredForFlexibleTests = UnitTestBase.isActualToStringDesiredForFlexibleTests
    val setActualToStringDesiredForFlexibleTests = UnitTestBase.setActualToStringDesiredForFlexibleTests

    val processCommandLineArgs = UnitTestBase.processCommandLineArgs

    val enter = UnitTestBase.enter
    val leave = UnitTestBase.leave

(*
    NOTE: e must be in scope to be caught
    fun assertRaisesExceptionInScope (e_string:string) (e:exn) (thunk:unit->'a) : unit = 
        ( thunk()
        ; failure("should raise " ^ e_string) )
        handle Empty => success("raises " ^ e_string)  
*)

    fun assertRaises_Empty(thunk) = 
        ( thunk()
        ; failure("should raise Empty"))
        handle Empty => success("raises Empty") 

    fun assertRaises_Subscript(thunk) = 
        ( thunk()
        ; failure("should raise Subscript"))
        handle Subscript => success("raises Subscript") 

    val assertTrue = UnitTestBase.assertTrue
    val assertFalse = UnitTestBase.assertFalse
    val assertTrueWithMessage = UnitTestBase.assertTrueWithMessage
    val assertFalseWithMessage = UnitTestBase.assertFalseWithMessage
    val assertEquals = UnitTestBase.assertEquals
    val assertWithinDelta = UnitTestBase.assertWithinDelta
    val assertWithinEpsilon = UnitTestBase.assertWithinEpsilon
    val assertEqualsOneOf = UnitTestBase.assertEqualsOneOf
    val assertEqualsForwardOrReverse = UnitTestBase.assertEqualsForwardOrReverse
    val assertEqualsAnyOrder = UnitTestBase.assertEqualsAnyOrder
    val assertEqualsAnyOrder_Option = UnitTestBase.assertEqualsAnyOrder_Option

    val assertEquals_Int = assertEquals Int.toString
    val assertEquals_IntList = assertEquals (Repr.toString o Repr.listToRepr Repr.I)
    val assertEquals_IntOption = assertEquals (Repr.toString o Repr.optToRepr Repr.I)
    val assertEquals_IntListOption = assertEquals (Repr.toString o Repr.optToRepr (Repr.listToRepr Repr.I))

    val assertEquals_IntInt = assertEquals (Repr.toString o Repr.t2ToRepr Repr.I Repr.I)
    val assertEquals_IntIntList = assertEquals (Repr.toString o Repr.listToRepr (Repr.t2ToRepr Repr.I Repr.I))
    val assertEquals_IntIntOption = assertEquals (Repr.toString o Repr.optToRepr (Repr.t2ToRepr Repr.I Repr.I))
    val assertEquals_IntIntListOption = assertEquals (Repr.toString o Repr.optToRepr (Repr.listToRepr (Repr.t2ToRepr Repr.I Repr.I)))

    val assertEquals_IntIntInt = assertEquals (Repr.toString o Repr.t3ToRepr Repr.I Repr.I Repr.I)
    val assertEquals_IntIntIntList = assertEquals (Repr.toString o Repr.listToRepr (Repr.t3ToRepr Repr.I Repr.I Repr.I))
    val assertEquals_IntIntIntOption = assertEquals (Repr.toString o Repr.optToRepr (Repr.t3ToRepr Repr.I Repr.I Repr.I))
    val assertEquals_IntIntIntListOption = assertEquals (Repr.toString o Repr.optToRepr (Repr.listToRepr (Repr.t3ToRepr Repr.I Repr.I Repr.I)))

    val assertEquals_IntListIntList = assertEquals (Repr.toString o (Repr.t2ToRepr (Repr.listToRepr Repr.I) (Repr.listToRepr Repr.I)))

    val assertEqualsAnyOrder_IntListOption = assertEqualsAnyOrder_Option (Repr.toString o Repr.optToRepr (Repr.listToRepr Repr.I)) (fn(a,b)=> a<b)

    fun identity(v : 'a) = v

    val assertEquals_String = assertEquals identity
    val assertEquals_StringList = assertEquals (Repr.toString o Repr.listToRepr Repr.S)
    val assertEquals_StringOption = assertEquals(Repr.toString o Repr.optToRepr Repr.S)
    val assertEquals_StringListOption = assertEquals (Repr.toString o Repr.optToRepr (Repr.listToRepr Repr.S))

    val assertEqualsForwardOrReverse_IntList = assertEqualsForwardOrReverse (Repr.toString o Repr.listToRepr Repr.I)
    val assertEqualsAnyOrder_IntList = assertEqualsAnyOrder (Repr.toString o Repr.listToRepr Repr.I) (fn(a,b)=>a<b)

    val assertEqualsForwardOrReverse_StringList = assertEqualsForwardOrReverse (Repr.toString o Repr.listToRepr Repr.S)
    val assertEqualsAnyOrder_StringList = assertEqualsAnyOrder (Repr.toString o Repr.listToRepr Repr.S) (fn(a,b)=> a<b)

    val assertEqualsAnyOrder_StringListOption = assertEqualsAnyOrder_Option (Repr.toString o Repr.optToRepr (Repr.listToRepr Repr.S)) (fn(a,b)=> a<b)
end
