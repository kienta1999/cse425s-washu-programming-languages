(* Dennis Cosgrove *)
CM.make "../../../main/sml/binary_search_tree/binary_search_tree.cm";

val identity = fn(s)=>s

fun bst_to_graphviz_dot(t) = 
	BinarySearchTree.to_graphviz_dot(identity, t)

fun bst_debug_message(t) = 
	BinarySearchTree.debug_message(identity, t)

type 'a simple_tree = ('a,'a) BinarySearchTree.tree

fun create_empty_simple_tree(compare_function) =
	BinarySearchTree.create_empty(compare_function, fn(v)=>v)

val bst = create_empty_simple_tree(String.compare)
val (bst,_) = BinarySearchTree.insert(bst, "f")
val (bst,_) = BinarySearchTree.insert(bst, "b")
val (bst,_) = BinarySearchTree.insert(bst, "g")
val (bst,_) = BinarySearchTree.insert(bst, "a")
val (bst,_) = BinarySearchTree.insert(bst, "d")
val (bst,_) = BinarySearchTree.insert(bst, "i")
val (bst,_) = BinarySearchTree.insert(bst, "c")
val (bst,_) = BinarySearchTree.insert(bst, "e")
val (bst,_) = BinarySearchTree.insert(bst, "h")

val dot = bst_to_graphviz_dot(bst)
val _ = print(bst_to_graphviz_dot(bst))

val debug_message = bst_debug_message(bst)
val _ = print(debug_message ^ "\n")

val path_opt = NONE
val path_opt = SOME("debug.dot")
val _ = case path_opt of
		  NONE => ()
		| SOME(path) => 
            let 
                val ostream = TextIO.openOut path
                val _ = TextIO.output (ostream, dot) handle e => (TextIO.closeOut ostream; raise e)
                val _ = TextIO.closeOut ostream
            in 
                ()
            end

val is_exit_desired = true
val _ = if is_exit_desired 
		then OS.Process.exit(OS.Process.success)
		else ()
