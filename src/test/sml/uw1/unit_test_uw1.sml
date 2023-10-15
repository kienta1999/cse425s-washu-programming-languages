CM.make "../../../core/sml/repr/repr.cm";
CM.make "../unit_test/unit_test.cm";
use "../../../main/sml/uw1/uw1.sml";

signature TEST_UW1 = sig
    val test_base_credit : unit -> unit
    val test_extra_credit : unit -> unit
end

structure TestUW1 :> TEST_UW1 = struct
    open UnitTest
    fun date_compare((ay,am,ad),(by,bm,bd)) = 
        if ay=by
        then 
            if am=bm
            then ad>bd
            else am>bm
        else ay>by
    
    val assertEqualsAnyOrder_IntIntIntList = assertEqualsAnyOrder (Repr.toString o Repr.listToRepr (Repr.t3ToRepr Repr.I Repr.I Repr.I)) date_compare

    fun test_is_older() =
        ( enter("is_older")
            ; assertTrue(is_older((1,2,3),(2,3,4)))
        ; leave() )

    fun test_number_in_month() =
        ( enter("number_in_month")
            ; assertEquals_Int(1, number_in_month([(2012,2,28),(2013,12,1)],2))
        ; leave() )

    fun test_number_in_months() =
        ( enter("number_in_months")
            ; assertEquals_Int(3, number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]))
        ; leave() )

    fun test_dates_in_month() =
        ( enter("dates_in_month")
            ; assertEqualsAnyOrder_IntIntIntList([(2012,2,28)], dates_in_month ([(2012,2,28),(2013,12,1)],2))
        ; leave() )

    fun test_dates_in_months() =
        ( enter("dates_in_months")
            ; assertEqualsAnyOrder_IntIntIntList([(2012,2,28),(2011,3,31),(2011,4,28)], dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]))
        ; leave() )

    fun test_get_nth() =
        ( enter("get_nth")
            ; assertEquals_String("there", get_nth (["hi", "there", "how", "are", "you"], 2))
        ; leave() )

    fun test_date_to_string() =
        ( enter("date_to_string")
            ; assertEquals_String("June 1, 2013", date_to_string (2013, 6, 1))
        ; leave() )

    fun test_number_before_reaching_sum() =
        ( enter("number_before_reaching_sum")
            ; assertEquals_Int(3, number_before_reaching_sum (10, [1,2,3,4,5,6,7,8]))
        ; leave() )

    fun test_what_month_tests() =
        ( enter("what_month_tests")
            ; assertEquals_Int(3, what_month (70))
        ; leave() )

    fun test_month_range() =
        ( enter("month_range")
            ; assertEquals_IntList([1,2,2,2], month_range (31, 34))
        ; leave() )

    fun test_oldest() =
        ( enter("oldest")
            ; assertEquals_IntIntIntOption(SOME (2011,3,31), oldest([(2012,2,28),(2011,3,31),(2011,4,28)]))
        ; leave() )

    fun test_number_in_months_challenge() =
        ( enter("number_in_months_challenge")
            ; assertEquals_Int(3, number_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]))
        ; leave() )

    fun test_dates_in_months_challenge() =
        ( enter("dates_in_months_challenge")
            ; assertEqualsAnyOrder_IntIntIntList([(2012,2,28),(2011,3,31),(2011,4,28)], dates_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]))
        ; leave() )

    fun test_reasonable_date() =
        ( enter("reasonable_date")
            ; assertTrue(reasonable_date((1,2,3)))
        ; leave() )

    fun test_base_credit() =
        ( test_is_older()
        ; test_number_in_month()
        ; test_number_in_months()
        ; test_dates_in_month()
        ; test_dates_in_months()
        ; test_get_nth()
        ; test_date_to_string()
        ; test_number_before_reaching_sum()
        ; test_what_month_tests()
        ; test_month_range()
        ; test_oldest() )

    fun test_extra_credit() =
        ( test_number_in_months_challenge()
        ; test_dates_in_months_challenge()
        ; test_reasonable_date() )
end

val _ = ( UnitTest.processCommandLineArgs()
        ; TestUW1.test_base_credit()
        ; TestUW1.test_extra_credit()
        ; OS.Process.exit(OS.Process.success)
        )
