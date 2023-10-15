CM.make "../unit_testing/unit_testing.cm";
CM.make "../command_line_args/command_line_args.cm";
CM.make "spreadsheet_test.cm";
CM.make "../dictionary/chained/single/single_chained_dictionary_testing.cm";
CM.make "../dictionary/chained/chained_testing.cm";

(* Dennis Cosgrove *)
val is_to_dictionaries_desired = CommandLineArgs.getBoolOrDefault("to_dictionaries", true)

val _ = ( UnitTesting.processCommandLineArgs()
        ; TestSpreadsheet.test_all_but_to_dictionaries()
        ; if is_to_dictionaries_desired
          then ( ChainedTesting.test_single_chain_if_desired()
               ; TestSpreadsheet.test_to_dictionaries() )
          else ()
        ; OS.Process.exit(OS.Process.success)
        )
