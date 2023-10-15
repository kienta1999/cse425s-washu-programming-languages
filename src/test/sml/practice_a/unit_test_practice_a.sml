CM.make "../unit_test/unit_test.cm";
use "../../../main/sml/practice_a/practice_a.sml";

signature TEST_PRACTICE_A = sig
    val test_complete : unit -> unit
end

structure TestPracticeA :> TEST_PRACTICE_A = struct
    open UnitTest

    fun test_alternate() =
        ( enter("alternate")
        ; assertEquals_Int(~2, alternate([1,2,3,4]))
        ; assertEquals_Int(10, alternate([1,~2,3,~4]))
        ; assertEquals_Int(0-10, alternate([~1,2,~3,4]))
        ; leave() )

    fun test_min_max() =
        ( enter("min_max")
        ; assertEquals_IntInt((2,13), min_max([3,2,13,8,5]))
        ; leave() )

    fun test_cumsum() =
        ( enter("cumsum")
        ; assertEquals_IntList([1,5,25], cumsum([1,4,20]))
        ; assertEquals_IntList([1,3,6,10,15], cumsum([1,2,3,4,5]))
        ; leave() )

    fun test_greeting() =
        ( enter("greeting")
        ; assertEquals_String("Hello there, Dan!", greeting(SOME "Dan"))
        ; assertEquals_String("Hello there, you!", greeting(NONE))
        ; leave() )

    fun test_repeat() =
        ( enter("repeat")
        ; assertEquals_IntList([1,1,1,1,3,3,3], repeat([1,2,3],[4,0,3]))
        ; leave() )

    fun test_addOpt() =
        ( enter("addOpt")
        ; assertEquals_IntOption(SOME(3), addOpt(SOME(1),SOME(2)))
        ; assertEquals_IntOption(NONE, addOpt(SOME(1),NONE))
        ; assertEquals_IntOption(NONE, addOpt(NONE,SOME(1)))
        ; assertEquals_IntOption(NONE, addOpt(NONE,NONE))
        ; leave() )

    fun test_addAllOpt() =
        ( enter("addAllOpt")
        ; assertEquals_IntOption(SOME(4), addAllOpt([SOME(1),NONE,SOME(3)]))
        ; assertEquals_IntOption(SOME(9), addAllOpt([NONE, SOME(1),NONE,SOME(3), NONE, SOME(5), NONE]))
        ; leave() )

    fun test_any() =
        ( enter("any")
        ; assertFalse(any([]))
        ; assertFalse(any([false]))
        ; assertFalse(any([false, false]))
        ; assertFalse(any([false, false, false]))
        ; assertTrue(any([true, false, false]))
        ; assertTrue(any([false, true, false]))
        ; assertTrue(any([false, false, true]))
        ; assertTrue(any([true, false, true]))
        ; assertTrue(any([true, true, true]))
        ; assertTrue(any([true, true]))
        ; assertTrue(any([true]))
        ; leave() )

    fun test_all() =
        ( enter("all")
        ; assertTrue(all([]))
        ; assertFalse(all([false]))
        ; assertFalse(all([false, false]))
        ; assertFalse(all([false, false, false]))
        ; assertFalse(all([true, false, false]))
        ; assertFalse(all([false, true, false]))
        ; assertFalse(all([false, false, true]))
        ; assertFalse(all([true, false, true]))
        ; assertTrue(all([true, true, true]))
        ; assertTrue(all([true, true]))
        ; assertTrue(all([true]))
        ; leave() )

    fun test_zip() =
        ( enter("zip")
        ; assertEquals_IntIntList([(1,4), (2,6)], zip([1,2,3], [4,6]))
        ; leave() )

    fun test_zipRecycle() =
        ( enter("zipRecycle")
        ; assertEquals_IntIntList([(1,1),(2,2),(3,3),(1,4),(2,5),(3,6),(1,7)], zipRecycle([1,2,3],[1,2,3,4,5,6,7]))
        ; leave() )

    fun test_zipOpt() =
        ( enter("zipOpt")
        ; assertEquals_IntIntListOption(NONE, zipOpt([],[1]))
        ; assertEquals_IntIntListOption(NONE, zipOpt([1],[]))
        ; assertEquals_IntIntListOption(NONE, zipOpt([1,2],[1,2,3]))
        ; assertEquals_IntIntListOption(NONE, zipOpt([1,2,3],[1,2]))
        ; assertEquals_IntIntListOption(SOME [], zipOpt([],[]))
        ; assertEquals_IntIntListOption(SOME [(1,2)], zipOpt([1],[2]))
        ; assertEquals_IntIntListOption(SOME [(1,2),(3,4),(5,6)], zipOpt([1,3,5],[2,4,6]))
        ; leave() )

    fun test_lookup() =
        ( enter("lookup")
        ; assertEquals_IntOption(NONE, lookup([],"hello"))
        ; assertEquals_IntOption(NONE, lookup([("goodbye", 425)],"hello"))
        ; assertEquals_IntOption(SOME 425, lookup([("hello", 425)],"hello"))
        ; assertEquals_IntOption(NONE, lookup([("a", 131), ("b",231), ("c",425)],"d"))
        ; assertEquals_IntOption(SOME 131, lookup([("a", 131), ("b",231), ("c",425)],"a"))
        ; assertEquals_IntOption(SOME 231, lookup([("a", 131), ("b",231), ("c",425)],"b"))
        ; assertEquals_IntOption(SOME 425, lookup([("a", 131), ("b",231), ("c",425)],"c"))
        ; leave() )

    fun test_splitup() =
        ( enter("splitup")
        ; assertEquals_IntListIntList(([],[]), splitup([]))
        ; assertEquals_IntListIntList(([~1,~3,~5,~7], [0,2,4,6,8]), splitup([0,~1,2,~3,4,~5,6,~7,8]))
        ; leave() )

    fun test_splitAt() =
        ( enter("splitAt")
        ; assertEquals_IntListIntList(([],[]), splitAt([], 200))
        ; assertEquals_IntListIntList(([131],[231,425]), splitAt([131,231,425], 200))
        ; leave() )

    fun test_isSorted() =
        ( enter("isSorted")
        ; assertTrue(isSorted [])
        ; assertTrue(isSorted [425])
        ; assertTrue(isSorted [131,231,425])
        ; assertFalse(isSorted [131,425,231])
        ; leave() )

    fun test_isAnySorted() =
        ( enter("isAnySorted")
        ; assertTrue(isAnySorted [])
        ; assertTrue(isAnySorted [425])
        ; assertTrue(isAnySorted [131,231,425])
        ; assertTrue(isAnySorted [425,231,131])
        ; assertFalse(isAnySorted [131,425,231])
        ; leave() )

    fun test_sortedMerge() =
        ( enter("sortedMerge")
        ; assertEquals_IntList([], sortedMerge([],[]))
        ; assertEquals_IntList([425], sortedMerge([425],[]))
        ; assertEquals_IntList([425], sortedMerge([],[425]))
        ; assertEquals_IntList([131,231,425], sortedMerge([231],[131,425]))
        ; assertEquals_IntList([1,4,5,7,8,9], sortedMerge([1,4,7],[5,8,9]))
        ; leave() )

    fun test_qsort() =
        ( enter("qsort")
        ; assertEquals_IntList([], qsort([]))
        ; assertEquals_IntList([425], qsort([425]))
        ; assertEquals_IntList([131,231,425], qsort([231,131,425]))
        ; assertEquals_IntList([1,4,5,7,8,9], qsort([1,4,7,5,8,9]))
        ; leave() )

    fun test_divide() =
        ( enter("divide")
        ; assertEquals_IntListIntList(([],[]), divide([]))
        ; assertEquals_IntListIntList(([1],[]), divide([1]))
        ; assertEquals_IntListIntList(([1],[2]), divide([1,2]))
        ; assertEquals_IntListIntList(([1,3,5,7],[2,4,6]), divide([1,2,3,4,5,6,7]))
        ; leave() )

    fun test_not_so_quick_sort() =
        ( enter("not_so_quick_sort")
        ; assertEquals_IntList([], not_so_quick_sort([]))
        ; assertEquals_IntList([425], not_so_quick_sort([425]))
        ; assertEquals_IntList([131,231,425], not_so_quick_sort([231,131,425]))
        ; assertEquals_IntList([1,4,5,7,8,9], not_so_quick_sort([1,4,7,5,8,9]))
        ; leave() )

    fun test_fullDivide() =
        ( enter("fullDivide")
        ; assertEquals_IntInt((3,5), fullDivide(2,40))
        ; assertEquals_IntInt((0,10), fullDivide(3,10))
        ; leave() )

    fun test_factorize() =
        ( enter("factorize")
        ; assertEquals_IntIntList([(2,2), (5,1)], factorize(20))
        ; assertEquals_IntIntList([(2,2), (3,2)], factorize(36))
        ; assertEquals_IntIntList([(2,3), (3,1), (5,1)], factorize(120))
        ; leave() )

    fun test_multiply() =
        ( enter("multiply")
        ; assertEquals_Int(8, multiply([(2,3)]))
        ; assertEquals_Int(120, multiply([(2,3), (3,1), (5,1)]))
        ; assertEquals_Int(20, multiply([(2,2), (5,1)]))
        ; assertEquals_Int(36, multiply([(2,2), (3,2)]))
        ; leave() )

    fun test_all_products() =
        ( enter("all_products")
        ; assertEquals_IntList([1,2,4,5,10,20], all_products([(2,2),(5,1)]))
        ; leave() )


    fun test_complete() =
        ( test_alternate()
        ; test_min_max()
        ; test_cumsum()
        ; test_greeting()
        ; test_repeat()
        ; test_addOpt()
        ; test_addAllOpt()
        ; test_any()
        ; test_all()
        ; test_zip()
        ; test_zipRecycle()
        ; test_zipOpt()
        ; test_lookup()
        ; test_splitup()
        ; test_splitAt()
        ; test_isSorted()
        ; test_isAnySorted()
        ; test_sortedMerge()
        ; test_qsort()
        ; test_divide()
        ; test_not_so_quick_sort()
        ; test_fullDivide()
        ; test_factorize()
        ; test_multiply()
        ; test_all_products() )

end

val _ = ( UnitTest.processCommandLineArgs()
        ; TestPracticeA.test_complete()
        ; OS.Process.exit(OS.Process.success)
        )
