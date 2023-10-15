CM.make "../unit_test/unit_test.cm";

signature SUM_SCAN_UTIL = sig
    val test_sum_scan : (string * (int list -> int list)) -> unit
end

structure SumScanUtil :> SUM_SCAN_UTIL = struct
    open UnitTest

    fun test_sum_scan(detail : string, sum_scan_function : int list -> int list) =
        ( enter(detail)
        ; assertEquals_IntList([], sum_scan_function([]))
        ; assertEquals_IntList([0], sum_scan_function([0]))
        ; assertEquals_IntList([1], sum_scan_function([1]))
        ; assertEquals_IntList([231], sum_scan_function([231]))
        ; assertEquals_IntList([425], sum_scan_function([425]))
        ; assertEquals_IntList([0, 0], sum_scan_function([0, 0]))
        ; assertEquals_IntList([0, 1], sum_scan_function([0, 1]))
        ; assertEquals_IntList([1, 1], sum_scan_function([1, 0]))
        ; assertEquals_IntList([0, 425], sum_scan_function([0, 425]))
        ; assertEquals_IntList([425, 425], sum_scan_function([425, 0]))
        ; assertEquals_IntList([1, 11], sum_scan_function([1, 10]))
        ; assertEquals_IntList([10, 11], sum_scan_function([10, 1]))
        ; assertEquals_IntList([1, 3], sum_scan_function([1, 2]))
        ; assertEquals_IntList([2, 6], sum_scan_function([2, 4]))
        ; assertEquals_IntList([231, 656], sum_scan_function([231, 425]))
        ; assertEquals_IntList([0, 0, 0], sum_scan_function([0, 0, 0]))
        ; assertEquals_IntList([0, 0, 425], sum_scan_function([0, 0, 425]))
        ; assertEquals_IntList([0, 425, 425], sum_scan_function([0, 425, 0]))
        ; assertEquals_IntList([425, 425, 425], sum_scan_function([425, 0, 0]))
        ; assertEquals_IntList([1, 3, 6], sum_scan_function([1, 2, 3]))
        ; assertEquals_IntList([131, 362, 787], sum_scan_function([131, 231, 425]))
        ; assertEquals_IntList([1, 3, 6, 10, 15], sum_scan_function([1, 2, 3, 4, 5]))
        ; assertEquals_IntList([5, 9, 12, 14, 15], sum_scan_function([5, 4, 3, 2, 1]))
        ; assertEquals_IntList([7, 14, 21, 114, 125], sum_scan_function([7, 7, 7, 93, 11]))
        ; leave() )
end
