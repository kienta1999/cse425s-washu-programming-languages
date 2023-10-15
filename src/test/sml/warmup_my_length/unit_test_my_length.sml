(* Dennis Cosgrove *)
CM.make "../unit_test/unit_test.cm";
use "../../../main/sml/warmup_my_length/my_length.sml";

signature TEST_MY_LIST = sig
    val test_my_length : unit -> unit
end

structure TestMyList :> TEST_MY_LIST = struct
    open UnitTest
    fun test_my_length() =
        ( enter("my_length")
            ; assertEquals_Int(0, my_length([]))
            ; assertEquals_Int(1, my_length([425]))
            ; assertEquals_Int(2, my_length([425, 231]))
            ; assertEquals_Int(2, my_length(["PL", "Parallel"]))
            ; assertEquals_Int(4, my_length(["A", "B", "C", "D"]))
        ; leave() )
end

val _ = ( UnitTest.processCommandLineArgs()
        ; TestMyList.test_my_length()
        ; OS.Process.exit(OS.Process.success)
        )
