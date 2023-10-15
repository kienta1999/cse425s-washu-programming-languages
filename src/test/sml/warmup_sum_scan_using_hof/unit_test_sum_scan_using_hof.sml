use "../util_sum_scan/util_sum_scan.sml";
use "../../../main/sml/warmup_sum_scan_using_hof/sum_scan_using_hof.sml";

val _ = ( UnitTest.processCommandLineArgs()
        ; SumScanUtil.test_sum_scan("sum_scan_using_hof", sum_scan_using_hof)
        ; OS.Process.exit(OS.Process.success)
        )
