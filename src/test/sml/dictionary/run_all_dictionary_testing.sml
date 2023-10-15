(* Dennis Cosgrove *)

CM.make "chained/chained_testing.cm";
CM.make "sorted/sorted_testing.cm";
CM.make "../unit_testing/unit_testing.cm";

val _ = ( UnitTesting.processCommandLineArgs()
		; ChainedTesting.test_chained()
        ; SortedTesting.test_sorted()
        ; OS.Process.exit(OS.Process.success) )
