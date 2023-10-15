CM.make "../../../core/sml/repr/repr.cm";
use "../util_sum_scan/util_sum_scan.sml";
use "../../../main/sml/warmup_scan/scan.sml";

signature TEST_SCAN = sig
	val test_product_scan : unit -> unit
	val test_set_intersection_scan : unit -> unit
	val test_set_union_scan : unit -> unit
end

structure TestScan :> TEST_SCAN = struct
	open UnitTest

	fun test_product_scan() =
		( enter("scan op*")
			; assertEquals_IntList([], scan op* [])
			; assertEquals_IntList([0], scan op* [0])
			; assertEquals_IntList([1], scan op* [1])
			; assertEquals_IntList([231], scan op* [231])
			; assertEquals_IntList([425], scan op* [425])
			; assertEquals_IntList([0, 0], scan op* [0, 0])
			; assertEquals_IntList([0, 0], scan op* [0, 1])
			; assertEquals_IntList([1, 0], scan op* [1, 0])
			; assertEquals_IntList([0, 0], scan op* [0, 425])
			; assertEquals_IntList([425, 0], scan op* [425, 0])
			; assertEquals_IntList([1, 10], scan op* [1, 10])
			; assertEquals_IntList([10, 10], scan op* [10, 1])
			; assertEquals_IntList([1, 2], scan op* [1, 2])
			; assertEquals_IntList([2, 8], scan op* [2, 4])
			; assertEquals_IntList([231, 98175], scan op* [231, 425])
			; assertEquals_IntList([0, 0, 0], scan op* [0, 0, 0])
			; assertEquals_IntList([0, 0, 0], scan op* [0, 0, 425])
			; assertEquals_IntList([0, 0, 0], scan op* [0, 425, 0])
			; assertEquals_IntList([425, 0, 0], scan op* [425, 0, 0])
			; assertEquals_IntList([1, 2, 6], scan op* [1, 2, 3])
			; assertEquals_IntList([131, 30261, 12860925], scan op* [131, 231, 425])
			; assertEquals_IntList([1, 2, 6, 24, 120], scan op* [1, 2, 3, 4, 5])
			; assertEquals_IntList([5, 20, 60, 120, 120], scan op* [5, 4, 3, 2, 1])
			; assertEquals_IntList([7, 49, 343, 31899, 350889], scan op* [7, 7, 7, 93, 11])
		; leave() )


		val empty = IntRedBlackSet.empty
		val toList = IntRedBlackSet.listItems (* deprecated *)
		val fromList = IntRedBlackSet.fromList
		val intersection = IntRedBlackSet.intersection
		val union = IntRedBlackSet.union

		val assertEquals_IntListList = assertEquals (Repr.toString o Repr.listToRepr (Repr.listToRepr Repr.I))
		fun assertEquals_IntSetList(expected, actual) = 
			assertEquals_IntListList(map toList expected, map toList actual)


        fun test_set_intersection_scan() =
			( enter("scan set intersection")
				; assertEquals_IntSetList([], scan intersection [])
				; assertEquals_IntSetList([empty], scan intersection [empty])
				; assertEquals_IntSetList([fromList([1,2,3])], scan intersection [fromList([1,2,3])])
				; assertEquals_IntSetList([fromList([1,2,3]), empty], scan intersection [fromList([1,2,3]), empty])
				; assertEquals_IntSetList([empty, empty], scan intersection [empty, fromList([1,2,3])])
				; assertEquals_IntSetList([fromList([1,2,3]), empty], scan intersection [fromList([1,2,3]), fromList([4,5,6])])
				; assertEquals_IntSetList([fromList([1,2,3]), fromList([1,2,3])], scan intersection [fromList([1,2,3]), fromList([1,2,3])])
				; assertEquals_IntSetList([fromList([1,2,3]), fromList([2,3])], scan intersection [fromList([1,2,3]), fromList([2,3,4])])
				; assertEquals_IntSetList([fromList([1,2,3,4,5]), fromList([2,3,4]), fromList([2])], scan intersection [fromList([1,2,3,4,5]), fromList([2,3,4]), fromList([0,1,2])])
				; assertEquals_IntSetList([fromList([1,2,3,4,5]), fromList([2,3,4]), fromList([2]), empty], scan intersection [fromList([1,2,3,4,5]), fromList([2,3,4]), fromList([0,1,2]), fromList([231,425])])
			; leave() )

        fun test_set_union_scan() =
			( enter("scan set union")
				; assertEquals_IntSetList([], scan union [])
				; assertEquals_IntSetList([empty], scan union [empty])
				; assertEquals_IntSetList([fromList([1,2,3])], scan union [fromList([1,2,3])])
				; assertEquals_IntSetList([fromList([1,2,3]), fromList([1,2,3])], scan union [fromList([1,2,3]), empty])
				; assertEquals_IntSetList([empty, fromList([1,2,3])], scan union [empty, fromList([1,2,3])])
				; assertEquals_IntSetList([fromList([1,2,3]), fromList([1,2,3,4,5,6])], scan union [fromList([1,2,3]), fromList([4,5,6])])
				; assertEquals_IntSetList([fromList([1,2,3]), fromList([1,2,3])], scan union [fromList([1,2,3]), fromList([1,2,3])])
				; assertEquals_IntSetList([fromList([1,2,3]), fromList([1,2,3,4])], scan union [fromList([1,2,3]), fromList([2,3,4])])
				; assertEquals_IntSetList([fromList([1,2,3,4,5]), fromList([1,2,3,4,5]), fromList([0,1,2,3,4,5])], scan union [fromList([1,2,3,4,5]), fromList([2,3,4]), fromList([0,1,2])])
				; assertEquals_IntSetList([fromList([1,2,3,4,5]), fromList([1,2,3,4,5]), fromList([0,1,2,3,4,5]), fromList([0,1,2,3,4,5,231,425])], scan union [fromList([1,2,3,4,5]), fromList([2,3,4]), fromList([0,1,2]), fromList([231,425])])
			; leave() )

end

val _ = ( UnitTest.processCommandLineArgs()
        ; SumScanUtil.test_sum_scan("scan op+", scan op+)
        ; TestScan.test_product_scan()
        ; TestScan.test_set_intersection_scan()
        ; TestScan.test_set_union_scan()
        ; OS.Process.exit(OS.Process.success)
        )

open IntRedBlackSet
