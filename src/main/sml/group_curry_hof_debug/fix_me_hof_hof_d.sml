(* Kien Ta *)
fun to_x(x, _) =
    x

val xys = [(10,20), (30,40), (50, 60)]

val xs = map xys to_x

val sum_xs = foldl op+ 0 xs

