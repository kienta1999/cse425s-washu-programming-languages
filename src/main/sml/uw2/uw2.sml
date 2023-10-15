(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* Kien Ta *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

(* first-name substitutions *)

fun all_except_option(str: string, str_list: string list) =
    let
      fun all_except_option_helper(str, str_list, ans, flag) =
        case str_list of
            [] => (ans, flag)
            | str_head :: str_rest => 
                if same_string(str_head, str)
                then all_except_option_helper(str, str_rest, ans, true)
                else all_except_option_helper(str, str_rest, ans @ [str_head], flag)
        val (ans, flag) = all_except_option_helper(str, str_list, [], false)
    in
        if flag then SOME ans else NONE
    end

fun get_substitutions1(substitutions: string list list, s: string) = 
    case substitutions of
        [] => []
        | substitution::rest_of_substitutions =>
            case all_except_option(s, substitution) of
            NONE => get_substitutions1(rest_of_substitutions, s)
            | SOME candidate => 
                candidate @ get_substitutions1(rest_of_substitutions, s)
                
fun get_substitutions2(substitutions: string list list, s: string) =
 let
   fun get_substitutions_helper(substitutions, s, ans) =
        case substitutions of
        [] => ans
        | substitution::rest_of_substitutions => 
        case all_except_option(s, substitution) of
            NONE => get_substitutions_helper(rest_of_substitutions, s, ans)
            | SOME candidate => 
                get_substitutions_helper(rest_of_substitutions, s, ans @ candidate)
 in
   get_substitutions_helper(substitutions, s, [])
 end

 fun similar_names(substitutions: string list list, {first=f, middle=m, last=l}) =
    let 
    val full_name = {first=f, middle=m, last=l}
    val candidate = get_substitutions1(substitutions, f)
    fun similar_names_helper(candidate) =
      case candidate of
        [] => []
        | candidate_head::candidate_rest => 
            ({first=candidate_head, middle=m, last=l})::similar_names_helper(candidate_rest)
    in
    full_name::similar_names_helper(candidate)
    end

fun card_color((c_suit, _): card) = 
    case c_suit of
        Hearts => Red
        | Diamonds => Red
        | _ => Black

fun card_value((_, c_rank): card) =
    case c_rank of
        Ace => 11
        | Num i => i
        | _ => 10

fun remove_card(cs: card list, c: card, ex: exn) = 
    let
      fun remove_card_helper(cs, c, ex, card_removed: bool) =
        if card_removed
        then cs
        else case cs of
                [] => raise ex
                | cs_hd::cs_tl => if cs_hd = c
                                  then remove_card_helper(cs_tl, c, ex, true)
                                  else cs_hd::remove_card_helper(cs_tl, c, ex, false)
    in
      remove_card_helper(cs, c, ex, false)
    end

fun all_same_color(cs: card list) =
    case cs of
    [] => true
    | c::[] => true
    | c1::(c2::cs_rest) => 
        card_color(c1) = card_color(c2) andalso all_same_color(c2::cs_rest)

fun sum_cards(cs: card list) = 
    let
        fun sum_cards_helper(cs, acc) = 
            case cs of
                [] => acc
                | cs_hd::cd_tl => sum_cards_helper(cd_tl, acc + card_value(cs_hd))
    in
        sum_cards_helper(cs, 0)
    end

fun score(cs: card list, goal: int) = 
    let
      val sum  = sum_cards(cs)
      val preliminary_score = if sum > goal
                              then 3 * (sum - goal)
                              else goal - sum  
    in
      if all_same_color(cs)
      then preliminary_score div 2
      else preliminary_score
    end

fun officiate(cs: card list, ms: move list, goal: int) =
    let
      fun officiate_helper(cs, ms, goal, held_cards: card list) = 
        case ms of
        [] => score(held_cards, goal)
        | ms_hd::ms_tl =>
            case ms_hd of
            Discard c => officiate_helper(cs, ms_tl, goal, remove_card(held_cards, c, IllegalMove))
            | Draw => case cs of
                    [] => score(held_cards, goal)
                    | cs_hd::cs_tail => if sum_cards(cs_hd::held_cards) > goal 
                                        then  score(cs_hd::held_cards, goal)
                                        else officiate_helper(cs_tail, ms_tl, goal, cs_hd::held_cards)
    in
      officiate_helper(cs, ms, goal, [])
    end

(* Extra credit *)
(* fun score_challenge(cs: card list, goal: int) =  *)