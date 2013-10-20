(* Homework 1.  *)

fun is_older (date1: (int * int * int), date2: (int * int * int)) =
    if #1 date1 <> #1 date2
       then #1 date1 < #1 date2
    else if #2 date1 <> #2 date2
       then #2 date1 < #2 date2
    else #3 date1 < #3 date2

fun number_in_month (dates: (int * int * int) list, month: int) =
    if null dates
       then 0
    else (if #2 (hd dates) = month
	    then 1 else 0)
	 + number_in_month (tl dates, month)

fun number_in_months (dates: (int * int * int) list, months: int list) =
    if null months
       then 0
    else number_in_month (dates, hd months)
	 + number_in_months (dates, tl months)

fun dates_in_month (dates: (int * int * int) list, month: int) =
    if null dates
       then []
       else if #2 (hd dates) = month
	    then hd dates :: dates_in_month (tl dates, month)
	    else dates_in_month (tl dates, month)

fun dates_in_months (dates: (int * int * int) list, months: int list) =
    if null months
       then []
    else dates_in_month (dates, hd months)
	 @ dates_in_months (dates, tl months)

(* The assignment doesn't say what to do if nth < 1.  This looks the safest. *)
fun get_nth (strings: string list, nth: int) =
    if nth <= 1 then hd strings
    else get_nth (tl strings, nth - 1)

fun date_to_string (date: (int * int * int)) =
    get_nth (["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"], #2 date)
    (* Arguably you could avoid the following line by appending a space to the name of each month.
     * But that way future problems lie. *)
    ^ " "
    ^ Int.toString (#3 date)
    ^ ", "
    ^ Int.toString (#1 date)

fun number_before_reaching_sum (sum: int, mylist: int list) =
    if hd mylist >= sum then 0
    else 1 + number_before_reaching_sum (sum - hd mylist, tl mylist)

fun what_month (doy: int) =
    (* I can think of two other ways of doing this:
     * number_before_reaching_sum (doy, [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31])
     * number_before_reaching_sum (doy + 31, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31])
     *
     * The first requires one more recursive call for each invocation, which is inefficient.
     * The second is Just Plain Ugly.
     *)
    1 + number_before_reaching_sum (doy, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31])

fun month_range (day1: int, day2: int) =
    if day1 > day2 then []
       else what_month (day1) :: month_range (day1 + 1, day2)

fun oldest (dates: (int * int * int) list) =
    if null dates
       then NONE
       else
	   let val last_oldest = oldest (tl dates)
	   in
	       if isSome last_oldest
		  andalso is_older (valOf last_oldest, hd dates)
	       then last_oldest
	       else SOME (hd dates)
           end
