CM.make "../unit_test/unit_test.cm";
use "../../../main/sml/uw0/uw0.sml";

signature TEST_UW0 = sig
    val test_complete : unit -> unit
end

structure TestUW0 :> TEST_UW0 = struct
    open UnitTest
    fun test_double() =
        ( enter("double")
            ; assertEquals_Int(34, double 17)
            ; assertEquals_Int(0, double 0)
        ; leave() )

    fun test_triple() =
        ( enter("triple")
            ; assertEquals_Int(~12, triple ~4)
            ; assertEquals_Int(0, triple 0)
            (* You can add more tests here, for example you can uncomment the line below *)
            (* by deleting the first two character and last two characters on the line *)
            (* ; assertEquals_Int(~3, triple ~1) *)
        ; leave() )

    fun test_f() =
        ( enter("f")
            ; assertEquals_Int(324, f(12,27))
        ; leave() )


    fun test_complete() =
        ( test_double()
        ; test_triple()
        ; test_f() )
end

val _ = ( UnitTest.processCommandLineArgs()
        ; TestUW0.test_complete()
        ; OS.Process.exit(OS.Process.success)
        )
