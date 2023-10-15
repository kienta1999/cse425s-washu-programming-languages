(* Dennis Cosgrove *)
structure CoreUnitTestBinarySearchTree :> sig
    val assertInsertAll_Int : int list -> unit
    val assertInsertAll_String : string list -> unit

    val assertInsertAllInRandomOrderRepeatedly_Int : (int * int list) -> unit
    val assertInsertAllInRandomOrderRepeatedly_String : (int * string list) -> unit
    
    val assertInsertAllInOrderFollowedByRemove_Int : (int list * int) -> unit
    val assertInsertAllInOrderFollowedByRemove_String : (string list * string) -> unit
    
    val assertInsertAllInRandomOrderFollowedByRemoveEachInRandomOrderRepeatedly_Int : (int * int list) -> unit
    val assertInsertAllInRandomOrderFollowedByRemoveEachInRandomOrderRepeatedly_String : (int * string list) -> unit

    val assertInsertAllInOrderFollowedByFinds_Int : (int list * int list) -> unit
    val assertInsertAllInOrderFollowedByFinds_String : (string list * string list) -> unit

    val assertInsertAllInRandomOrderFollowedByFindsEachInRandomOrderRepeatedly_Int : (int * int list * int list) -> unit
    val assertInsertAllInRandomOrderFollowedByFindsEachInRandomOrderRepeatedly_String : (int * string list * string list) -> unit
end = struct
    open BinarySearchTree
    fun list_to_string(item_to_repr) = (Repr.toString o Repr.listToRepr item_to_repr)

    type 'a simple_tree = ('a,'a) tree

	fun create_empty_simple_tree(compare_function) =
		create_empty(compare_function, fn(v)=>v)

    fun insertAll compare_function (xs : 'a list) : 'a simple_tree =
        let 
            fun helper(xs, acc) =
                case xs of
                        [] => acc
                | x :: xs' => let
                                val (acc,_) = insert(acc, x)
                              in
                                helper(xs', acc)
                              end
        in
            helper(xs, create_empty_simple_tree(compare_function))
        end

    fun treeToList(t : 'a simple_tree) : 'a list =
        fold_rnl(op::, [], t)

    fun assertInsertAll item_to_repr compare_function (original_list: ''a list) : unit = 
        let
            val expected_list = (ListMergeSort.uniqueSort compare_function original_list)
            val actual_tree = (insertAll compare_function original_list)
            val actual_list = treeToList(actual_tree)

            val item_list_to_string = list_to_string(item_to_repr)
            val expected_list_string = item_list_to_string(expected_list)
        in
            if expected_list = actual_list
            then UnitTest.success("equals: " ^ expected_list_string)
            else 
                let
                    val original_list_string = item_list_to_string(original_list)
                    val item_to_string = (Repr.toString o item_to_repr)
                    val actual_tree_string = BinarySearchTree.debug_message(item_to_string, actual_tree)
                    val actual_list_string = item_list_to_string(actual_list)
                in
                    UnitTest.failure("expected: " ^ expected_list_string ^ "; actual: " ^ actual_list_string ^ "\n!!!                    original argument: " ^ original_list_string ^ "\n!!!                    tree: " ^ actual_tree_string)
                end
        end

    val assertInsertAll_Int = assertInsertAll Repr.I Int.compare
    val assertInsertAll_String = assertInsertAll Repr.QUOTED_STRING String.compare

    fun remove_random compare_function (xs : ''a list, r : Random.rand) : (''a*(''a list)) = 
        let 
            val i = Random.randInt(r) mod List.length(xs)
            val x = List.nth(xs, i)
            val xs' = List.filter (fn v=> compare_function(v,x) <> EQUAL) xs
        in
            (x, xs')
        end

    fun shuffle compare_function (original_list : ''a list, r : Random.rand) : ''a list =
        let
            val input = ref original_list
            val output = ref []
            val _ = 
                while List.length(!input) > 0 do
                    let
                        val (v, input') = remove_random compare_function (!input, r)
                        val _ = output := (v :: !output)
                        val _ = input := input'
                    in
                        ()
                    end
        in
            !output
        end


    fun assertInsertAllInRandomOrder item_to_repr compare_function (original_list: ''a list, r : Random.rand) : unit = 
        let
            val input = ref original_list
            val output = ref []
        in
            while List.length(!input) > 0 do
                let
                    val (v, input') = remove_random compare_function (!input, r)
                    val _ = output := (v :: !output)
                    val _ = input := input'
                    val xs = !output
                in
                    assertInsertAll item_to_repr compare_function xs
                end 
        end

    fun assertInsertAllInRandomOrderRepeatedly item_to_repr compare_function (n : int, original_list: ''a list) : unit = 
        let
            val r = Random.rand(425, 231)
            val i = ref(0)
        in
            while !i < n do 
                let
                    val _ = print("\n    =========\n    iteration: "^ Int.toString(!i) ^ "; assertInsertAllInRandomOrderRepeatedly(" ^ Int.toString(n) ^ ", " ^ list_to_string(item_to_repr)(original_list) ^ ")\n    =========\n")
                    val _ = i := !i + 1
                in
                    assertInsertAllInRandomOrder item_to_repr compare_function (original_list, r)
                end
        end

    val assertInsertAllInRandomOrderRepeatedly_Int = assertInsertAllInRandomOrderRepeatedly Repr.I Int.compare
    val assertInsertAllInRandomOrderRepeatedly_String = assertInsertAllInRandomOrderRepeatedly Repr.QUOTED_STRING String.compare

    fun assertInsertAllInOrderFollowedByRemove item_to_repr compare_function (values: ''a list, value_to_remove : ''a) : unit = 
        let
            val original_tree = (insertAll compare_function values)
            val (actual_tree_post_remove,_) = BinarySearchTree.remove(original_tree, value_to_remove)
            val actual_values_post_remove = treeToList(actual_tree_post_remove)

            val values_post_remove = List.filter (fn v=> v<>value_to_remove) values
            val expected_values_post_remove = (ListMergeSort.uniqueSort compare_function values_post_remove)

            val item_list_to_string = list_to_string(item_to_repr)
        in
            if expected_values_post_remove = actual_values_post_remove
            then UnitTest.success("equals: " ^ item_list_to_string(expected_values_post_remove))
            else 
                let
                    val item_to_string = (Repr.toString o item_to_repr)
                    val original_tree_string = BinarySearchTree.debug_message(item_to_string, original_tree)
                    val actual_tree_string = BinarySearchTree.debug_message(item_to_string, actual_tree_post_remove)
                in
                    UnitTest.failure("expected: " ^ item_list_to_string(expected_values_post_remove) ^ "; actual: " ^ item_list_to_string(actual_values_post_remove) ^ "\n!!!                    assertInsertAllInOrderFollowedByRemove(" ^ item_list_to_string(values) ^ ", " ^ item_to_string(value_to_remove) ^ ")\n!!!                    original tree: " ^ original_tree_string ^ "\n!!!                    post remove tree: " ^ actual_tree_string)
                end
        end

    val assertInsertAllInOrderFollowedByRemove_Int = assertInsertAllInOrderFollowedByRemove Repr.I Int.compare
    val assertInsertAllInOrderFollowedByRemove_String = assertInsertAllInOrderFollowedByRemove Repr.QUOTED_STRING String.compare

    fun assertInsertAllInRandomOrderFollowedByRemoveEachInRandomOrder item_to_repr compare_function (original_list: ''a list, r : Random.rand) : unit = 
        let
            val shuffled_list = shuffle compare_function (original_list, r)
            val input = ref shuffled_list
            val output : ''a list ref = ref []
        in
            while List.length(!input) > 0 do
                let
                    val xs = !input
                    val (v, input') = remove_random compare_function (!input, r)
                    val _ = output := (v :: !output)
                    val _ = input := input'
                in
                    assertInsertAllInOrderFollowedByRemove item_to_repr compare_function (xs, v)
                end 
        end

    fun assertInsertAllInRandomOrderFollowedByRemoveEachInRandomOrderRepeatedly item_to_repr compare_function (n : int, original_list: ''a list) : unit = 
        let
            val r = Random.rand(425, 231)
            val i = ref(0)
        in
            while !i < n do 
                let
                    val _ = print("\n    =========\n    iteration: "^ Int.toString(!i) ^ "; assertInsertAllInRandomOrderFollowedByRemoveEachInRandomOrderRepeatedly(" ^ Int.toString(n) ^ ", " ^ list_to_string(item_to_repr)(original_list) ^ ")\n    =========\n")
                    val _ = i := !i + 1
                in
                    assertInsertAllInRandomOrderFollowedByRemoveEachInRandomOrder item_to_repr compare_function (original_list, r)
                end
        end

    val assertInsertAllInRandomOrderFollowedByRemoveEachInRandomOrderRepeatedly_Int = assertInsertAllInRandomOrderFollowedByRemoveEachInRandomOrderRepeatedly Repr.I Int.compare
    val assertInsertAllInRandomOrderFollowedByRemoveEachInRandomOrderRepeatedly_String = assertInsertAllInRandomOrderFollowedByRemoveEachInRandomOrderRepeatedly Repr.QUOTED_STRING String.compare


    fun assertInsertAllInOrderFollowedByFinds item_to_repr compare_function (values_to_insert: ''a list, missing_values_to_attempt_to_find : ''a list) : unit = 
        let
            val tree = (insertAll compare_function values_to_insert)

            val assertEquals_Option = UnitTest.assertEquals (Repr.toString o Repr.optToRepr item_to_repr)

            fun helper(values) =
                case values of
                  [] => ()
                | value::values' => 
                    let
                        val actual = BinarySearchTree.find(tree, value)
                        val is_expected = List.find (fn(x)=>x=value) values_to_insert
                        val expected = if isSome(is_expected) then SOME value else NONE
                        val _ = assertEquals_Option(expected, actual)
                    in
                        helper(values')
                    end
        in
            helper(values_to_insert @ missing_values_to_attempt_to_find)
        end

    val assertInsertAllInOrderFollowedByFinds_Int = assertInsertAllInOrderFollowedByFinds Repr.I Int.compare
    val assertInsertAllInOrderFollowedByFinds_String = assertInsertAllInOrderFollowedByFinds Repr.QUOTED_STRING String.compare


    fun assertInsertAllInRandomOrderFollowedByFindsEachInRandomOrderRepeatedly item_to_repr compare_function (n : int, original_list: ''a list, missing_values_to_attempt_to_find : ''a list) : unit = 
        let
            val r = Random.rand(425, 231)
            val i = ref(0)
        in
            while !i < n do 
                let
                    val _ = print("\n    =========\n    iteration: "^ Int.toString(!i) ^ "; assertInsertAllInOrderFollowedByFindsEachInRandomOrderRepeatedly(" ^ Int.toString(n) ^ ", " ^ list_to_string(item_to_repr)(original_list) ^ ")\n    =========\n")
                    val _ = i := !i + 1
                    val shuffled_present_list = shuffle compare_function (original_list, r)
                    val shuffled_missing_list = shuffle compare_function (missing_values_to_attempt_to_find, r)
                in
                    assertInsertAllInOrderFollowedByFinds item_to_repr compare_function (shuffled_present_list, shuffled_missing_list)
                end
        end

    val assertInsertAllInRandomOrderFollowedByFindsEachInRandomOrderRepeatedly_Int = assertInsertAllInRandomOrderFollowedByFindsEachInRandomOrderRepeatedly Repr.I Int.compare
    val assertInsertAllInRandomOrderFollowedByFindsEachInRandomOrderRepeatedly_String = assertInsertAllInRandomOrderFollowedByFindsEachInRandomOrderRepeatedly Repr.QUOTED_STRING String.compare
end
