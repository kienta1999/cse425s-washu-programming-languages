structure CellTest = EqualityTestFn (struct
	open Spreadsheet
	type t = cell
	val toString = fn(c)=> 
        case c of 
             EMPTY => "EMPTY"
        |  TEXT(s) => "TEXT(\"" ^ s ^ "\")"
        | VALUE(v) => "VALUE(" ^ Int.toString(v) ^ ")"
	val compare = fn(a,b)=>raise Fail "unsupported"
end)
