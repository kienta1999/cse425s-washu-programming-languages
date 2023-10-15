(* Kien Ta *)
fun range(min, maxExclusive) =
    if min>=maxExclusive
    then []
    else min::range(min+1, maxExclusive)

val xs = range(1, 5)
val sum_a = foldl op+ 0 xs
val sum_b = foldl op+ 0 range(1, 5)


