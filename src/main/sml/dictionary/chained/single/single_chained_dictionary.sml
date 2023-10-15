(* Kien Ta *)

structure SingleChainedDictionary :> SINGLE_CHAINED_DICTIONARY = struct
	structure TypeHolder = struct
		
		(* TODO: replace unit with the type you decide upon *)
		type (''k,'v) dictionary = (''k *'v) list ref
	end

	structure SingleChainHasEntries = HasEntriesFn (struct
		type (''k,'v) dictionary = (''k,'v) TypeHolder.dictionary

		fun entries(dict : (''k,'v) dictionary) : (''k*'v) list =
			!dict
	end)

	structure SingleChainHasChaining = HasChainingFn (struct
		type (''k,'v) dictionary = (''k,'v) TypeHolder.dictionary

		fun getChainOfAllEntries(dict : (''k,'v) dictionary) : (''k*'v) list =
			SingleChainHasEntries.entries(dict)

		fun setChainOfAllEntries(dict : (''k,'v) dictionary, nextEntries : (''k*'v) list) : unit =
			(dict := nextEntries; ())

		fun getChainOfEntriesForKey(dict : (''k,'v) dictionary, key : ''k) : (''k*'v) list =
			getChainOfAllEntries(dict)

		fun setChainOfEntriesForKey(dict : (''k,'v) dictionary, key : ''k, nextEntries : (''k*'v) list) : unit =
			setChainOfAllEntries(dict, nextEntries)
	end)

	open SingleChainHasEntries
	open SingleChainHasChaining

    fun create() : (''k,'v) dictionary = 
        ref []
end
