signature REPR = sig
    datatype repr
        = B of bool
        | C of char
        | I of int
        | LIST of repr list
        | OPT of repr option
        | QUOTED_STRING of string        
        | R of real
        | REF of repr ref
        | S of string
        | T2 of repr * repr
        | T3 of repr * repr * repr
        | T4 of repr * repr * repr * repr

    val toString : repr -> string
    val optToRepr : ('a -> repr) -> 'a option -> repr
    val listToRepr : ('a -> repr) -> 'a list -> repr
    val t2ToRepr : ('a -> repr) -> ('b -> repr) -> 'a * 'b -> repr
    val t3ToRepr : ('a -> repr) -> ('b -> repr) -> ('c -> repr) -> 'a * 'b * 'c -> repr
    val t4ToRepr : ('a -> repr) -> ('b -> repr) -> ('c -> repr) -> ('d -> repr) -> 'a * 'b * 'c * 'd -> repr
    val refToRepr : ('a -> repr) -> 'a ref -> repr
end
