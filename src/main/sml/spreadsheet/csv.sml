(* Kien Ta *)
(* Dennis Cosgrove *)
structure Csv :> COMMA_SEPARATED_VALUE = struct
    fun is_new_line(c : char) : bool =
        c = #"\n"

    fun is_comma(c : char) : bool =
        c = #","

    fun read_csv(csv:string) : string list list =
        List.map (fn row => String.fields is_comma row) (String.fields is_new_line csv)
end
