(* Kien Ta *)

(* map, foldl, and foldr made the cut for the top level environment. *)
(* filter and find did not *)
(* https://smlfamily.github.io/Basis/top-level-chapter.html *)

val map_function = map
val filter_function_requires_list_module = filter (* requires List.filter *)
val fold_left_function = foldl
val fold_right_function = foldr
val find_function_requires_list_module = find (* requires List.find *)


val list_map_function_also_works = List.map
val list_foldl_function_also_works = List.foldl
val list_foldr_function_also_works = List.foldr
