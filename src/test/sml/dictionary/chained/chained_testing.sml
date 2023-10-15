(* Dennis Cosgrove *)
structure ChainedTesting : sig
	val test_single_chain_if_desired : unit -> unit (* TODO: remove dependency in spreadsheet *)
	val test_chained : unit -> unit
end = struct
	val is_remove_testing_desired = CommandLineArgs.getBoolOrDefault("remove", true)
	val is_single_list_testing_desired = CommandLineArgs.getBoolOrDefault("single_list", true)
	val is_hashed_testing_desired = CommandLineArgs.getBoolOrDefault("hashed", true)

	fun test_single_chain_if_desired() =
		if is_single_list_testing_desired 
		then SingleChainedDictionaryTesting.test_dictionary(false, is_remove_testing_desired, "SingleChainedDictionary", fn()=>(SingleChainedDictionary.create()))
		else ()

	fun test_hashed_if_desired() =
		let
			fun string_hash(x : string) = 
				let
					val w = HashString.hashString(x)
				in
					Word.toInt(
						case Int.maxInt of
							NONE => w
						| SOME(max_int) => Word.mod(w, Word.fromInt(max_int))
					)
				end
			(*
			fun pessimal_hash(x : 'a) : int = 0 
			*)

			fun test(bucket_count) =
				HashedDictionaryTesting.test_dictionary(false, is_remove_testing_desired, "HashedDictionary bucket_count="^Int.toString(bucket_count), fn()=>(HashedDictionary.create(bucket_count, string_hash)))
		in
			if is_hashed_testing_desired 
			then 
				( test(1)
				; test(2)
				; test(16)
				)
			else ()
		end

	fun test_chained() =
        ( test_single_chain_if_desired() 
        ; test_hashed_if_desired()
		)

end
