(* Dennis Cosgrove *)

signature BINARY_SEARCH_TREE = sig
    type 'k compare_function = (('k * 'k) -> order)
    type ('a,'k) to_key_function = 'a -> 'k

    type ('a,'k) tree;

    val create_empty : ('k compare_function * ('a,'k) to_key_function) -> ('a,'k) tree

    val insert : (('a,'k) tree * 'a) -> (('a,'k) tree * 'a option)
    val remove : (('a,'k) tree * 'k) -> (('a,'k) tree * 'a option)
    val find : (('a,'k) tree * 'k) -> 'a option

    val fold_lnr : ((('a * 'b) -> 'b) * ('b) * (('a,'k) tree)) -> 'b 
    val fold_rnl : ((('a * 'b) -> 'b) * ('b) * (('a,'k) tree)) -> 'b 
    
    val debug_message : (('a -> string) * (('a,'k) tree)) -> string
    val to_graphviz_dot : (('a -> string) * (('a,'k) tree)) -> string
end
