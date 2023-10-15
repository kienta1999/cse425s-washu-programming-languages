CM.make "../unit_test/unit_test.cm";
use "../../../main/sml/practice_c/practice_c.sml";

open UnitTest

signature TEST_PRACTICE_C = sig
    val test_all : unit -> unit
end

structure TestPracticeC :> TEST_PRACTICE_C = struct
	open UnitTest

	fun test_compose_opt() =
		( enter("compose_opt")
		; assertEquals_IntOption(NONE, compose_opt (fn x => NONE) (fn y => NONE) 425)
		; assertEquals_IntOption(NONE, compose_opt (fn x => NONE) (fn y => SOME y) 425)
		; assertEquals_IntOption(NONE, compose_opt (fn x => SOME x) (fn y => NONE) 425)
		; assertEquals_IntOption(SOME 425, compose_opt (fn x => SOME x) (fn y => SOME y) 425)
		; assertEquals_IntOption(SOME 4240, compose_opt (fn x => SOME (x-10)) (fn y => SOME (y*10)) 425)
		; leave()
		)

	fun test_do_until() =
		( enter("do_until")
		; assertEquals_Int(3, do_until (fn x => x div 2) (fn x => x mod 2 <> 1) 12)
		; leave()
		)

	fun test_factorial() =
		( enter("factorial")
		; assertEquals_Int(1, factorial 1)
		; assertEquals_Int(2, factorial 2)
		; assertEquals_Int(6, factorial 3)
		; assertEquals_Int(24, factorial 4)
		; assertEquals_Int(120, factorial 5)
		; assertEquals_Int(720, factorial 6)
		; leave()
		)

	fun test_fixed_point() =
		( enter("fixed_point")
		; assertEquals_Int(425, fixed_point (fn x => 425 ) 425)
		; assertEquals_Int(4, fixed_point (fn x => ( x div 2 ) + 2 ) 16)
		; leave()
		)

	fun test_map2() =
		( enter("map2")
		; assertEquals_IntInt((16,25), map2 (fn x => x*x ) (4,5) ) 
		; leave()
		)

	fun test_app_all() =
		let
			fun f n = [n, 2*n, 3*n]
		in
			( enter("app_all")
			; assertEquals_IntList([1,2,3, 2,4,6, 3,6,9], app_all f f 1 ) 
			; leave()
			)
		end

	fun test_foldr() =
		( enter("foldr")
		; assertEquals_Int(10, foldr (fn(acc, x)=>(acc+x)) 0 [1,2,3,4])
		; leave()
		)

	fun test_partition() =
		( enter("partition")
		; assertEquals_IntListIntList(([],[]), partition (fn x => true) [])
		; assertEquals_IntListIntList(([],[]), partition (fn x => false) [])
		; assertEquals_IntListIntList(([425],[]), partition (fn x => true) [425])
		; assertEquals_IntListIntList(([],[425]), partition (fn x => false) [425])
		; assertEquals_IntListIntList(([425],[231]), partition (fn x => x>300) [231,425])
		; leave()
		)

	fun test_unfold() =
		( enter("unfold")
		; assertEquals_IntList([5,4,3,2,1], unfold (fn n=>if n=0 then NONE else SOME(n,n-1)) 5) 
		; leave()
		)

	fun test_map() =
		let
			val xs = [1,2,3,4,5,6,7,8]
			fun square x =
				x*x
		in
			( enter("map")
			; assertEquals_IntList(List.map square xs, map square xs)
			; leave()
			)
		end

	fun test_filter() =
		let
			val xs = [1,2,3,4,5,6,7,8]
			fun isEven x =
				(x mod 2) = 0
		in
			( enter("filter")
			; assertEquals_IntList(List.filter isEven xs, filter isEven xs)
			; leave()
			)
		end

	fun test_foldl() =
		let
			val xs = [1,2,3,4,5,6,7,8]
			fun f( x, acc ) =
				(x*x)::acc
		in
			( enter("foldl")
			; assertEquals_IntList(List.foldl f [] xs, foldl f [] xs)
			; leave()
			)
		end

	fun tree_to_string value_to_string t =
		case t of
			LEAF => "LEAF"
		| NODE(v,left,right) => "NODE (" ^ value_to_string(v) ^ "," ^ (tree_to_string value_to_string left)  ^ "," ^ (tree_to_string value_to_string right) ^ ")"

	val int_tree_to_string = tree_to_string Int.toString
	val assertEquals_IntTree = assertEquals int_tree_to_string

	fun test_map_tree() =
		( enter("map_tree")
		; assertEquals_IntTree(NODE(9,NODE(16,LEAF,LEAF),NODE(25,LEAF,LEAF)), (map_tree (fn x => x*x) (NODE(3,NODE(4,LEAF,LEAF),NODE(5,LEAF,LEAF)))))
		; leave()
		)

	fun test_fold_tree() =
		( enter("fold_tree")
		; assertEquals_Int(12, fold_tree (fn (y,acc) => y+acc) 0 (NODE(3,NODE(4,LEAF,LEAF),NODE(5,LEAF,LEAF))))
		; leave()
		)

	fun test_filter_tree() =
		( enter("filter_tree")
		; assertEquals_IntTree(LEAF, (filter_tree (fn x => false) (NODE(3,NODE(4,LEAF,LEAF),NODE(5,LEAF,LEAF)))))
		; assertEquals_IntTree(NODE(3,NODE(4,LEAF,LEAF),NODE(5,LEAF,LEAF)), (filter_tree (fn x => true) (NODE(3,NODE(4,LEAF,LEAF),NODE(5,LEAF,LEAF)))))
		; assertEquals_IntTree(NODE(3,NODE(4,LEAF,LEAF),LEAF), (filter_tree (fn x => x<5) (NODE(3,NODE(4,LEAF,LEAF),NODE(5,LEAF,LEAF)))))
		; assertEquals_IntTree(NODE(3,LEAF,NODE(5,LEAF,LEAF)), (filter_tree (fn x => x<>4) (NODE(3,NODE(4,LEAF,LEAF),NODE(5,LEAF,LEAF)))))
		; assertEquals_IntTree(NODE(3,LEAF,LEAF), (filter_tree (fn x => x=3) (NODE(3,NODE(4,LEAF,LEAF),NODE(5,LEAF,LEAF)))))
		; leave()
		)

    fun test_all() =
        ( test_compose_opt()
        ; test_do_until()
        ; test_factorial()
        ; test_fixed_point()
        ; test_map2()
        ; test_app_all()
        ; test_foldr()
        ; test_partition()
        ; test_unfold()
        ; test_map()
		; test_filter()
		; test_foldl()
		; test_map_tree()
		; test_fold_tree()
		; test_filter_tree()
		)
end

val _ = ( processCommandLineArgs()
        ; TestPracticeC.test_all()
        ; OS.Process.exit(OS.Process.success)
        )

