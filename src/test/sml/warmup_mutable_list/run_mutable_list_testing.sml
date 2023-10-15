(* Dennis Cosgrove *)
use "test_mutable_list.sml";

val _ = 
    ( UnitTesting.processCommandLineArgs()
    ; TestMutableList.test_complete()
    ; OS.Process.exit(OS.Process.success)
    )
