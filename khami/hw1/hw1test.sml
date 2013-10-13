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


val t2_1 = number_in_month([(2012,2,28),(2013,12,1)],2) = 1;
val t2_2 = number_in_month([(2012,2,28),(2012,2,29)],2) = 2;
val t2_3 = number_in_month([(2012,3,3),(2012,3,31)],2) = 0;
val t2_4 = number_in_month([(2012,3,3),(2012,3,31)],3) = 2;
val t2_5 = number_in_month([(1,2,98)], 2 ) = 1;
val t2_6 = number_in_month([(1,2,98),(3,5,201),(1,17,83)], 2) = 1;
val t2_7 = number_in_month([(3,5,201),(1,17,83),(1,2,98)], 2) = 1;

val t2_8 = number_in_month([(3,5,201),(1,2,98),(1,17,83)], 2) = 1;
val t2_9 = number_in_month(
  [(1,2,98),(3,5,201),(1,17,83),(3,2,2412),(1,2,342),(1,2,98),(6,7,8)],
  2) = 4;
val t2_10 = number_in_month(
  [(1,2,98),(3,2,2412),(1,2,342),(1,2,98)],
  2) = 4;


val t3_1 =
  number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3;
val t3_2 =
  number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0;
val t3_3 = number_in_months([(1,2,98)], [2]) = 1;
val t3_4 = number_in_months([(1,2,98),(3,5,201),(1,17,83)], [2]) = 1;
val t3_5 = number_in_months([(3,5,201),(1,17,83),(1,2,98)], [2]) = 1;
val t3_6 = number_in_months([(3,5,201),(1,2,98),(1,17,83)], [2]) = 1;
val t3_7 = number_in_months(
  [(1,2,98),(3,5,201),(1,17,83),(3,2,2412),(1,2,342),(1,2,98),(6,7,8)],
  [2]
) = 4
val t3_8 = number_in_months([(1,2,98),(3,2,2412),(1,2,342),(1,2,98)], [2]) = 4
val t3_9 = number_in_months(
  [(1,2,98),(3,5,201),(1,17,83),(3,2,2412),(1,2,342),(1,2,98),(6,7,8)],
  [2,17]) = 5;
val t3_10 = number_in_months(
  [(1,2,98),(3,5,201),(1,17,83),(3,2,2412),(1,2,342),(1,2,98),(6,7,8)],
  [2,7,5]) = 6;
val t3_11 =
  number_in_months([(1,2,98),(3,2,2412),(1,2,342),(1,2,98)], [2,17]) = 4;

val t4_1 = dates_in_month([(2012,2,28),(2013,12,1)], 2) = [(2012,2,28)];
val t4_2 = dates_in_month([(2012,1,28),(2013,12,1)], 2) = [];
val t4_3 = dates_in_month([(2012,2,28),(2013,2,1)],2) = [(2012,2,28), (2013,2,1)];

val t4_4 = dates_in_month([(1,2,98)], 2) = [(1,2,98)]
val t4_5 = dates_in_month([(1,2,98),(3,5,201),(1,17,83)], 2) = [(1,2,98)]
val t4_6 = dates_in_month([(3,5,201),(1,17,83),(1,2,98)], 2) = [(1,2,98)]
val t4_7 = dates_in_month([(3,5,201),(1,2,98),(1,17,83)], 2) = [(1,2,98)]
val t4_8 = dates_in_month(
  [(1,2,98),(3,5,201),(1,17,83),(3,2,2412),(1,2,342),(1,2,98),(6,7,8)],
  2) = [(1,2,98),(3,2,2412),(1,2,342),(1,2,98)]
val t4_9 = dates_in_month(
  [(1,2,98),(3,2,2412),(1,2,342),(1,2,98)],
  2) = [(1,2,98),(3,2,2412),(1,2,342),(1,2,98)]

val t5_1 = dates_in_months(
  [(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],
  [2,3,4]
) = [(2012,2,28),(2011,3,31),(2011,4,28)];

val t5_2 = dates_in_months(
  [(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],
  []
) = [];

val t5_3 = dates_in_months( 
  [(1,2,98), (3,5,201), (1,17,83), (3,2,2412), (1,2,342), (1,2,98), (6,7,8)],
  [2]
) = [(1,2,98), (3,2,2412), (1,2,342), (1,2,98)]
val t5_4 = dates_in_months(
  [(1,2,98), (3,5,201), (1,17,83), (3,2,2412), (1,2,342),(1,2,98),(6,7,8)],
  [2,5]
) = [(1,2,98),(3,2,2412),(1,2,342),(1,2,98),(3,5,201)];
val t5_5 = dates_in_months(
  [(1,2,98),(3,5,201),(1,17,83),(3,2,2412),(1,2,342),(1,2,98),(6,7,8)],
  [2,5,7]
) = [(1,2,98),(3,2,2412),(1,2,342),(1,2,98),(3,5,201),(6,7,8)];


val t6_1 = get_nth(["hi", "there", "how", "are", "you"], 2) = "there";
val t6_2 = get_nth(["hi", "there", "how", "are", "you"], 1) = "hi";
val t6_3 = get_nth(["hi", "there", "how", "are", "you"], 5) = "you";

val t7_1 = date_to_string((2013, 6, 1)) = "June 1, 2013";
val t7_2 = date_to_string((6,3,1)) = "March 1, 6"

val t8_2 = number_before_reaching_sum(2, [1,2,3,4,5]) = 1;
val t8_1 = number_before_reaching_sum(10, [1,2,3,4,5]) = 3;
val t8_3 = number_before_reaching_sum(16, [1,2,3,4,5]) = 5;

val t9_1 = what_month(70) = 3;
val t9_2 = what_month(365) = 12;
val t9_3 = what_month(1) = 1;

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

val tc1_1 = number_in_months_challenge(
  [(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],
  [2, 2, 3, 3, 4, 4]
) = 3;
val tc1_2 = number_in_months_challenge(
  [(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]
) = 0;
val tc1_3 = number_in_months_challenge([(1,2,98)], [2,2]) = 1;
val tc1_4 = number_in_months_challenge(
  [(1,2,98),(3,2,2412),(1,2,342),(1,2,98)],
  [2,2,2,2,17,17,17]
) = 4;

val tc21 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,
2,3,3,4]) =
  [(2012,2,28),(2011,3,31),(2011,4,28)];
val tc22 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = [];

val tc02 = is_leap(4) = true;
val tc02 = is_leap(2000) = true;
val tc02 = is_leap(100) = false;
val tc02 = is_leap(1999) = false;

val tc_31 = reasonable_date((2012,2,28)) = true;
val tc_32 = reasonable_date((2012,2,29)) = true;
val tc_33 = reasonable_date((1,2,29)) = false;
val tc_34 = reasonable_date((1,22,28)) = false;
val tc_35 = reasonable_date((~1,22,28)) = false;
val tc_36 = reasonable_date((0,2,3)) = false;
