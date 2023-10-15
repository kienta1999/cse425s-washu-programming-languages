CM.make "../../../core/sml/repr/repr.cm";

val name = "fred"
(* https://smlfamily.github.io/Basis/string.html#SIG:STRING.sub:VAL *)
val f = String.sub(name, 0)
val r = String.sub(name, 1)
val e = String.sub(name, 2)
val d = String.sub(name, 3)


(* TODO *)
(* https://smlfamily.github.io/Basis/list.html *)


(* syntax for character literal *)
val letter_h = #"h"

(* TODO *)
val starts_with_h = ()



val names = ["fred", "george", "ron", "hermione", "neville", "luna", "harry", "ginny", "hagrid"]
val expected = ["hermione", "harry", "hagrid"]
val actual = starts_with_h names

val result = 
    if expected = actual
    then "correct"
    else 
        let
            val string_list_to_string = Repr.toString o Repr.listToRepr Repr.S
        in
            raise Fail("\n\nFAILURE: starts_with_h " ^ string_list_to_string(names) ^ "\n\nexpected: " ^ string_list_to_string(expected) ^ "\n  actual: " ^ string_list_to_string(actual) ^ "\n\n")
        end