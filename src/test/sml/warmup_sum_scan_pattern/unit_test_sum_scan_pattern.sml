use "../util_sum_scan/util_sum_scan.sml";
use "../../../main/sml/warmup_sum_scan_pattern/sum_scan_pattern.sml";

val _ = ( UnitTest.processCommandLineArgs()
        ; SumScanUtil.test_sum_scan("sum_scan_pattern", sum_scan_pattern)
        ; OS.Process.exit(OS.Process.success)
        )
