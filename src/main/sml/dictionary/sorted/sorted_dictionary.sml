(* Kien Ta *)

structure SortedDictionary :> SORTED_DICTIONARY = struct
    type ''k compare_function = (''k*''k) -> order

	structure TypeHolder = struct
		
		(* TODO: replace unit with the type you decide upon *)
		type (''k,'v) dictionary = ((''k*'v), ''k) BinarySearchTree.tree ref
		
	end

	structure SortedHasEntries = HasEntriesFn (struct
		type (''k,'v) dictionary = (''k,'v) TypeHolder.dictionary

		fun entries(dict : (''k,'v) dictionary) : (''k*'v) list =
			BinarySearchTree.fold_rnl(List.::, [], !dict)
	end)

	open SortedHasEntries

    fun create(cmp : ''k compare_function) : (''k,'v) dictionary = 
        ref (BinarySearchTree.create_empty(cmp, (fn(key, value) => key)))

    fun get(dict : (''k,'v) dictionary, key:''k) : 'v option =
        case BinarySearchTree.find(!dict, key) of
             NONE => NONE
           | SOME(key, value) => SOME(value)

    fun put(dict : (''k,'v) dictionary, key:''k, value:'v) : 'v option =
        let
          val (new_tree, option_val) = BinarySearchTree.insert(!dict, (key, value))
          val _ = dict := new_tree
        in
          case option_val of
             NONE => NONE
           | SOME(key, value) => SOME(value)
        end

    fun remove(dict : (''k,'v) dictionary, key : ''k) : 'v option =
        let
          val (new_tree, option_val) = BinarySearchTree.remove(!dict, key)
          val _ = dict := new_tree
        in
          case option_val of
             NONE => NONE
           | SOME(key, value) => SOME(value)
        end

end (* struct *) 
