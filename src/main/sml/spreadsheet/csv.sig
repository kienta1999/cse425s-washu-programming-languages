(* Dennis Cosgrove *)
signature COMMA_SEPARATED_VALUE = sig
    val read_csv : string -> string list list
end
