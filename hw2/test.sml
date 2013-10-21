(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw.sml";

val test1_1 = all_except_option("string", ["string"]) = SOME [];
val test1_2 = all_except_option("string", ["string", "string"]) = SOME [];
val test1_3 = all_except_option("string", ["some"]) = NONE;
val test1_4 = all_except_option("string", ["string", "some"]) = SOME ["some"];

val test2_1 = get_substitutions1([["foo"],["there"]], "foo") = []
val test2_2 = get_substitutions1(
  [
    ["foo", "bar"],["there", "elsewere"]
  ], "foo") = ["bar"]
val test2_3 = get_substitutions1(
  [
    ["foo", "bar", "jap"]
  ], "foo") = ["bar", "jap"];

val test2_4 = get_substitutions1(
  [
    ["Fred","Fredrick"],
    ["Elizabeth","Betty"],
    ["Freddie", "Fred","F"]
  ], "Fred") = ["Fredrick","Freddie","F"];


val test3_1 = get_substitutions2([["foo"],["there"]], "foo") = []
val test3_2 = get_substitutions2(
  [
    ["foo", "bar"],["there", "elsewere"]
  ], "foo") = ["bar"]
val test3_3 = get_substitutions2(
  [
    ["foo", "bar", "jap"]
  ], "foo") = ["bar", "jap"];

val test3_4 = get_substitutions2(
  [
    ["Fred","Fredrick"],
    ["Elizabeth","Betty"],
    ["Freddie", "Fred","F"]
  ], "Fred") = ["Fredrick","Freddie","F"];

val test4_1 = similar_names(
  [
    ["Fred","Fredrick"],
    ["Elizabeth","Betty"],
    ["Freddie","Fred","F"]
  ],
  {first="Fred", middle="W", last="Smith"}
) = [
  {first="Fred", last="Smith", middle="W"},
  {first="Fredrick", last="Smith", middle="W"},
  {first="Freddie", last="Smith", middle="W"},
  {first="F", last="Smith", middle="W"}
];

val test4_2 = similar_names(
  [],
  {first="Fred", middle="W", last="Smith"}
) = [
  {first="Fred", last="Smith", middle="W"}
];

val test5_1_= card_color((Clubs, Num 2)) = Black;
val test5_2 = card_color((Diamonds, Num 2)) = Red;

val test6_1 = card_value((Clubs, Num 2)) = 2;
val test6_2 = card_value((Clubs, Jack)) = 10;
val test6_3 = card_value((Diamonds, Queen)) = 10;
val test6_4 = card_value((Clubs, King)) = 10;
val test6_5 = card_value((Clubs, Ace)) = 11;

val test7_1 = remove_card(
  [(Hearts, Ace)], (Hearts, Ace), IllegalMove
) = [];
val test7_2 = remove_card(
  [(Hearts, Ace), (Hearts, Ace)], (Hearts, Ace), IllegalMove
) = [(Hearts, Ace)];
val test7_3 = (remove_card(
  [(Hearts, Jack)], (Hearts, Ace), IllegalMove
) handle IllegalMove => []) = [];

val test8_1 = all_same_color([(Hearts, Ace), (Hearts, Ace)]) = true
val test8_2 = all_same_color([(Hearts, Ace), (Spades, Ace)]) = false
val test8_3 = all_same_color([(Hearts, Ace)]) = true

val test9_1 = sum_cards([(Clubs, Num 2),(Clubs, Num 2)]) = 4;
val test9_2 = sum_cards([]) = 0;
val test9_3 = sum_cards([(Clubs, Num 2)]) = 2;
val test9_4 = sum_cards([(Clubs, Num 2), (Spades, Ace)]) = 13;

val test10_1 = score([(Hearts, Num 2),(Clubs, Num 4)],10) = 4;
val test10_2 = score([(Hearts, Ace),(Clubs, Num 4)],10) = 15;
val test10_3 = score([(Hearts, Ace),(Diamonds, Num 4)],10) = 7;
val test10_4 = score([], 10);

val test11_1 = officiate([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6;

val test11_2 = officiate(
  [(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
  [Draw,Draw,Draw,Draw,Draw],
  42
) = 3;

val test11_3 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true);

val test_subst_1 = 
  substitutions([(Clubs, Ace)]) = [
  [(Clubs, Ace)],
  [(Clubs, Num 1)]
];

val test_subst_2 = 
  substitutions([(Clubs, Num 2)]) = [
  [(Clubs, Num 2)]
];

val test_subst_3 = 
  substitutions([(Clubs, Num 2), (Clubs, Num 2)]) = [
  [(Clubs, Num 2), (Clubs, Num 2)]
];

val test_subst_4 = 
  substitutions([(Clubs, Num 2), (Clubs, Ace), (Clubs, Num 2)]) = [ 
  [(Clubs, Num 2), (Clubs, Ace), (Clubs, Num 2)],
  [(Clubs, Num 2), (Clubs, Num 1), (Clubs, Num 2)]
];

val test_subst_5 =
  substitutions([(Clubs, Ace), (Hearts, Ace)]) = [
  [(Hearts,Ace),(Clubs,Ace)],
  [(Hearts,Num 1),(Clubs,Ace)],
  [(Hearts,Ace),(Clubs,Num 1)],
  [(Hearts,Num 1),(Clubs,Num 1)]
];

val testc1_1 = score_challenge([(Hearts, Num 2),(Clubs, Num 4)],10) = 4;
val testc1_2 = score_challenge([(Hearts, Ace),(Clubs, Num 4)],10) = 5;
val testc1_3 = score_challenge([(Hearts, Ace),(Diamonds, Num 4)],10) = 2;
val testc1_4 = score_challenge([], 10) = 10;

val testc2_1 = officiate_challenge([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6;

val testc2_2 = officiate_challenge(
  [(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
  [Draw,Draw,Draw,Draw,Draw],
  42
) = 3;

val testc2_3 = ((officiate_challenge([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true);
