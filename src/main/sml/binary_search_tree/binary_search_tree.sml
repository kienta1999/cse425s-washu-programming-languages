(* Kien Ta *)
(* Dennis Cosgrove *)

structure BinarySearchTree :> BINARY_SEARCH_TREE = struct
	type 'k compare_function = (('k * 'k) -> order)
	type ('a,'k) to_key_function = 'a -> 'k

	
	(* TODO: replace unit with the datatype(s) and/or type synonym(s) you decide upon *)
	datatype ('a,'k) tree = Tree of {
        cmp: 'k compare_function,
        to_key: ('a,'k) to_key_function,
        value: 'a option,
        left: ('a,'k) tree option,
        right: ('a,'k) tree option
    }
	
    (* helpers *)
    fun get_tree(t) =
        case t of
           Tree(t) => t

    fun has_value(t) =
        case t of
           NONE => false
         | SOME t =>
            let
                val t = get_tree(t)
            in
                isSome(#value t)
            end
    (* main method *)
	fun create_empty(cmp : 'k compare_function, to_key : ('a,'k) to_key_function) : ('a,'k) tree =
         Tree({cmp = cmp, to_key = to_key, value = NONE, left = NONE, right = NONE})

	fun insert(t:('a,'k) tree, item:'a) : (('a,'k) tree * 'a option) =
        let
          val {cmp=cmp, to_key=to_key, value=value, left=left, right=right} = get_tree(t)
        in
          case value of
             NONE => (Tree({cmp=cmp, to_key=to_key, value=SOME(item), left=left, right=right}), NONE)
           | SOME value => 
                let
                    val key = to_key(value)
                    val key_new_item = to_key(item)
                in
                    case cmp(key_new_item, key) of
                            LESS => let
                                        val left = case left of
                                                    NONE => create_empty(cmp, to_key)
                                                    | SOME left => left
                                        val (new_left, replaced) = insert(left, item)
                                        val new_tree = Tree({cmp=cmp, to_key=to_key, value=SOME(value), left=SOME(new_left), right=right})
                                    in
                                        (new_tree, replaced)
                                    end
                            | GREATER => let
                                            val right = case right of
                                                        NONE => create_empty(cmp, to_key)
                                                        | SOME right => right
                                            val (new_right, replaced) = insert(right, item)
                                            val new_tree = Tree({cmp=cmp, to_key=to_key, value=SOME(value), left=left, right=SOME(new_right)})
                                        in
                                            (new_tree, replaced)
                                        end
                            | EQUAL => (Tree({cmp=cmp, to_key=to_key, value=SOME(item), left=left, right=right}), SOME(value))
                end
                            
        end

    fun get_left_most_value(t:('a,'k) tree option) =
        let
            val t = get_tree(valOf(t))
            val left = #left t
        in
            if has_value(left)
            then get_left_most_value(left)
            else valOf(#value t)
        end

	fun remove(t:('a,'k) tree, item_key:'k) : (('a,'k) tree * 'a option) =
			let
                val {cmp=cmp, to_key=to_key, value=value, left=left, right=right} = get_tree(t)
            in
            case value of
                NONE => (t, NONE)
                | SOME value => 
                    case cmp(item_key, to_key(value)) of
                                LESS => 
                                        (case left of
                                            NONE => (t, NONE)
                                            | SOME left =>
                                                let
                                                    val (new_left, removed) = remove(left, item_key)
                                                    val new_tree = Tree({cmp=cmp, to_key=to_key, value=SOME(value), left=SOME(new_left), right=right})
                                                in
                                                    (new_tree, removed)
                                                end)
                                | GREATER => 
                                            (case right of
                                                NONE => (t, NONE)
                                                | SOME right =>
                                                    let
                                                        val (new_right, removed) = remove(right, item_key)
                                                        val new_tree = Tree({cmp=cmp, to_key=to_key, value=SOME(value), left=left, right=SOME(new_right)})
                                                    in
                                                        (new_tree, removed)
                                                    end)
                                | EQUAL =>  if has_value(left) andalso has_value(right)
                                            then 
                                                let
                                                    val left_most_value = get_left_most_value(right)
                                                    val (new_right, _) = remove(valOf(right), to_key(left_most_value))
                                                in
                                                    (* (t, NONE) *)
                                                    (Tree({cmp=cmp, to_key=to_key, value=SOME(left_most_value), left=left, right=SOME(new_right)}), SOME(value))
                                                end
                                            else if has_value(left) andalso not(has_value(right))
                                            then (valOf(left), SOME(value))
                                            else if not(has_value(left)) andalso has_value(right)
                                            then (valOf(right), SOME(value))
                                            else (create_empty(cmp, to_key), SOME(value))
                end


	fun find(t:('a,'k) tree, item_key:'k) : 'a option = 
			let
                val {cmp=cmp, to_key=to_key, value=value, left=left, right=right} = get_tree(t)
            in
            case value of
                NONE => NONE
                | SOME value => 
                      case cmp(item_key, to_key(value)) of
                                LESS => 
                                    (case left of
                                       NONE => NONE
                                     | SOME left => find(left, item_key))
                                | GREATER =>
                                    (case right of
                                       NONE => NONE
                                     | SOME right => find(right, item_key))
                                | EQUAL =>  SOME(value)
            end

	

	(*
	 * depth-first, in-order traversal
	 * https://en.wikipedia.org/wiki/Tree_traversal#In-order_(LNR)
	 *)
	fun fold_lnr(f, init, t) = 
        let
          val {cmp=cmp, to_key=to_key, value=value, left=left, right=right} = get_tree(t)
        in
          case value of
             NONE => init
           | SOME value =>
                let

                    val ln_fold = f(value, case left of
                                            NONE => init
                                            | SOME left => fold_lnr(f, init, left))
                    
                in
                    case right of
                       NONE => ln_fold
                     | SOME right => fold_lnr(f, ln_fold, right)
                end
        end

	(*
	 * depth-first, reverse in-order traversal
	 * https://en.wikipedia.org/wiki/Tree_traversal#Reverse_in-order_(RNL)
	 *)
	fun fold_rnl(f, init, t) = 
        let
          val {cmp=cmp, to_key=to_key, value=value, left=left, right=right} = get_tree(t)
        in
          case value of
             NONE => init
           | SOME value =>
                let
                    val rn_fold = f(value, case right of
                                            NONE => init
                                            | SOME right => fold_rnl(f, init, right))
                    
                in
                    case left of
                       NONE => rn_fold
                     | SOME left => fold_rnl(f, rn_fold, left)
                end
        end

	fun debug_message(value_to_string, t) =
			"(Optional) TODO: BinarySearchTree.debug_message"

	fun to_graphviz_dot(value_to_string, t) =
		let
			fun node_to_dot(value) =
				"\t" ^ value_to_string(value) ^ " [label= \"{ " ^ value_to_string(value) ^ " | { <child_left> | <child_right> } }\"]"

			fun edge_to_dot(parent_value_opt, tag, value) = 
				case parent_value_opt of
				  NONE => ""
				| SOME(parent_value) => "\t" ^ value_to_string(parent_value) ^ tag ^ " -> " ^ value_to_string(value)

			fun nodes_to_dot(bst) =
					raise Fail("NotYetImplemented")

			fun edges_to_dot(bst, parent_value_opt, tag) =
					raise Fail("NotYetImplemented")

			
			(* TODO: bind root *)
			val root = raise Fail("NotYetImplemented")
			
		in
			"digraph g {\n\n\tnode [\n\t\tshape = record\n\t]\n\n\tedge [\n\t\ttailclip=false,\n\t\tarrowhead=vee,\n\t\tarrowtail=dot,\n\t\tdir=both\n\t]\n\n" ^ nodes_to_dot(root) ^ edges_to_dot(root, NONE, "") ^ "\n}\n"
		end

end (* struct *) 
