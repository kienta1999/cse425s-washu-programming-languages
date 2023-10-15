(* Dennis Cosgrove *)
structure SortedTesting : sig 
	val test_sorted : unit -> unit
end = struct

	val is_remove_testing_desired = CommandLineArgs.getBoolOrDefault("remove", true)

	fun test_sorted() =
		let
			fun test_preliminary_sorted(coverage, dict) =
				( UnitTesting.enter("SortedDictionary preliminary_sorted")

				; StringIntEntryTest.assertListEquals([], SortedDictionary.entries(dict))

				; SortedDictionary.put(dict, "C", 3)
				; SortedDictionary.put(dict, "A", 1)
				; SortedDictionary.put(dict, "E", 5)
				; SortedDictionary.put(dict, "D", 4)
				; SortedDictionary.put(dict, "B", 2)
				; StringTest.assertListEquals(["A", "B", "C", "D", "E"], SortedDictionary.keys(dict))
				; IntTest.assertListEquals([1,2,3,4,5], SortedDictionary.values(dict))
				; SortedDictionary.put(dict, "I", 9)
				; SortedDictionary.put(dict, "F", 6)
				; SortedDictionary.put(dict, "H", 8)
				; SortedDictionary.put(dict, "G", 7)
				; StringTest.assertListEquals(["A", "B", "C", "D", "E", "F", "G", "H", "I"], SortedDictionary.keys(dict))
				; IntTest.assertListEquals([1,2,3,4,5,6,7,8,9], SortedDictionary.values(dict))

				; if is_remove_testing_desired
					then 
					( IntTest.assertOptionEquals(SOME 6, SortedDictionary.remove(dict, "F"))
					; StringTest.assertListEquals(["A", "B", "C", "D", "E", "G", "H", "I"], SortedDictionary.keys(dict))
					; IntTest.assertOptionEquals(SOME 1, SortedDictionary.remove(dict, "A"))
					; StringTest.assertListEquals(["B", "C", "D", "E", "G", "H", "I"], SortedDictionary.keys(dict))
					; IntTest.assertOptionEquals(SOME 4, SortedDictionary.remove(dict, "D"))
					; StringTest.assertListEquals(["B", "C", "E", "G", "H", "I"], SortedDictionary.keys(dict))
					; IntTest.assertOptionEquals(SOME 5, SortedDictionary.remove(dict, "E"))
					; StringTest.assertListEquals(["B", "C", "G", "H", "I"], SortedDictionary.keys(dict))
					; IntTest.assertOptionEquals(SOME 2, SortedDictionary.remove(dict, "B"))
					; StringTest.assertListEquals(["C", "G", "H", "I"], SortedDictionary.keys(dict))
					; IntTest.assertOptionEquals(SOME 9, SortedDictionary.remove(dict, "I"))
					; StringTest.assertListEquals(["C", "G", "H"], SortedDictionary.keys(dict))
					; IntTest.assertOptionEquals(SOME 7, SortedDictionary.remove(dict, "G"))
					; StringTest.assertListEquals(["C", "H"], SortedDictionary.keys(dict))
					; IntTest.assertOptionEquals(SOME 8, SortedDictionary.remove(dict, "H"))
					; StringTest.assertListEquals(["C"], SortedDictionary.keys(dict))
					; IntTest.assertOptionEquals(SOME 3, SortedDictionary.remove(dict, "C"))
					; StringTest.assertListEquals([], SortedDictionary.keys(dict))

					; SortedDictionary.put(dict, "E", 5)
					; SortedDictionary.put(dict, "C", 3)
					; SortedDictionary.put(dict, "G", 7)
					; SortedDictionary.put(dict, "A", 1)
					; SortedDictionary.put(dict, "B", 2)
					; SortedDictionary.put(dict, "D", 4)
					; SortedDictionary.put(dict, "F", 6)
					; SortedDictionary.put(dict, "H", 8)
					; SortedDictionary.put(dict, "I", 9)
					; IntTest.assertOptionEquals(SOME 5, SortedDictionary.remove(dict, "E"))
					; StringTest.assertListEquals(["A", "B", "C", "D", "F", "G", "H", "I"], SortedDictionary.keys(dict))
					; IntTest.assertOptionEquals(SOME 3, SortedDictionary.remove(dict, "C"))
					; StringTest.assertListEquals(["A", "B", "D", "F", "G", "H", "I"], SortedDictionary.keys(dict))
					; IntTest.assertOptionEquals(SOME 7, SortedDictionary.remove(dict, "G"))
					; StringTest.assertListEquals(["A", "B", "D", "F", "H", "I"], SortedDictionary.keys(dict)))
					else ()
				; UnitTesting.leave() )
		in 
			( UnitTesting.enter("SortedDictionaryTesting")
			; test_preliminary_sorted(is_remove_testing_desired, SortedDictionary.create(String.compare))
			; SortedDictionaryTesting.test_dictionary(true, is_remove_testing_desired, "SortedDictionary", fn()=>(SortedDictionary.create(String.compare)))
			; UnitTesting.leave()
			)
		end
end
