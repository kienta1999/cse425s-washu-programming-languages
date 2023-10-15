structure StringTest = EqualityTestFn (struct
	type t = String.string
	val toString = fn (s)=> "\"" ^ s ^ "\""
	val compare = String.compare
end)
