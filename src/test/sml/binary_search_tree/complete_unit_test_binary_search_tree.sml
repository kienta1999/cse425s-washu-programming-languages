(* Dennis Cosgrove *)
structure CompleteUnitTestBinarySearchTree :> sig
    val test_complete : bool -> unit
end = struct
    open UnitTest
    open BinarySearchTree
    open CoreUnitTestBinarySearchTree

    val assertEquals_String_StringList_List = assertEquals (Repr.toString o Repr.listToRepr (Repr.t2ToRepr Repr.S (Repr.listToRepr Repr.S)))
    val assertEquals_String_StringList_Option = assertEquals (Repr.toString o Repr.optToRepr (Repr.t2ToRepr Repr.S (Repr.listToRepr Repr.S)))

    type name_office_hours_pair = (string * (string list))

    fun bst_to_list(bst) = 
        BinarySearchTree.fold_rnl(List.::, [], bst)

    fun bst_to_reverse_list(bst) = 
        BinarySearchTree.fold_lnr(List.::, [], bst)

    val mau = ("Mau", ["Friday 10am-noon", "Saturday noon-3pm"])
    val york = ("York", ["Monday 3:30pm-6:00pm", "Saturday 9am-noon"])
    val justin = ("Justin", ["Monday 2pm-3:30pm", "Wednesday 2pm-3:30pm"])
    val yana = ("Yana", ["Tuesday 11:15am-12:15pm"])
    val dennis = ("Dennis", ["Monday 8pm-9:30pm", "Wednesday 8pm-9:30pm", "Friday 8pm-9:30pm"])
    val ethan_original = ("Ethan", ["Monday 10am-11:30am", "Wednesday 10am-11:30am"])
    val ethan_updated = (#1 ethan_original, ["Monday noon-1:30pm", "Wednesday noon-1:30pm"])

    fun test_create_insert_and_fold_rnl() =
        let
            val _ = enter("create_insert_and_fold_rnl")
            val oht = BinarySearchTree.create_empty(String.compare, (fn(name,_:string list)=>name))

            val _ = assertEquals_String_StringList_List([], bst_to_list(oht))

            val (oht, prev_should_be_none) = BinarySearchTree.insert(oht, mau)
            val _ = assertEquals_String_StringList_List([mau], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(NONE, prev_should_be_none)

            val (oht, prev_should_be_none) = BinarySearchTree.insert(oht, york)
            val _ = assertEquals_String_StringList_List([mau, york], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(NONE, prev_should_be_none)

            val (oht, prev_should_be_none) = BinarySearchTree.insert(oht, justin)
            val _ = assertEquals_String_StringList_List([justin, mau, york], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(NONE, prev_should_be_none)

            val (oht, prev_should_be_none) = BinarySearchTree.insert(oht, yana)
            val _ = assertEquals_String_StringList_List([justin, mau, yana, york], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(NONE, prev_should_be_none)

            val (oht, prev_should_be_none) = BinarySearchTree.insert(oht, ethan_original)
            val _ = assertEquals_String_StringList_List([ethan_original, justin, mau, yana, york], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(NONE, prev_should_be_none)

            val (oht, prev_should_be_none) = BinarySearchTree.insert(oht, dennis)
            val _ = assertEquals_String_StringList_List([dennis, ethan_original, justin, mau, yana, york], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(NONE, prev_should_be_none)

            val (oht, prev_should_be_ethan_original) = BinarySearchTree.insert(oht, ethan_updated)
            val _ = assertEquals_String_StringList_List([dennis, ethan_updated, justin, mau, yana, york], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(SOME(ethan_original), prev_should_be_ethan_original)

            val _ = leave()
        in
            oht
        end

    fun test_find(oht) =
        ( enter("find")

        (* assert expected state of tree *)
        ; assertEquals_String_StringList_List([dennis, ethan_updated, justin, mau, yana, york], bst_to_list(oht))

        ; assertEquals_String_StringList_Option(NONE, BinarySearchTree.find(oht, "not.a.key"))

        ; assertEquals_String_StringList_Option(SOME(york), BinarySearchTree.find(oht, #1 york))
        ; assertEquals_String_StringList_Option(SOME(yana), BinarySearchTree.find(oht, #1 yana))
        ; assertEquals_String_StringList_Option(SOME(ethan_updated), BinarySearchTree.find(oht, #1 ethan_updated))
        ; assertEquals_String_StringList_Option(SOME(mau), BinarySearchTree.find(oht, #1 mau))
        ; assertEquals_String_StringList_Option(SOME(dennis), BinarySearchTree.find(oht, #1 dennis))
        ; assertEquals_String_StringList_Option(SOME(justin), BinarySearchTree.find(oht, #1 justin))

        (* assert find does not mutate *)
        ; assertEquals_String_StringList_List([dennis, ethan_updated, justin, mau, yana, york], bst_to_list(oht))

        ; leave() )

    fun test_fold_lnr(oht) =
        ( enter("fold_lnr")
        (* assert expected state of tree *)
        ; assertEquals_String_StringList_List([dennis, ethan_updated, justin, mau, yana, york], bst_to_list(oht))
        (* assert fold_lnr works via bst_to_reverse_list *)
        ; assertEquals_String_StringList_List([york, yana, mau, justin, ethan_updated, dennis], bst_to_reverse_list(oht))
        ; leave() )

    fun test_remove(oht) =
        let
            val _ = enter("remove")
            
            (* assert expected state of tree *)
            val _ = assertEquals_String_StringList_List([dennis, ethan_updated, justin, mau, yana, york], bst_to_list(oht))

            val (oht, prev_should_none) = BinarySearchTree.remove(oht, "not.a.key")
            val _ = assertEquals_String_StringList_List([dennis, ethan_updated, justin, mau, yana, york], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(NONE, prev_should_none)

            val (oht, prev) = BinarySearchTree.remove(oht, (#1 yana))
            val _ = assertEquals_String_StringList_List([dennis, ethan_updated, justin, mau, york], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(SOME(yana), prev)
            val (oht, prev) = BinarySearchTree.remove(oht, (#1 yana))
            val _ = assertEquals_String_StringList_List([dennis, ethan_updated, justin, mau, york], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(NONE, prev)

            val (oht, prev) = BinarySearchTree.remove(oht, (#1 ethan_updated))
            val _ = assertEquals_String_StringList_List([dennis, justin, mau, york], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(SOME(ethan_updated), prev)
            val (oht, prev) = BinarySearchTree.remove(oht, (#1 ethan_updated))
            val _ = assertEquals_String_StringList_List([dennis, justin, mau, york], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(NONE, prev)

            val (oht, prev) = BinarySearchTree.remove(oht, (#1 dennis))
            val _ = assertEquals_String_StringList_List([justin, mau, york], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(SOME(dennis), prev)
            val (oht, prev) = BinarySearchTree.remove(oht, (#1 dennis))
            val _ = assertEquals_String_StringList_List([justin, mau, york], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(NONE, prev)

            val (oht, prev) = BinarySearchTree.remove(oht, (#1 mau))
            val _ = assertEquals_String_StringList_List([justin, york], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(SOME(mau), prev)
            val (oht, prev) = BinarySearchTree.remove(oht, (#1 mau))
            val _ = assertEquals_String_StringList_List([justin, york], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(NONE, prev)

            val (oht, prev) = BinarySearchTree.remove(oht, (#1 york))
            val _ = assertEquals_String_StringList_List([justin], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(SOME(york), prev)
            val (oht, prev) = BinarySearchTree.remove(oht, (#1 york))
            val _ = assertEquals_String_StringList_List([justin], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(NONE, prev)

            val (oht, prev) = BinarySearchTree.remove(oht, (#1 justin))
            val _ = assertEquals_String_StringList_List([], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(SOME(justin), prev)
            val (oht, prev) = BinarySearchTree.remove(oht, (#1 justin))
            val _ = assertEquals_String_StringList_List([], bst_to_list(oht))
            val _ = assertEquals_String_StringList_Option(NONE, prev)

            val _ = leave()
        in
            ()
        end

    fun test_insert_comprehensive() =
        ( enter("insert (more comprehensive)")
        (* NOTE: assertInsertAll relies on uniqueSort <<<*)
        ; assertInsertAll_Int([])
        ; assertInsertAll_Int([425])
        ; assertInsertAll_Int([231, 425])
        ; assertInsertAll_Int([425, 231])
        ; assertInsertAll_Int([131, 231, 425])
        ; assertInsertAll_Int([231, 131, 425])
        ; assertInsertAll_Int([425, 231, 131])
        ; assertInsertAll_Int([42, 425, 231, 131])
        ; assertInsertAll_Int([425, 131, 231, 42, 9, 6, 12, 4, 20, 7])
        ; assertInsertAll_String(["truth", "is", "beauty"])
        ; assertInsertAll_String(["four", "score", "and", "seven", "years", "ago"])

        ; assertInsertAllInRandomOrderRepeatedly_Int(11, [0,1,2,3,4,5,6,7,8,9])
        ; assertInsertAllInRandomOrderRepeatedly_String(11, ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"])
        ; leave()
        )

    fun test_find_comprehensive() =
            ( enter("find (more comprehensive)")
            ; assertInsertAllInOrderFollowedByFinds_String( ["F","B","A","D","C","E","G","I","H"], ["J", "K", "L"])
            ; assertInsertAllInRandomOrderFollowedByFindsEachInRandomOrderRepeatedly_Int(11, [0,1,4,6,8,9], [2,3,5,7])
            ; assertInsertAllInRandomOrderFollowedByFindsEachInRandomOrderRepeatedly_String(11, ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"], ["a", "e", "i", "o", "u"])
            ; leave()
            )

    fun test_remove_comprehensive() =
        ( enter("remove (more comprehensive)")
        (* NOTE: assertInsertAll relies on uniqueSort <<<*)
        ; assertInsertAllInOrderFollowedByRemove_Int( [2,1,3], 3)
        ; assertInsertAllInOrderFollowedByRemove_Int( [2,1,3], 1)
        ; assertInsertAllInOrderFollowedByRemove_Int( [2,1,3], 2)

        ; assertInsertAllInOrderFollowedByRemove_String( ["F","B","A","D","C","E","G","I","H"], "A")
        ; assertInsertAllInOrderFollowedByRemove_String( ["F","B","A","D","C","E","G","I","H"], "C")
        ; assertInsertAllInOrderFollowedByRemove_String( ["F","B","A","D","C","E","G","I","H"], "E")
        ; assertInsertAllInOrderFollowedByRemove_String( ["F","B","A","D","C","E","G","I","H"], "H")
        ; assertInsertAllInOrderFollowedByRemove_String( ["F","B","A","D","C","E","G","I","H"], "I")
        ; assertInsertAllInOrderFollowedByRemove_String( ["F","B","A","D","C","E","G","I","H"], "G")
        ; assertInsertAllInOrderFollowedByRemove_String( ["F","B","A","D","C","E","G","I","H"], "D")
        ; assertInsertAllInOrderFollowedByRemove_String( ["F","B","A","D","C","E","G","I","H"], "B")
        ; assertInsertAllInOrderFollowedByRemove_String( ["F","B","A","D","C","E","G","I","H"], "F")

        ; assertInsertAllInRandomOrderFollowedByRemoveEachInRandomOrderRepeatedly_Int(11, [0,1,2,3,4,5,6,7,8,9])
        ; assertInsertAllInRandomOrderFollowedByRemoveEachInRandomOrderRepeatedly_String(11, ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"])
        ; leave()
        )

    fun test_complete(is_remove_desired) =
        let
            val oht = test_create_insert_and_fold_rnl()
        in
            ( test_find(oht)
            ; test_fold_lnr(oht)
            ; if is_remove_desired
              then test_remove(oht) 
              else ()
            ; test_insert_comprehensive()
            ; test_find_comprehensive()
            ; if is_remove_desired
              then test_remove_comprehensive()
              else () )
        end
end
