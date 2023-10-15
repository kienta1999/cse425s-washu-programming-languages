signature HAS_CHAINING = sig
    type (''k,'v) dictionary
    val get : ((''k,'v) dictionary *''k) -> 'v option
    val put : ((''k,'v) dictionary *''k *'v) -> 'v option
    val remove : ((''k,'v) dictionary *''k) -> 'v option
end