(* Coursera Programming Languages, Homework 3, Provided Code *)

val only_capitals = List.filter (fn x => Char.isUpper(String.sub (x, 0)))

fun longest_string1(strings)=
  let
    fun aux (x, acc)=
      if String.size x > String.size acc
      then x
      else acc
  in
    List.foldl aux "" strings
  end

fun longest_string2(strings)=
  let
    fun aux (x, acc)=
      if String.size x >= String.size acc
      then x
      else acc
  in
    List.foldl aux "" strings
  end

fun longest_string_helper comp strings=
  let
    fun aux (x, acc)=
      if comp(String.size x, String.size acc)
      then x
      else acc
  in
    List.foldl aux "" strings
  end

val longest_string3 = longest_string_helper (fn (x, y) => x > y);
val longest_string4 = longest_string_helper (fn (x, y) => x >= y);

val longest_capitalized = longest_string1 o only_capitals 

val rev_string = String.implode o List.rev o String.explode


exception NoAnswer

fun first_answer f xs=
  case xs of
    [] => raise NoAnswer
  | x::xs' => case f x of
               NONE => first_answer f xs'
             | SOME y => y

fun all_answers f xs=
  let
    fun aux([], acc) = SOME acc
    | aux(y::ys', acc) =
      case f y of
        NONE => NONE
      | SOME v => aux(ys', acc @ v)
  in
    aux(xs, [])
  end
  

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu


fun g f1 f2 p =
    let 
	  val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

val count_wildcards = g (fn () => 1) (fn x =>0)
val count_wild_and_variable_lengths = g (fn () => 1) (fn s => String.size s)

fun count_some_var(name, pattern) =
  g (fn () => 0) (fn x => if x = name then 1 else 0) pattern


fun check_pat p =
  (g (fn () => 0) (fn x => if count_some_var(x, p) = 1 then 0 else 1) p) = 0

fun match (value, pattern) =
  let
      fun match_const(const)=
        case pattern of
          Wildcard => SOME []
        | Variable s => SOME [(s,value)]
        | TupleP (_::[]) =>  SOME []
        | ConstP t => if t = const
                      then SOME []
                      else NONE
        | _ => NONE
      fun match_unit()=
        case pattern of
          Wildcard => SOME []
          UnitP => SOME []
        | _ => NONE
      fun match_tuple(value_list)=
        case pattern of
  in
    case value of
      Const x => match_const(x)
    | Unit => match_unit()
	| Tuple vl => match_tuple(vl)ListPair.zip(
        ,
        all_answers match vl
    | _ => NONE
  end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)
