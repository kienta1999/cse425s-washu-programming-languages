(* Homework1 *)

(* Kien Ta *)
(* year, month, day *)

fun is_older (date1 : (int * int *int), date2 : (int * int *int)) =
  if #1 date1 <> #1 date2
  then #1 date1 < #1 date2
  else if #2 date1 <> #2 date2
    then #2 date1 < #2 date2
    else #3 date1 < #3 date2

fun number_in_month (date_list : (int * int * int) list, month: int) =
    if null(date_list)
    then 0
    else if #2 (hd(date_list)) = month
        then 1 + number_in_month(tl(date_list), month)
        else number_in_month(tl(date_list), month)

fun number_in_months (date_list : (int * int * int) list, months: int list) =
    if null(months)
    then 0
    else number_in_month(date_list, hd(months)) + number_in_months(date_list, tl(months))

fun dates_in_month (date_list : (int * int * int) list, month: int) =
    if null(date_list)
    then []
    else if #2 (hd(date_list)) = month
        then hd(date_list) :: dates_in_month(tl(date_list), month)
        else dates_in_month(tl(date_list), month)

fun dates_in_months (date_list : (int * int * int) list, months: int list) =
    if null(months)
    then []
    else let
      fun append(list1, list2) =
        if null(list1)
        then list2
        else hd(list1) :: append(tl(list1), list2)
    in
      append(dates_in_month(date_list, hd(months)), dates_in_months(date_list, tl(months)))
    end

fun get_nth(str_list, n) =
    if n = 1
    then hd(str_list)
    else get_nth(tl(str_list), n - 1)


fun date_to_string(date : (int * int *int)) =
    let
      val month_letters = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
      val (y, m, d) = date
    in
      get_nth(month_letters, m) ^ " " ^ Int.toString(d) ^ ", " ^ Int.toString(y)
    end

fun number_before_reaching_sum(sum: int, numbers: int list) =
    if null(numbers) orelse sum <= hd(numbers)
    then 0
    else 1 + number_before_reaching_sum(sum - hd(numbers), tl(numbers))

val day_count_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
fun what_month(day: int) =
    number_before_reaching_sum(day, day_count_in_months) + 1

fun month_range (day1 : int, day2 : int) =
    if day1 > day2 
    then []
    else what_month(day1) :: month_range(day1 + 1, day2)

fun oldest(date_list : (int * int * int) list) = 
    if null(date_list)
    then NONE
    else 
        let
          val remaining = oldest(tl(date_list))
          fun older_date(date1, date2) = if is_older(date1, date2) 
                                        then date1
                                        else date2
        in
          if isSome(remaining)
          then SOME(older_date(valOf(remaining), hd(date_list)))
          else SOME(hd(date_list))

        end

fun remove_duplicate(months: int list) = 
    let
        fun contains(number: int, numbers: int list) = 
            if null(numbers)
            then false
            else number = hd(numbers) orelse contains(number, tl(numbers))
    in
        if null(months)
        then [] 
        else let
          val remainings = remove_duplicate(tl(months))
        in
          if contains(hd(months), remainings)
             then remainings
             else hd(months)::remainings
        end 
    end
    


fun number_in_months_challenge(date_list : (int * int * int) list, months: int list) =
    number_in_months(date_list, remove_duplicate(months))

fun dates_in_months_challenge(date_list : (int * int * int) list, months: int list) =
    dates_in_months(date_list, remove_duplicate(months))

fun reasonable_date(date : (int * int *int)) = 
    let
      val (y, m, d) = date
    in
        if (y mod 400 = 0 orelse (y mod 4 = 0 andalso y mod 100 <> 0)) andalso m = 2 andalso d = 29
        then true
        else y > 0 andalso m > 0 andalso m <= 12 andalso d > 0 andalso d <= get_nth(day_count_in_months, m)
    end
