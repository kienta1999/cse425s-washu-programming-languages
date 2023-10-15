(* Dennis Cosgrove *)

CM.make "sorted_testing.cm";
CM.make "../../unit_testing/unit_testing.cm";
CM.make "../../command_line_args/command_line_args.cm";
CM.make "../../binary_search_tree/complete_unit_test_binary_search_tree.cm";

val _ = ( UnitTesting.processCommandLineArgs()
		; CompleteUnitTestBinarySearchTree.test_complete(CommandLineArgs.getBoolOrDefault("remove", true))
        ; SortedTesting.test_sorted()
        ; OS.Process.exit(OS.Process.success) )
