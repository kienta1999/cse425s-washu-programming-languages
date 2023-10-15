functor HasChainingFn (HasChainingParameter : sig
	type (''k,'v) dictionary
	val getChainOfEntriesForKey : ((''k,'v) dictionary * ''k) -> (''k*'v) list
	val setChainOfEntriesForKey : ((''k,'v) dictionary * ''k * (''k*'v) list) -> unit
end) : HAS_CHAINING = struct
	open HasChainingParameter

    

    fun get(dict : (''k,'v) dictionary, key:''k) : 'v option =
        let
            val entries = getChainOfEntriesForKey(dict, key)
            val filtered_entry = List.find (fn(e_key, _) => e_key = key) entries
        in
            case filtered_entry of
               NONE => NONE
             | SOME(_, e_val) => SOME(e_val)
        end

    fun put(dict : (''k,'v) dictionary, key:''k, value:'v) : 'v option =
        let
            val previous_key = get(dict, key)
            val entries = getChainOfEntriesForKey(dict, key)
            val filtered_entries = List.filter (fn(e_key, _) => e_key <> key) entries
        in
            (setChainOfEntriesForKey(dict, key, (key, value)::filtered_entries); previous_key)
        end

    fun remove(dict : (''k,'v) dictionary, key : ''k) : 'v option =
        let
            val previous_key = get(dict, key)
            val entries = getChainOfEntriesForKey(dict, key)
            val filtered_entries = List.filter (fn(e_key, _) => e_key <> key) entries
        in
          case previous_key of
               NONE => previous_key
             | SOME _ => 
                let
                    val _ = setChainOfEntriesForKey(dict, key, filtered_entries)
                in
                    previous_key
                end
        end
end