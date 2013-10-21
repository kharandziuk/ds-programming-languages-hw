(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

fun all_except_option(opt, xs)=
  let 
    fun aux ([]) = []
    |aux (y::ys')=
        if y = opt
        then aux ys'
        else y :: aux ys'
    val res = aux(xs)
  in
    if xs = res
    then NONE
    else SOME res
  end

fun all_except(opt, xs) =
  case all_except_option(opt, xs) of NONE => [] 
    | SOME ys => ys

fun get_substitutions1([], _)=[]
| get_substitutions1(x::xs', opt) =
    all_except(opt, x) @ get_substitutions1(xs', opt)

fun get_substitutions2(xs, opt)=
  let 
    fun aux([], acc)= acc
    | aux(x::xs', acc) = aux(xs',acc @ all_except(opt, x))
  in
    aux(xs, [])
  end

fun similar_names(substs, full)=
  let 
    val {first=first, middle=middle, last=last} = full
    fun aux([])=[]
    | aux(x::xs') = {first=x, middle=middle, last=last} :: aux(xs')
  in
    full :: aux(get_substitutions2(substs, first))
  end



(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

fun card_color(suit, _)=
  case suit of
      Clubs => Black
    | Spades => Black
    | Diamonds => Red
    | Hearts => Red

fun card_value(_, value) =
  case value of
    Num y => y
  | Jack => 10
  | Queen => 10
  | King => 10
  | Ace => 11

fun remove_card(cs, c, error)=
  let
    fun aux([]) = []
    | aux(x::xs') = 
      if x = c
      then xs'
      else x :: aux(xs')
    val res = aux(cs)
  in
    if res = cs
    then raise error
    else res
  end

fun all_same_color cs =
  case cs of
    [] => true
  | _::[] => true
  | x::(x'::xs') => card_color(x) = card_color(x') andalso
                      all_same_color(x'::xs')

fun sum_cards cs =
  let
    fun aux(cs, acc) =
      case cs of
        [] => acc
      | c::cs' => aux(cs', acc + card_value(c))
  in
    aux(cs, 0)
  end

fun score(cs, goal)=
  let
    val sum = sum_cards cs
    val sc = if sum > goal
             then (sum - goal) * 3
             else goal - sum
  in
    if all_same_color cs
    then sc div 2
    else sc
  end

fun officiate(cs, ms, goal)=
  let
    fun aux(cs, ms, held)=
      let val res = score(held, goal) in
      if res > goal
      then res
      else
        case cs of
          [] => res
        | c::cs' =>
            case ms of
              [] => res
            | m::ms' =>
                case m of 
                  Draw => aux(cs', ms', c::held)
                | Discard card =>
                    (case remove_card(cs', card, IllegalMove) of
                      cs => aux(cs, ms', held))
      end
  in
    aux(cs, ms, [])
  end


(* creates list of all possible ace substitutions list with repeats
  [(Clubs, Ace)]) -> [(Clubs, Ace)], [(Clubs, Num 1)]
  [(Clubs, Num 2)]) = [[(Clubs, Num 2)]];
*)
fun substitutions(cs)=
  let
    fun substs([], _ , acc)= acc
    | substs(s::ss, es, acc)= (* middle, starts, ends*)
      let
        fun aux(m)= (m::ss) @ es
      in
        case s of
          (k, Ace) => (
            let val pos = (k, Num 1)
            in
              substs(ss, s::es, [aux(s)]) @
              substs(ss, pos::es, [aux(pos)]) 
            end
          )
        | _ => substs(ss, s::es, [aux(s)])
      end
  in
    substs(cs, [], [])
  end

fun score_challenge([], goal)=goal
| score_challenge(cs, goal)=
  let
    fun aux([]) = []
    | aux(x::xs') = score(x, goal) :: aux(xs')

    fun min([], min) = min
    | min(x::xs', m) = if x < m then min(xs', x) else min(xs', m)

    val poss = substitutions(cs);
    val m::scores = aux(poss)
  in
    min(scores, m)
  end

fun officiate_challenge(cs, ms, goal)=
  let
    fun aux(cs, ms, held)=
      let val res = score_challenge(held, goal) in
      if res > goal
      then res
      else
        case cs of
          [] => res
        | c::cs' =>
            case ms of
              [] => res
            | m::ms' =>
                case m of 
                  Draw => aux(cs', ms', c::held)
                | Discard card =>
                    (case remove_card(cs', card, IllegalMove) of
                      cs => aux(cs, ms', held))
      end
  in
    aux(cs, ms, [])
  end
