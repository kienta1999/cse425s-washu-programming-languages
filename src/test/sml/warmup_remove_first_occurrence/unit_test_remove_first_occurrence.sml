(* Dennis Cosgrove *)
CM.make "../unit_test/unit_test.cm";
use "../../../main/sml/warmup_remove_first_occurrence/remove_first_occurrence.sml";

open UnitTest

signature TEST_REMOVE_FIRST_OCCURRENCE = sig
    val test_remove_first_occurrence : unit -> unit
end

structure TestRemoveFirstOccurrence :> TEST_REMOVE_FIRST_OCCURRENCE = struct
    open UnitTest

    fun test_remove_first_occurrence() =
        ( enter("remove_first_occurrence")
            ; assertEquals_IntList([], remove_first_occurrence([], 425))
            ; assertEquals_IntList([], remove_first_occurrence([425], 425))
            ; assertEquals_IntList([425], remove_first_occurrence([425], 231))
            ; assertEquals_IntList([425], remove_first_occurrence([231,425], 231))
            ; assertEquals_IntList([231], remove_first_occurrence([231,425], 425))
            ; assertEquals_IntList([231,425], remove_first_occurrence([231,425], 131))
            ; assertEquals_IntList([2,3,4,5], remove_first_occurrence([1,2,3,4,5], 1))
            ; assertEquals_IntList([1,3,4,5], remove_first_occurrence([1,2,3,4,5], 2))
            ; assertEquals_IntList([1,2,4,5], remove_first_occurrence([1,2,3,4,5], 3))
            ; assertEquals_IntList([1,2,3,5], remove_first_occurrence([1,2,3,4,5], 4))
            ; assertEquals_IntList([1,2,3,4], remove_first_occurrence([1,2,3,4,5], 5))
            ; assertEquals_IntList([1,2,3,4,5], remove_first_occurrence([1,2,3,4,5], 6))
            ; assertEquals_StringList([], remove_first_occurrence([], "fred"))
            ; assertEquals_StringList([], remove_first_occurrence([], "george"))
            ; assertEquals_StringList([], remove_first_occurrence(["fred"], "fred"))
            ; assertEquals_StringList([], remove_first_occurrence(["george"], "george"))
            ; assertEquals_StringList(["fred"], remove_first_occurrence(["fred"], "george"))
            ; assertEquals_StringList(["george"], remove_first_occurrence(["george"], "fred"))
            ; assertEquals_StringList(["george"], remove_first_occurrence(["fred", "george"], "fred"))
            ; assertEquals_StringList(["fred"], remove_first_occurrence(["fred", "george"], "george"))
            ; assertEquals_StringList(["george", "ron"], remove_first_occurrence(["fred", "george", "ron"], "fred"))
            ; assertEquals_StringList(["fred", "ron"], remove_first_occurrence(["fred", "george", "ron"], "george"))
            ; assertEquals_StringList(["fred", "george"], remove_first_occurrence(["fred", "george"], "ron"))
            ; assertEquals_StringList(["fred", "george", "ron"], remove_first_occurrence(["fred", "george", "ron"], "percy"))
        ; leave() )
end

val _ = ( UnitTest.processCommandLineArgs()
        ; TestRemoveFirstOccurrence.test_remove_first_occurrence()
        ; OS.Process.exit(OS.Process.success)
        )
