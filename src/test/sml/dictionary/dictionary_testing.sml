functor DictionaryTestingFn (Dictionary : DICTIONARY) : sig
	val test_dictionary : (bool * bool * string * (unit -> (string, int) Dictionary.dictionary)) -> unit
end = struct
	open Dictionary

    fun test_string_to_int_single_key(is_remove_desired : bool, test_enter_prefix, dict, k) =
        ( UnitTesting.enter(test_enter_prefix ^ " single_key " ^ k)
            ; IntTest.assertOptionEquals(NONE, get(dict, k))
            ; IntTest.assertOptionEquals(NONE, put(dict, k, 2))
            ; IntTest.assertOptionEquals(SOME 2, get(dict, k))
            ; if is_remove_desired
              then ( IntTest.assertOptionEquals(SOME 2, remove(dict, k))
                   ; IntTest.assertOptionEquals(NONE, get(dict, k))
                   ; IntTest.assertOptionEquals(NONE,  put(dict, k, 3)))
              else IntTest.assertOptionEquals(SOME 2,  put(dict, k, 3))
            ; IntTest.assertOptionEquals(SOME 3, get(dict, k))
            ; IntTest.assertOptionEquals(SOME 3, put(dict, k, 4))
            ; IntTest.assertOptionEquals(SOME 4, get(dict, k))
            ; IntTest.assertOptionEquals(SOME 4, put(dict, k, 5))
            ; IntTest.assertOptionEquals(SOME 5, get(dict, k))

            ; StringIntEntryTest.assertListEquals([(k,5)], entries(dict))
            ; StringTest.assertListEquals([k], keys(dict))
            ; IntTest.assertListEquals([5], values(dict))

            ; if is_remove_desired
              then 
                ( IntTest.assertOptionEquals(SOME 5, remove(dict, k))
                ; IntTest.assertOptionEquals(NONE, get(dict, k))

                ; StringIntEntryTest.assertListEquals([], entries(dict))
                ; StringTest.assertListEquals([], keys(dict))
                ; IntTest.assertListEquals([], values(dict)))
              else ()
        ; UnitTesting.leave() )

	fun test_entries_of strictness dict expected_entries =
		let
			val to_key = fn(k,_)=>k
			val to_value = fn(_,v)=>v
			val expected_keys = List.map to_key expected_entries
			val expected_values = List.map to_value expected_entries
			val value_strictness = if strictness = UnitTesting.ANY_ORDER then UnitTesting.ANY_ORDER else UnitTesting.EXACT_MATCH
		in
			( StringIntEntryTest.assertListEqualsWithMessageAndStrictnessLevel(expected_entries, entries(dict), "entries(dict)", strictness)
			; StringTest.assertListEqualsWithMessageAndStrictnessLevel(expected_keys, keys(dict), "keys(dict)", strictness)
			; IntTest.assertListEqualsWithMessageAndStrictnessLevel(expected_values, values(dict), "values(dict)", value_strictness)
			)
		end

    fun test_string_to_int_multiple_keys(strictness : UnitTesting.list_strictness_level, is_remove_desired : bool, test_enter_prefix : string, dict : (string,int) Dictionary.dictionary) : unit =
		let
			val test_entries = test_entries_of strictness dict
		in
			( UnitTesting.enter(test_enter_prefix ^ " multiple_keys")

				(* TODO: check the order requirement to better support sorted dictionary *)

				; IntTest.assertOptionEquals(NONE, put(dict, "Ted", 9))
				; IntTest.assertOptionEquals(SOME 9, get(dict, "Ted"))
				; test_entries([("Ted", 9)])

				; IntTest.assertOptionEquals(NONE, put(dict, "Jackie", 42))
				; IntTest.assertOptionEquals(SOME 42, get(dict, "Jackie"))
				; test_entries([("Jackie", 42), ("Ted", 9)])

				; IntTest.assertOptionEquals(NONE, put(dict, "Bobby", 4))
				; IntTest.assertOptionEquals(SOME 4, get(dict, "Bobby"))
				; test_entries([("Bobby", 4), ("Jackie", 42), ("Ted", 9)])

				; IntTest.assertOptionEquals(NONE, put(dict, "Bill", 6))
				; IntTest.assertOptionEquals(SOME 6, get(dict, "Bill"))
				; test_entries([("Bill", 6), ("Bobby", 4), ("Jackie", 42), ("Ted", 9)])

				; IntTest.assertOptionEquals(NONE, put(dict, "Michael", 23))
				; IntTest.assertOptionEquals(SOME 23, get(dict, "Michael"))
				; test_entries([("Bill", 6), ("Bobby", 4), ("Jackie", 42), ("Michael", 23), ("Ted", 9)])

				; if is_remove_desired
				then 
					( IntTest.assertOptionEquals(SOME 23, remove(dict, "Michael"))
					; IntTest.assertOptionEquals(NONE, get(dict, "Michael"))
					; test_entries([("Bill", 6), ("Bobby", 4), ("Jackie", 42), ("Ted", 9)])
					
					; IntTest.assertOptionEquals(NONE, remove(dict, "Michael"))
					; IntTest.assertOptionEquals(NONE, get(dict, "Michael"))
					; test_entries([("Bill", 6), ("Bobby", 4), ("Jackie", 42), ("Ted", 9)])

					; IntTest.assertOptionEquals(NONE, put(dict, "Michael", 45))
					)
				else IntTest.assertOptionEquals(SOME 23, put(dict, "Michael", 45))

				; IntTest.assertOptionEquals(SOME 45, get(dict, "Michael"))
				; test_entries([("Bill", 6), ("Bobby", 4), ("Jackie", 42), ("Michael", 45), ("Ted", 9)])

				; IntTest.assertOptionEquals(SOME 45, put(dict, "Michael", 23))
				; IntTest.assertOptionEquals(SOME 23, get(dict, "Michael"))
				; test_entries([("Bill", 6), ("Bobby", 4), ("Jackie", 42), ("Michael", 23), ("Ted", 9)])

				; IntTest.assertOptionEquals(NONE, get(dict, "Tom"))
				; IntTest.assertOptionEquals(NONE, put(dict, "Tom", 10))
				; IntTest.assertOptionEquals(SOME 10, get(dict, "Tom"))
				; test_entries([("Bill", 6), ("Bobby", 4), ("Jackie", 42), ("Michael", 23), ("Ted", 9), ("Tom", 10)])

				; IntTest.assertOptionEquals(SOME 10, get(dict, "Tom"))
				; IntTest.assertOptionEquals(SOME 10, put(dict, "Tom", 12))
				; IntTest.assertOptionEquals(SOME 12, get(dict, "Tom"))
				; test_entries([("Bill", 6), ("Bobby", 4), ("Jackie", 42), ("Michael", 23), ("Ted", 9), ("Tom", 12)])

				; if is_remove_desired
				then 
					( IntTest.assertOptionEquals(SOME 6, remove(dict, "Bill"))
					; IntTest.assertOptionEquals(NONE, get(dict, "Bill"))
					; IntTest.assertOptionEquals(NONE, remove(dict, "Bill"))
					; test_entries([("Bobby", 4), ("Jackie", 42), ("Michael", 23), ("Ted", 9), ("Tom", 12)])

					; IntTest.assertOptionEquals(SOME 4, remove(dict, "Bobby"))
					; IntTest.assertOptionEquals(NONE, get(dict, "Bobby"))
					; IntTest.assertOptionEquals(NONE, remove(dict, "Bobby"))
					; test_entries([("Jackie", 42), ("Michael", 23), ("Ted", 9), ("Tom", 12)])

					; IntTest.assertOptionEquals(SOME 42, remove(dict, "Jackie"))
					; IntTest.assertOptionEquals(NONE, get(dict, "Jackie"))
					; IntTest.assertOptionEquals(NONE, remove(dict, "Jackie"))
					; test_entries([("Michael", 23), ("Ted", 9), ("Tom", 12)])

					; IntTest.assertOptionEquals(SOME 23, remove(dict, "Michael"))
					; IntTest.assertOptionEquals(NONE, get(dict, "Michael"))
					; IntTest.assertOptionEquals(NONE, remove(dict, "Michael"))
					; test_entries([("Ted", 9), ("Tom", 12)])

					; IntTest.assertOptionEquals(SOME 9, remove(dict, "Ted"))
					; IntTest.assertOptionEquals(NONE, get(dict, "Ted"))
					; IntTest.assertOptionEquals(NONE, remove(dict, "Ted"))
					; test_entries([("Tom", 12)])

					; IntTest.assertOptionEquals(SOME 12, remove(dict, "Tom"))
					; IntTest.assertOptionEquals(NONE, get(dict, "Tom"))
					; IntTest.assertOptionEquals(NONE, remove(dict, "Tom"))
					; test_entries([])
					)
				else ()
			; UnitTesting.leave() 
			)
		end

	fun test_string_to_int_comprehensive(strictness : UnitTesting.list_strictness_level, is_remove_desired : bool, test_enter_prefix : string, dict : (string,int) Dictionary.dictionary) : unit =
		let
			val _ = UnitTesting.enter(test_enter_prefix ^ " comprehensive")
			val seeded_rand = Random.rand(425, 231)
			val nextInt = Random.randRange(0, 999) 

			val nextCharInt = Random.randRange(65, 90)

			fun nextChar() =
				Char.chr(nextCharInt(seeded_rand))

			fun generate_random_string() =
				String.implode([nextChar(), nextChar(), nextChar(), nextChar(), nextChar()])

			fun generate_random_entry() =
				(generate_random_string(), nextInt(seeded_rand))

			fun generate_random_entries(n) = 
				List.tabulate(n, fn(_)=>generate_random_entry())

			val random_entries = generate_random_entries(100)

			val test_entries = test_entries_of strictness dict

			fun to_possibly_sorted(entries) =
				if strictness = UnitTesting.EXACT_MATCH
				then ListMergeSort.sort (fn((ak,_),(bk,_)) => not (String.compare(ak,bk) = LESS)) entries
				else entries

			fun to_get_message(k) =
				"get(dict, \"" ^ k ^ "\")"
			fun to_put_message(k, v) =
				"put(dict, \"" ^ k ^ "\", " ^ Int.toString(v) ^ ")"
			fun to_remove_message(k) =
				"remove(dict, \"" ^ k ^ "\")"

			fun handle_entry((k,v), acc) =
				let
					val _ = IntTest.assertOptionEqualsWithMessage(NONE, get(dict, k), to_get_message(k))
					val _ = IntTest.assertOptionEqualsWithMessage(NONE, put(dict, k, v), to_put_message(k, v))
					val _ = IntTest.assertOptionEqualsWithMessage(SOME(v), get(dict, k), to_get_message(k))

					val acc' = (k,v)::acc

					val expected_possibly_sorted = to_possibly_sorted(acc')
					val _ = test_entries(expected_possibly_sorted)
				in
					acc'
				end
			
			val _ = foldl handle_entry [] random_entries

			val _ = if is_remove_desired
					then 
						let
							fun remove_random_item_from(entries) =
								let 
									val n = length(entries)
									val nextIndex = Random.randRange(0, n-1) 
									val index = nextIndex(seeded_rand)

									val entry_to_remove = List.nth(entries, index)
									val (key_to_remove, value_to_remove) = List.nth(entries, index)
									val entries' = List.take(entries, index) @ List.drop(entries, index + 1)

									val _ = IntTest.assertOptionEqualsWithMessage(SOME(value_to_remove), get(dict, key_to_remove), to_get_message(key_to_remove))
									val _ = IntTest.assertOptionEqualsWithMessage(SOME(value_to_remove), remove(dict, key_to_remove), to_remove_message(key_to_remove))
									val _ = IntTest.assertOptionEqualsWithMessage(NONE, get(dict, key_to_remove), to_get_message(key_to_remove))

									val expected_possibly_sorted = to_possibly_sorted(entries')
									val _ = test_entries(expected_possibly_sorted)

								in 
									entries'
								end

							fun remove_all_randomly(entries) =
								let
									val entries_ref = ref(entries)
								in
									while length(!entries_ref) > 0 do 
										( entries_ref := remove_random_item_from(!entries_ref)
										; entries_ref := handle_entry(generate_random_entry(), !entries_ref)
										; entries_ref := remove_random_item_from(!entries_ref)
										)
								end
						in
							remove_all_randomly(random_entries)
						end
					else ()
		in
			UnitTesting.leave()
		end

	fun test_dictionary(is_sorted : bool, is_remove_desired : bool, test_enter_prefix : string, dict_supplier : (unit -> (string,int) Dictionary.dictionary)) : unit =
		let
			val strictness = if is_sorted then UnitTesting.EXACT_MATCH else UnitTesting.ANY_ORDER
		in
			( UnitTesting.enter(test_enter_prefix)
			; test_string_to_int_single_key(is_remove_desired, test_enter_prefix, dict_supplier(), "Fred")
			; test_string_to_int_multiple_keys(strictness, is_remove_desired, test_enter_prefix, dict_supplier())
			; test_string_to_int_comprehensive(strictness, is_remove_desired, test_enter_prefix, dict_supplier())
			; UnitTesting.leave()
			)
		end
end
