CM.make "chained_testing.cm";
CM.make "../../unit_testing/unit_testing.cm";
CM.make "../../command_line_args/command_line_args.cm";

val _ = ( UnitTesting.processCommandLineArgs()
		; ChainedTesting.test_chained()
        ; OS.Process.exit(OS.Process.success)
        )
