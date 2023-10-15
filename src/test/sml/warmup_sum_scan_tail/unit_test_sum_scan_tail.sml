use "../util_sum_scan/util_sum_scan.sml";
use "../../../main/sml/warmup_sum_scan_tail/sum_scan_tail.sml";

val _ = ( UnitTest.processCommandLineArgs()
        ; SumScanUtil.test_sum_scan("sum_scan_tail", sum_scan_tail)
        ; OS.Process.exit(OS.Process.success)
        )
