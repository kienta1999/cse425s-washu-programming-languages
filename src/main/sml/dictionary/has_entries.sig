signature HAS_ENTRIES = sig
    type (''k,'v) dictionary
    val entries : (''k,'v) dictionary -> (''k*'v) list
    val keys : (''k,'v) dictionary -> ''k list
    val values : (''k,'v) dictionary -> 'v list
end