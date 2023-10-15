structure StringIntEntryTest = EqualityTestFn (struct
	type t = String.string * Int.int
	val toString = fn (text, n)=> "(\"" ^ text ^ "\", " ^ Int.toString(n) ^ ")"
	val compare = fn((ak,_),(bk,_)) => String.compare(ak,bk)
end)
