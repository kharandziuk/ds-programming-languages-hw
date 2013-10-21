(* 1 *)
fun is_older(a: int*int*int, b: int*int*int)=
  (#1 a - #1 b) * 100 + (#2 a - #2 b) * 10 + (#3 a - #3 b) * 1 < 0


(* 2 *)
fun number_in_month(dates: (int*int*int) list, number: int) =
  let
    fun check(date: int*int*int) = 
      if #2 date = number
      then 1
      else 0
  in
      if null dates
      then 0
      else check(hd dates) + number_in_month(tl dates, number)
  end

(* 3 *)
fun number_in_months(dates: (int*int*int) list, numbers: int list) =
  if null numbers
  then 0
  else number_in_month(dates, hd numbers) + number_in_months(dates, tl numbers)

(* 4 *)
fun dates_in_month(dates: (int*int*int) list, number: int) =
  if null dates
  then []
  else let
      val other = dates_in_month(tl dates, number)
      val date = hd dates
    in
      if #2 date = number
      then date :: other
      else other
    end
    
(* 5 *)
fun dates_in_months(dates: (int*int*int) list, numbers: int list) =
  if null numbers
  then []
  else dates_in_month(dates, hd numbers) @ dates_in_months(dates, tl numbers)

(* 6 *)
fun get_nth(xs: string list, num: int) =
  if num = 1
  then hd xs
  else get_nth(tl xs, num-1)

(* 7 *)
fun date_to_string(date: int*int*int) = 
  let
    val names = ["January", "February", "March",
      "April", "May", "June",
      "July", "August", "September",
      "October", "November", "December"]
    val month_name = get_nth(names, #2 date)
  in
    month_name ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
  end

(* 8 *)
fun number_before_reaching_sum(sum: int, numbers: int list) = 
  let
    fun aux(sum: int, numbers: int list, count: int)=
      if null numbers
      then count
      else let 
          val t = sum - hd numbers
        in
          if t > 0
          then aux(t, tl numbers, count + 1)
          else count
        end
  in  
    aux(sum, numbers, 0)
  end


(* 9 *)
fun what_month(num: int) =
  let
    val counts = [31, 28, 31, 30,
                  31, 30, 31, 31,
                  30, 31, 30, 31]
  in
    1 + number_before_reaching_sum(num, counts)
  end

(* 10 *)
fun month_range(d1: int, d2: int) =
  if d1 > d2
  then []
  else what_month(d1) :: month_range(d1 + 1, d2)

(* 11 *)
fun oldest(dates: (int*int*int) list) =
  let 
    fun aux(d1: int*int*int, d2: (int*int*int) option) =
      if isSome d2 andalso not (is_older(d1, valOf d2))
      then d2
      else SOME d1
  in 
    if null dates
    then NONE
    else aux(hd dates, oldest(tl dates))
  end


(* 12 *)
fun remove_duplicates(numbers: int list)=
  let
    fun aux(xs: int list, y: int)=
      if null xs
      then []
      else if hd xs = y
      then aux(tl xs, y)
      else hd xs :: aux(tl xs, y)
  in
    if null numbers orelse null(tl numbers)
    then numbers
    else hd numbers :: remove_duplicates(aux(tl numbers, hd numbers))
  end

fun number_in_months_challenge(dates: (int*int*int) list, numbers: int list) =
  number_in_months(dates, remove_duplicates(numbers))

fun dates_in_months_challenge(dates: (int*int*int) list, numbers: int list) =
  dates_in_months(dates, remove_duplicates(numbers))

(* 13 *)
fun is_leap(year: int) =
  year mod 400 = 0 orelse (year mod 4 = 0 andalso year mod 100 <> 0)

(* 31: 1, 3, 5, 7, 8, 10, 12
30: 4, 6, 9, 11
28: 2 *)
fun days_in_month(month: int) =
  let 
    fun list_in(y: int, xs: int list) =
      not (null xs) andalso (y = hd xs  orelse list_in(y, tl xs))
  in
    if list_in(month, [1, 3, 5, 7, 8, 10, 12])
    then 31
    else if list_in(month, [4, 6, 9, 11])
      then 30
      else 28
  end

fun is_date_in_month(date: (int*int*int), number: int) =
    number = #2 date andalso #3 date <= days_in_month(#2 date)

fun reasonable_date(date: int*int*int) =
  let
    val year = #1 date;
    val month = #2 date;
    val day = #3 date;
    fun check_year() = year > 0
    fun check_month() = 0 < month andalso month < 13
    fun check_day() =
      if month = 2 andalso day = 29
      then is_leap(year)
      else 0 < day andalso day <= days_in_month(day)
  in
    check_year() andalso check_month() andalso check_day()
  end;

