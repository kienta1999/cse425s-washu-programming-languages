use "../util_sum_scan/util_sum_scan.sml";
use "../../../main/sml/warmup_sum_scan/sum_scan.sml";

val _ = ( UnitTest.processCommandLineArgs()
        ; SumScanUtil.test_sum_scan("sum_scan", sum_scan)
        ; OS.Process.exit(OS.Process.success)
        )
