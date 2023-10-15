CM.make "../../../core/sml/repr/repr.cm";
CM.make "../unit_test/unit_test.cm";
use "../../../main/sml/practice_b/practice_b.sml";

signature TEST_PRACTICE_B = sig
    val test_complete : unit -> unit
end

structure TestPracticeB :> TEST_PRACTICE_B = struct
    open UnitTest

    fun assertRaises_Negative(thunk) = 
        ( thunk()
        ; failure("should raise Negative") )
        handle Negative => success("raises Negative")

	fun pass_fail_to_string(pf : pass_fail) =
		case pf of
		  pass => "pass"
		| fail => "fail"

	val assertEquals_PassFail = assertEquals pass_fail_to_string

	fun assertPass(actual : pass_fail) = 
		assertEquals_PassFail(pass, actual)

	fun assertFail(actual : pass_fail) = 
		assertEquals_PassFail(fail, actual)


	fun flag_to_string(f : flag) : string =
		case f of
		leave_me_alone => "leave_me_alone"
		| prune_me => "prune_me"
	fun flag_tree_to_string(t : flag tree) : string =
		case t of
		leaf => "leaf"
		| node {value=v,left=lt,right=rt} => "node {value=" ^ flag_to_string(v) ^ ",left=" ^ flag_tree_to_string(lt) ^ ",right=" ^ flag_tree_to_string(rt) ^ ";"

	val assertEquals_FlagTree = assertEquals flag_tree_to_string

	fun nat_to_string(n : nat) =
		case n of
		  ZERO => "ZERO"
		| SUCC n' => "SUCC " ^ nat_to_string(n')

	val assertEquals_Nat = assertEquals nat_to_string

    fun test_pass_or_fail() = 
        ( enter("pass_or_fail")
        ; assertPass(pass_or_fail ({grade=SOME 76, id=0}))
        ; assertPass(pass_or_fail ({grade=SOME 75, id=0}))
        ; assertFail(pass_or_fail ({grade=SOME 74, id=0}))
        ; assertFail(pass_or_fail ({grade=NONE, id=0}))
        ; leave() )

    fun test_has_passed() = 
        ( enter("has_passed")
        ; assertTrue(has_passed ({grade=SOME 76, id=0}))
        ; assertTrue(has_passed ({grade=SOME 75, id=0}))
        ; assertFalse(has_passed ({grade=SOME 74, id=0}))
        ; assertFalse(has_passed ({grade=NONE, id=0}))
        ; leave() )

    fun create_final_grade(g : int) : final_grade =
        {grade=SOME g, id=0}

    fun create_final_grades(gs : int list) : final_grade list =
        let 
            fun aux(gs : int list, acc : final_grade list) = 
                case gs of
                [] => acc
                | g :: gs' => aux(gs', create_final_grade(g)::acc)
        in
            aux(gs, [])
        end

    fun test_number_passed() = 
        ( enter("number_passed")
        ; assertEquals_Int(0, number_passed (create_final_grades([])))
        ; assertEquals_Int(0, number_passed (create_final_grades([70])))
        ; assertEquals_Int(1, number_passed (create_final_grades([80])))
        ; assertEquals_Int(2, number_passed (create_final_grades([50, 80, 60, 90, 70])))
        ; leave() )

    fun test_number_misgraded() = 
        ( enter("number_misgraded")
        ; assertEquals_Int(0, number_misgraded( []))
        ; assertEquals_Int(0, number_misgraded( [(pass,create_final_grade(90))]))
        ; assertEquals_Int(1, number_misgraded( [(pass,create_final_grade(50))]))
        ; assertEquals_Int(0, number_misgraded( [(fail,create_final_grade(50))]))
        ; assertEquals_Int(1, number_misgraded( [(fail,create_final_grade(90))]))
        ; assertEquals_Int(2, number_misgraded( [(pass,create_final_grade(50)), (fail,create_final_grade(90))]))
        ; leave() )

    fun test_tree_height() = 
        ( enter("tree_height")
        ; assertEquals_Int(0, tree_height(leaf))
        ; assertEquals_Int(1, tree_height(node {value=231, left=leaf, right=leaf}))
        ; assertEquals_Int(2, tree_height(node {value=231, left=leaf, right=node {value=425, left=leaf, right=leaf}}))
        ; leave() )

    fun test_sum_tree() = 
        ( enter("sum_tree")
        ; assertEquals_Int(0, sum_tree(leaf))
        ; assertEquals_Int(231, sum_tree(node {value=231, left=leaf, right=leaf}))
        ; assertEquals_Int(231+425, sum_tree(node {value=231, left=leaf, right=node {value=425, left=leaf, right=leaf}}))
        ; leave() )

    fun test_gardener() = 
        let
            val treeA = node {value=leave_me_alone, left=leaf, right=leaf}
            val treeB = node {value=leave_me_alone, left=leaf, right=node {value=prune_me, left=leaf, right=leaf}}
        in
            ( enter("gardener")
            ; assertEquals_FlagTree(leaf, gardener(leaf))
            ; assertEquals_FlagTree(treeA, gardener(treeA))
            ; assertEquals_FlagTree(treeA, gardener(treeB))
            ; leave() )
        end

    fun test_my_last() = 
        let
            fun my_last_test_all(vss) = 
                case vss of
                [] => ()
                | vs::vss' => (assertEquals_Int (List.last(vs), my_last(vs)); my_last_test_all(vss'))
        in
            ( enter("my_last")
            ; assertRaises_Empty(fn() => my_last([]))
            ; my_last_test_all([[1], [1,2], [1,2,3], [1,2,3,4]])
            ; leave() )
        end


    fun test_my_take() = 
        let
            fun my_take_test_all(vsis) = 
                case vsis of
                [] => ()
                | (vs,i)::vsis' => (assertEquals_IntList(List.take(vs,i), my_take(vs,i)); my_take_test_all(vsis'))
        in
            ( enter("my_take")
            ; assertRaises_Subscript(fn() => my_take([], ~1))
            ; assertRaises_Subscript(fn() => my_take([1,2,3,4], 5))
            ; my_take_test_all([([1,2,3,4],0), ([1,2,3,4],1), ([1,2,3,4],2), ([1,2,3,4],3), ([1,2,3,4],4)])
            ; leave() )
        end
    
    fun test_my_drop() = 
        let
            fun my_drop_test_all(vsis) = 
                case vsis of
                [] => ()
                | (vs,i)::vsis' => (assertEquals_IntList(List.drop(vs,i), my_drop(vs,i)); my_drop_test_all(vsis'))
        in
            ( enter("my_drop")
            ; assertRaises_Subscript(fn() => my_drop([], ~1))
            ; assertRaises_Subscript(fn() => my_drop([1,2,3,4], 5))
            ; my_drop_test_all([([1,2,3,4],0), ([1,2,3,4],1), ([1,2,3,4],2), ([1,2,3,4],3), ([1,2,3,4],4)])
            ; leave() )
        end


    fun test_my_concat() = 
        let
            fun my_concat_test_all(vsss) = 
                case vsss of
                [] => ()
                | vss::vsss' => (assertEquals_IntList(List.concat(vss), my_concat(vss)); my_concat_test_all(vsss'))
        in
            ( enter("my_concat")
            ; my_concat_test_all([
                [], 
                [[],[],[]],
                [[1]], 
                [[1], [2,3], [4,5,6]]
            ])
            ; leave() )
        end


    fun test_my_getOpt() = 
        ( enter("my_getOpt")
        ; assertEquals_Int(425, my_getOpt(NONE, 425))
        ; assertEquals_Int(231, my_getOpt(SOME 231, 425))
        ; leave() )

    fun test_my_join() = 
        let
            fun my_join_test_all(opt_opts) = 
                case opt_opts of
                [] => ()
                | opt_opt::opt_opts' => ( assertEquals_IntOption(Option.join(opt_opt), my_join(opt_opt)); my_join_test_all(opt_opts'))
        in
            ( enter("my_join")
            ; my_join_test_all([NONE, SOME(NONE), SOME(SOME(2))])
            ; leave() )
        end

    val one = SUCC ZERO
    val two = SUCC one
    val three = SUCC two
    val four = SUCC three
    val five = SUCC four
    val six = SUCC five

    fun test_is_positive() = 
        ( enter("is_positive")
        ; assertFalse(is_positive ZERO)
        ; assertTrue(is_positive one)
        ; assertTrue(is_positive two)
        ; assertTrue(is_positive three)
        ; leave() )

    fun test_pred() = 
        ( enter("pred")
        ; assertEquals_Nat(two, pred three)
        ; assertEquals_Nat(one, pred two)
        ; assertEquals_Nat(ZERO, pred one)
        ; assertRaises_Negative(fn()=>pred(ZERO))
        ; leave() )

    fun test_nat_to_int() = 
        ( enter("nat_to_int")
        ; assertEquals_Int(0, nat_to_int(ZERO))
        ; assertEquals_Int(1, nat_to_int(one))
        ; assertEquals_Int(2, nat_to_int(two))
        ; assertEquals_Int(3, nat_to_int(three))
        ; leave() )

    fun test_int_to_nat() = 
        ( enter("int_to_nat")
        ; assertEquals_Nat(ZERO, int_to_nat(0))
        ; assertEquals_Nat(one, int_to_nat(1))
        ; assertEquals_Nat(two, int_to_nat(2))
        ; assertEquals_Nat(three, int_to_nat(3))
        ; assertRaises_Negative(fn()=>int_to_nat(~1))
        ; leave() )

    fun test_add() = 
        ( enter("add")
        ; assertEquals_Nat(ZERO, add(ZERO, ZERO))
        ; assertEquals_Nat(one, add(ZERO, one))
        ; assertEquals_Nat(one, add(one, ZERO))
        ; assertEquals_Nat(two, add(one, one))
        ; assertEquals_Nat(three, add(two, one))
        ; assertEquals_Nat(three, add(one, two))
        ; assertEquals_Nat(four, add(two, two))
        ; leave() )

    fun test_sub() = 
        ( enter("sub")
        ; assertEquals_Nat(ZERO, sub(ZERO, ZERO))

        ; assertEquals_Nat(one, sub(one, ZERO))
        ; assertEquals_Nat(ZERO, sub(one, one))

        ; assertEquals_Nat(two, sub(two, ZERO))
        ; assertEquals_Nat(one, sub(two, one))
        ; assertEquals_Nat(ZERO, sub(two, two))

        ; assertEquals_Nat(three, sub(three, ZERO))
        ; assertEquals_Nat(two, sub(three, one))
        ; assertEquals_Nat(one, sub(three, two))
        ; assertEquals_Nat(ZERO, sub(three, three))

        ; assertEquals_Nat(four, sub(four, ZERO))
        ; assertEquals_Nat(three, sub(four, one))
        ; assertEquals_Nat(two, sub(four, two))
        ; assertEquals_Nat(one, sub(four, three))
        ; assertEquals_Nat(ZERO, sub(four, four))

        ; assertRaises_Negative(fn()=>sub(one, two))
        ; leave() )

    fun test_mult() = 
        ( enter("mult")
        ; assertEquals_Nat(ZERO, mult(ZERO, ZERO))
        ; assertEquals_Nat(ZERO, mult(three, ZERO))
        ; assertEquals_Nat(ZERO, mult(ZERO, three))
        ; assertEquals_Nat(two, mult(one, two))
        ; assertEquals_Nat(four, mult(four, one))
        ; assertEquals_Nat(four, mult(two, two))
        ; assertEquals_Nat(six, mult(three, two))
        ; assertEquals_Nat(six, mult(two, three))
        ; leave() )

    fun test_less_than() = 
        ( enter("less_than")
        ; assertTrue(less_than(ZERO, one))
        ; assertTrue(less_than(ZERO, two))
        ; assertTrue(less_than(ZERO, six))
        ; assertFalse(less_than(ZERO, ZERO))
        ; assertFalse(less_than(one, ZERO))
        ; assertFalse(less_than(two, ZERO))
        ; assertFalse(less_than(six, ZERO))
        ; assertTrue(less_than(one, three))
        ; assertTrue(less_than(one, two))
        ; assertTrue(less_than(one, six))
        ; assertFalse(less_than(three, one))
        ; assertFalse(less_than(two, one))
        ; assertFalse(less_than(six, one))
        ; leave() )

    fun test_isEmpty() = 
        ( enter("isEmpty")
        ; assertTrue(isEmpty(Elems []))
        ; assertFalse(isEmpty(Elems [425]))
        ; assertTrue(isEmpty(Union(Elems [], Elems [])))
        ; assertFalse(isEmpty(Union(Elems [425], Elems [])))
        ; assertFalse(isEmpty(Union(Elems [], Elems [425])))
        ; assertFalse(isEmpty(Union(Elems [425], Elems [231])))
        ; leave() )

    fun test_contains() = 
        ( enter("contains")
        ; assertFalse(contains(Elems [], 425))
        ; assertTrue(contains(Elems [425], 425))
        ; assertFalse(contains(Elems [425], 231))
        ; assertTrue(contains(Elems [231, 425], 425))
        ; assertTrue(contains(Elems [231, 425], 231))
        ; assertTrue(contains(Range {from=231, to=425}, 300))
        ; assertFalse(contains(Range {from=231, to=425}, 100))
        ; assertFalse(contains(Range {from=231, to=425}, 500))
        ; assertTrue(contains(Union(Elems([231, 425]), Elems([4, 66, 99])), 4))
        ; assertTrue(contains(Union(Elems([231, 425]), Elems([4, 66, 99])), 66))
        ; assertTrue(contains(Union(Elems([231, 425]), Elems([4, 66, 99])), 99))
        ; assertTrue(contains(Union(Elems([231, 425]), Elems([4, 66, 99])), 231))
        ; assertTrue(contains(Union(Elems([231, 425]), Elems([4, 66, 99])), 425))
        ; assertFalse(contains(Union(Elems([231, 425]), Elems([4, 66, 99])), 100))
        ; assertFalse(contains(Intersection(Elems([231, 425]), Elems([4, 66, 99])), 4))
        ; assertFalse(contains(Intersection(Elems([231, 425]), Elems([4, 66, 99])), 66))
        ; assertFalse(contains(Intersection(Elems([231, 425]), Elems([4, 66, 99])), 99))
        ; assertFalse(contains(Intersection(Elems([231, 425]), Elems([4, 66, 99])), 231))
        ; assertFalse(contains(Intersection(Elems([231, 425]), Elems([4, 66, 99])), 425))
        ; assertFalse(contains(Intersection(Elems([231, 425]), Elems([4, 66, 99])), 100))
        ; assertFalse(contains(Intersection(Elems([1, 2, 3, 4]), Range{from=3, to=7}), 2))
        ; assertTrue(contains(Intersection(Elems([1, 2, 3, 4]), Range{from=3, to=7}), 3))
        ; assertTrue(contains(Intersection(Elems([1, 2, 3, 4]), Range{from=3, to=7}), 4))
        ; assertFalse(contains(Intersection(Elems([1, 2, 3, 4]), Range{from=3, to=7}), 5))
        ; assertFalse(contains(Intersection(Elems([1, 2, 3, 4]), Range{from=3, to=7}), 6))
        ; assertFalse(contains(Intersection(Elems([1, 2, 3, 4]), Range{from=3, to=7}), 7))
        ; leave() )

    fun test_toList() = 
        (* TODO: test in any order *)
        ( enter("toList")
        ; assertEquals_IntList([], toList(Elems []))
        ; assertEquals_IntList([425], toList(Elems [425]))
        ; assertEquals_IntList([231,425], toList(Elems [231, 425]))
        ; assertEquals_IntList([231,425], toList(Union(Elems [231], Elems([425]))))
        ; assertEquals_IntList([4,12], toList(Intersection(Elems [2,4,6,8,10,12], Elems([4,9,12,33]))))
        ; assertEquals_IntList([4,12], toList(Intersection(Union(Elems [4,6,10], Elems [2,8,12]), Elems([4,9,12,33]))))
        ; assertEquals_IntList([10,12], toList(Intersection(Elems [2,4,6,8,10,12], Range{from=9, to=33})))
        ; leave() )


    fun test_complete() =
        ( test_pass_or_fail() 
        ; test_has_passed() 
        ; test_number_passed() 
        ; test_number_misgraded() 
        ; test_tree_height() 
        ; test_sum_tree() 
        ; test_gardener() 
        ; test_my_last() 
        ; test_my_take() 
        ; test_my_drop() 
        ; test_my_concat() 
        ; test_my_getOpt() 
        ; test_my_join() 
        ; test_is_positive() 
        ; test_pred() 
        ; test_nat_to_int() 
        ; test_int_to_nat() 
        ; test_add() 
        ; test_sub() 
        ; test_mult() 
        ; test_less_than() 
        ; test_isEmpty() 
        ; test_contains() 
        ; test_toList() )

end

val _ = ( UnitTest.processCommandLineArgs()
        ; TestPracticeB.test_complete()
        ; OS.Process.exit(OS.Process.success)
        )
