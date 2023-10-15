(* Dennis Cosgrove *)
CM.make "complete_unit_test_binary_search_tree.cm";
CM.make "../unit_test/unit_test.cm";
CM.make "../command_line_args/command_line_args.cm";

val _ = ( UnitTest.processCommandLineArgs()
        ; CompleteUnitTestBinarySearchTree.test_complete(CommandLineArgs.getBoolOrDefault("remove", true))
        ; OS.Process.exit(OS.Process.success)
        )