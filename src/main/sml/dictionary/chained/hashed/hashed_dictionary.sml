(* Kien Ta *)
structure HashedDictionary :> HASHED_DICTIONARY = struct
	type ''k hash_function = ''k -> int

	structure TypeHolder = struct
		(* TODO: replace unit with the type you decide upon *)
        (* type (''k, 'v) bucket = (''k *'v) list ref *)
		type (''k,'v) dictionary = ((''k *'v) list array) * (''k -> int) * int
		
	end

	structure HashedHasEntries = HasEntriesFn (struct
		type (''k,'v) dictionary = (''k,'v) TypeHolder.dictionary

        fun entries(dict : (''k,'v) dictionary) : (''k*'v) list =
			let
                val (buckets, hash, count) = dict
            in
                Array.foldl (fn(x, init) => x @ init) [] buckets
            end
	end)

	structure HashedHasChaining = HasChainingFn (struct
		type (''k,'v) dictionary = (''k,'v) TypeHolder.dictionary

		fun positive_remainder(v : int, n : int) : int = 
			let
				val result = v mod n 
			in 
				if result >= 0 then result else result+n
			end 

		
		fun getChainOfEntriesForKey(dict : (''k,'v) dictionary, key : ''k) : (''k*'v) list =
			let
                val (buckets, hash, count) = dict
                val pos = positive_remainder(hash(key), count)
            in
                Array.sub(buckets, pos)
            end

		fun setChainOfEntriesForKey(dict : (''k,'v) dictionary, key : ''k, nextEntries : (''k*'v) list) : unit =
            let
                val (buckets, hash, count) = dict
                val pos = positive_remainder(hash(key), count)
                val element_list = Array.sub(buckets, pos)
            in
                Array.update(buckets, pos, nextEntries)
            end
	end)

	open HashedHasEntries
	open HashedHasChaining

    fun create(bucket_count_request : int, hash : ''k hash_function) : (''k,'v) dictionary = 
        (Array.array(bucket_count_request, []), hash, bucket_count_request)
end (* struct *) 
