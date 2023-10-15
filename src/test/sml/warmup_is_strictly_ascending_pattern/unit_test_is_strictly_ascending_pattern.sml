(* Dennis Cosgrove *)
CM.make "../unit_test/unit_test.cm";
CM.make "../command_line_args/command_line_args.cm";
CM.make "../util_is_strictly_ascending/util_is_strictly_ascending.cm";
use "../../../main/sml/warmup_is_strictly_ascending_pattern/is_strictly_ascending_pattern.sml";

val _ = ( UnitTest.processCommandLineArgs()
        ; IsStrictlyAscendingUtil.test_is_strictly_ascending("is_strictly_ascending_pattern", is_strictly_ascending_pattern)
        ; OS.Process.exit(OS.Process.success)
        )