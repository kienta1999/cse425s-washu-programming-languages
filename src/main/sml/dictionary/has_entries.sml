functor HasEntriesFn (HasEntriesParameter : sig
	type (''k,'v) dictionary
	val entries : (''k,'v) dictionary -> (''k*'v) list
end) : HAS_ENTRIES = struct
	open HasEntriesParameter

    fun keys(dict : (''k,'v) dictionary) : ''k list = 
        List.map (fn(key, value) => key) (entries dict)

    fun values(dict : (''k,'v) dictionary) : 'v list = 
        List.map (fn(key, value) => value) (entries dict)
end