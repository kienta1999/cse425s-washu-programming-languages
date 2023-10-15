structure IntTest = EqualityTestFn (struct
	type t = Int.int
	val toString = Int.toString
	val compare = Int.compare
end)
