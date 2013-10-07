(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw1.sml";

val t11 = is_older((1,2,3), (2,3,4)) = true;
val t12 = is_older((1,2,3), (1, 2, 3)) = false;
val t13 = is_older((1,2,4), (1, 2, 3)) = false;
val t14 = is_older((2012,2,28), (2011,3,31)) = false;
val t15 = is_older((2011,3,31), (2011,4,28)) = true;

val t01 = days_in_month(1) = 31;
val t02 = days_in_month(2) = 28;


val t21 = number_in_month([(2012,2,28),(2013,12,1)],2) = 1;
val t22 = number_in_month([(2012,2,28),(2012,2,29)],2) = 1;
val t23 = number_in_month([(2012,3,3),(2012,3,31)],2) = 0;
val t24 = number_in_month([(2012,3,3),(2012,3,31)],3) = 2;

val t31 =
  number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3;
val t32 =
  number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0;

val t41 = dates_in_month([(2012,2,28),(2013,12,1)], 2) = [(2012,2,28)];
val t42 = dates_in_month([(2012,1,28),(2013,12,1)], 2) = [];
val t43 = dates_in_month([(2012,2,28),(2013,2,1)],2) = [(2012,2,28), (2013,2,1)];

val t51 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) =
  [(2012,2,28),(2011,3,31),(2011,4,28)];

val t52 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = [];

val t61 = get_nth(["hi", "there", "how", "are", "you"], 2) = "there";
val t62 = get_nth(["hi", "there", "how", "are", "you"], 1) = "hi";
val t63 = get_nth(["hi", "there", "how", "are", "you"], 5) = "you";

val t7 = date_to_string((2013, 6, 1)) = "June 1, 2013";

val t82 = number_before_reaching_sum(2, [1,2,3,4,5]) = 1;
val t81 = number_before_reaching_sum(10, [1,2,3,4,5]) = 3;
val t83 = number_before_reaching_sum(16, [1,2,3,4,5]) = 5;

val t91 = what_month(70) = 3;
val t92 = what_month(365) = 12;
val t93 = what_month(1) = 1;

val test101 = month_range(31, 34) = [1,2,2,2];
val test102 = month_range(34, 31) = [];
val test103 = month_range(31, 31) = [1];

val test111 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31);
val test112 = oldest([]) = NONE;
val test112 = oldest([(2012,2,28)]) = SOME (2012,2,28)

val tc01 = remove_duplicates([1]) = [1];
val tc01 = remove_duplicates([1,2,3]) = [1, 2, 3];
val tc01 = remove_duplicates([1,1,1]) = [1];
val tc01 = remove_duplicates([1,2,2]) = [1, 2];

val tc11 =
  number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,
  2, 3, 3, 4, 4]) = 3;
val tc12 =
  number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0;

val tc21 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,
2,3,3,4]) =
  [(2012,2,28),(2011,3,31),(2011,4,28)];
val tc22 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = [];

val tc02 = is_leap(4) = true;
val tc02 = is_leap(2000) = true;
val tc02 = is_leap(100) = false;
val tc02 = is_leap(1999) = false;

val tc31 = reasonable_date((2012,2,28)) = true;
val tc32 = reasonable_date((2012,2,29)) = true;
val tc33 = reasonable_date((1,2,29)) = false;
val tc34 = reasonable_date((1,22,28)) = false;
val tc34 = reasonable_date((~1,22,28)) = false;
