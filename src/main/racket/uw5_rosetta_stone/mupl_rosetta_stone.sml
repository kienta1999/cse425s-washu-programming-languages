(* Dennis Cosgrove *)

val int_example = 425
val ifgreater_example = if 425 > 231 then 42 else 7

val apair_example = (425, 231)
val fst_example = #1 (425, 231)
val snd_example = #2 (425, 231)

val aunit_example = nil
val isaunit_example = null

val mupl_evalulates_to_1_instead_of_true = null(nil)
val mupl_evalulates_to_0_instead_of_false = null(["not empty"])

val mlet_example = 
	let
		val a = 425
	in
		a + 231
	end

val mlet_apair_example = 
	let
		val pr = (425, 231)
	in
		#1 pr + #2 pr
	end

val nested_mlets_example = 
	let
		val a = 425
	in
		let
			val b = 231
		in
			a + b
		end
	end