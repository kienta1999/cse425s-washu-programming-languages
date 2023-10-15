use "../util_sum_scan/util_sum_scan.sml";
use "../../../main/sml/warmup_sum_distances_to_origin/sum_distances_to_origin.sml";

signature TEST_SUM_DISTANCES_TO_ORIGIN = sig
    val test_sum_distances_to_origin : unit -> unit
end

structure TestSumDistancesToOrigin :> TEST_SUM_DISTANCES_TO_ORIGIN = struct
    open UnitTest
    val reasonable_delta = 0.000001
    fun test_sum_distances_to_origin() =
        ( enter("sum_distances_to_origin")
            ; assertWithinDelta(0.0, sum_distances_to_origin([]), 0.0)
            ; assertWithinDelta(0.0, sum_distances_to_origin([(0.0, 0.0)]), reasonable_delta)
            ; assertWithinDelta(1.0, sum_distances_to_origin([(1.0, 0.0)]), reasonable_delta)
            ; assertWithinDelta(1.0, sum_distances_to_origin([(0.0, 1.0)]), reasonable_delta)
            ; assertWithinDelta(5.0, sum_distances_to_origin([(3.0, 4.0)]), reasonable_delta)
            ; assertWithinDelta(10.0, sum_distances_to_origin([(6.0, 8.0)]), reasonable_delta)
            ; assertWithinDelta(0.0, sum_distances_to_origin([(0.0, 0.0), (0.0, 0.0)]), reasonable_delta)
            ; assertWithinDelta(1.0, sum_distances_to_origin([(0.0, 0.0), (1.0, 0.0)]), reasonable_delta)
            ; assertWithinDelta(2.0, sum_distances_to_origin([(1.0, 0.0), (1.0, 0.0)]), reasonable_delta)
            ; assertWithinDelta(2.0, sum_distances_to_origin([(1.0, 0.0), (0.0, 1.0)]), reasonable_delta)
            ; assertWithinDelta(17.0, sum_distances_to_origin([(1.0, 0.0), (0.0, 1.0), (3.0, 4.0), (6.0, 8.0)]), reasonable_delta)
        ; leave() )
end

val _ = ( UnitTest.processCommandLineArgs()
        ; TestSumDistancesToOrigin.test_sum_distances_to_origin()
        ; OS.Process.exit(OS.Process.success)
        )
