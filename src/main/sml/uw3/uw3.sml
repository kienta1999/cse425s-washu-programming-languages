(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

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

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

(* Kien Ta *)

fun only_capitals string_lists =
    List.filter (fn element => Char.isUpper(String.sub(element, 0))) string_lists

fun longest_string1 string_lists =
      List.foldl (fn(x, init) => if String.size x > String.size init then x else init)
                 ""
                 string_lists

fun longest_string2 string_lists =
      List.foldl (fn(x, init) => if String.size x >= String.size init then x else init)
                 ""
                 string_lists

fun longest_string_helper comparator string_lists =
      List.foldl (fn(x, init) => if comparator(String.size x, String.size init) then x else init)
                 ""
                 string_lists

val longest_string3 = longest_string_helper (fn(a, b) => a > b)

val longest_string4 = longest_string_helper (fn(a, b) => a >= b)

val longest_capitalized = longest_string1 o only_capitals

val rev_string = String.implode o List.rev o String.explode 

fun first_answer f my_list =
    case my_list of
       [] => raise NoAnswer
     | list_hd::list_tl => case f list_hd of
                              SOME value => value
                            | NONE => first_answer f list_tl

fun all_answers f my_list = 
    let
      val not_has_none = List.foldl (fn(x, init) => case f x of
                                                SOME _ => init
                                                | NONE => false)
                                     true
                                     my_list
    in
      if not_has_none
      then SOME (List.foldl (fn(x, init) => valOf(f(x)) @ init) [] my_list)
      else NONE
    end

val count_wildcards = g (fn () => 1) (fn x => 0) 
(* count_wildcards( TupleP([Wildcard, UnitP, Wildcard, Variable("Kien"), TupleP([Wildcard]) ] ) ); *)

val count_wild_and_variable_lengths = g (fn () => 1) String.size

fun count_some_var(str, p) = g (fn () => 0) (fn (x) => if x = str then 1 else 0) p
(* count_some_var ("x", TupleP([Wildcard, UnitP, Wildcard, Variable("x"), TupleP([Variable("x")]) ] )); *)

fun check_pat p = 
    let
        fun list_of_strings p init =
            case p of
            Variable x        => x::init
            | TupleP ps         => List.foldl (fn (p,i) => list_of_strings p i) init ps
            | ConstructorP(_,p) => list_of_strings p init
            | _                 => init
        fun has_exists init =
            case init of
            [] => true
            | hd_init::tl_init => not (List.exists (fn e => e = hd_init) tl_init)
    in
        has_exists(list_of_strings p [])
    end
(* check_pat (TupleP([Wildcard, UnitP, Wildcard, Variable("x"), TupleP([Variable("x")]) ] )); *)
(* check_pat (TupleP[Variable "x",ConstructorP ("wild",Wildcard), Variable "y"]); *)
(* check_pat (TupleP[TupleP[Variable "x",ConstructorP ("wild",Wildcard)],Wildcard]) *)

fun match(value, p) = 
    case p of
	    Wildcard          => SOME([])
	  | Variable s        => SOME([(s, value)])
	  | UnitP             => if value = Unit then SOME([]) else NONE
      | ConstP i          => (case value of
                                Const(i2) => if i = i2 then SOME([]) else NONE
                                | _ => NONE)
      | TupleP ps         => (case value of
                                Tuple(value_list) => if List.length ps = List.length value_list
                                                     then all_answers match (ListPair.zip(value_list, ps))
                                                     else NONE
                                | _ => NONE)
	  | ConstructorP(s1,p) => (case value of
                                Constructor(s2, value) => if s1 = s2 
                                                          then match(value, p)
                                                          else NONE
                                | _ => NONE)

fun first_match value patterns =
    SOME(first_answer (fn(p) => match(value, p)) patterns)
    handle NoAnswer => NONE
