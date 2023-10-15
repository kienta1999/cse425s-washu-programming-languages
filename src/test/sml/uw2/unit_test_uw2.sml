CM.make "../../../core/sml/repr/repr.cm";
CM.make "../unit_test/unit_test.cm";
use "../../../main/sml/uw2/uw2.sml";

signature TEST_UW2 = sig
    val test_complete : unit -> unit
end

structure TestUW2 :> TEST_UW2 = struct
    open UnitTest

    fun assertRaises_IllegalMove(thunk) = 
        ( thunk()
        ; failure("should raise IllegalMove") )
        handle IllegalMove => success("raises IllegalMove")

	fun full_name_to_string(a : { first : string, middle : string, last : string }) =
		#first a ^ " " ^ #middle a ^ " " ^ #last a

	fun full_name_to_repr(a : { first : string, middle : string, last : string }) =
		Repr.S(full_name_to_string(a))

	val full_name_list_to_string = (Repr.toString o (Repr.listToRepr full_name_to_repr))

	fun card_to_string(s : suit, r : rank) =
		let
			fun suit_to_string(s : suit) =
				case s of
				Spades => "Spades"
				| Clubs => "Clubs"
				| Diamonds => "Diamonds"
				| Hearts => "Hearts"
			fun rank_to_string(r : rank) =
				case r of
				Num v => "Num " ^ Int.toString(v)
				| Jack => "Jack"
				| Queen => "Queen"
				| King => "King"
				| Ace => "Ace"
		in
			"(" ^ suit_to_string(s) ^ "," ^ rank_to_string(r) ^ ")"
		end

	fun card_to_repr(c : card) =
		Repr.S(card_to_string(c))

	val card_list_to_string = (Repr.toString o (Repr.listToRepr card_to_repr))

    fun card_compare((a_suit : suit, a_rank : rank), (b_suit : suit, b_rank : rank)) : bool =
        let
            fun suit_to_int Clubs = 0 |
                suit_to_int Diamonds = 1 |
                suit_to_int Hearts = 2 |
                suit_to_int Spades = 3

            fun rank_to_int (Num v) = v |
                rank_to_int Jack = 100 |
                rank_to_int Queen = 200 |
                rank_to_int King = 300 |
                rank_to_int Ace = 400
        in
            if suit_to_int(a_suit) < suit_to_int(b_suit)
            then true
            else rank_to_int(a_rank) < rank_to_int(b_rank)
        end

	fun color_to_string(c : color) =
		case c of
		Black => "Black"
		| Red => "Red"

	fun move_to_repr(m : move) =
		Repr.S(
			case m of
				Draw => "Draw"
			| Discard(c) => "Discard(" ^ card_to_string(c) ^ ")"
		)
	val move_list_to_string = (Repr.toString o (Repr.listToRepr move_to_repr))

    fun full_name_compare({first=af:string,middle=am:string,last=al:string},{first=bf:string,middle=bm:string,last=bl:string}) = 
        if af=bf
        then 
            if am=bm
            then al>bl
            else am>bm
        else af>bf
    
	val assertEquals_FullNameList = assertEquals full_name_list_to_string
	val assertEqualsAnyOrder_FullNameList = assertEqualsAnyOrder full_name_list_to_string full_name_compare
	val assertEquals_Color = assertEquals color_to_string
	val assertEquals_CardList = assertEquals card_list_to_string
	val assertEqualsAnyOrder_CardList = assertEqualsAnyOrder card_list_to_string card_compare
	val assertEquals_MoveList = assertEquals move_list_to_string

    

    fun test_all_except_option() =
        ( enter("all_except_option")
            ; assertEqualsAnyOrder_StringListOption(SOME [], all_except_option ("string", ["string"]))
            
        ; leave() )

    fun test_get_substitutions1() =
        ( enter("get_substitutions1")
            ; assertEqualsAnyOrder_StringList([], get_substitutions1 ([["foo"],["there"]], "foo"))
            
        ; leave() )

    fun test_get_substitutions2() =
        ( enter("get_substitutions2")
            ; assertEqualsAnyOrder_StringList([], get_substitutions2 ([["foo"],["there"]], "foo"))
            
        ; leave() )

    fun test_similar_names() =
        ( enter("similar_names")
            ; assertEqualsAnyOrder_FullNameList([
                {first="Fred", last="Smith", middle="W"}, 
                {first="Fredrick", last="Smith", middle="W"},
                {first="Freddie", last="Smith", middle="W"}, 
                {first="F", last="Smith", middle="W"}], 
                similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}))
        ; leave() )

    fun test_card_color() =
        ( enter("card_color")
            ; assertEquals_Color(Black, card_color (Clubs, Num 2))
            
        ; leave() )

    fun test_card_value() =
        ( enter("card_value")
            ; assertEquals_Int(2, card_value (Clubs, Num 2))
            
        ; leave() )

    fun test_remove_card() =
        ( enter("remove_card")
            ; assertEqualsAnyOrder_CardList([], remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove))
            
        ; leave() )

    fun test_all_same_color() =
        ( enter("all_same_color")
            ; assertTrue(all_same_color([(Hearts, Ace), (Hearts, Ace)]))
            
        ; leave() )

    fun test_sum_cards() =
        ( enter("sum_cards")
            ; assertEquals_Int(4, sum_cards([(Clubs, Num 2),(Clubs, Num 2)]))
            
        ; leave() )

    fun test_score() =
        ( enter("score")
            ; assertEquals_Int(4, score([(Hearts, Num 2),(Clubs, Num 4)],10))
        ; leave() )
    
    fun test_officiate() =
        ( enter("officiate")
            ; assertEquals_Int(6, officiate([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15))
            ; assertEquals_Int(3, officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)], [Draw,Draw,Draw,Draw,Draw], 42))
            ; assertRaises_IllegalMove (fn() => officiate([(Clubs,Jack),(Spades,Num(8))], [Draw,Discard(Hearts,Jack)], 42))
        ; leave() )

    fun test_score_challenge() =
        ( enter("score_challenge")
            ; assertEquals_Int(4, score_challenge([(Hearts, Num 2),(Clubs, Num 4)],10))
        ; leave() )

    fun test_officiate_challenge() =
        ( enter("officiate_challenge")
            ; assertEquals_Int(6, officiate_challenge([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15))
            ; assertEquals_Int(3, officiate_challenge([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)], [Draw,Draw,Draw,Draw,Draw], 42))
            
        ; leave() )

    fun test_careful_player() =
        ( enter("careful_player")
            ; assertEquals_MoveList([], careful_player([], 0))
            
        ; leave() )

    fun test_complete() =
        ( test_all_except_option()
        ; test_get_substitutions1()
        ; test_get_substitutions2()
        ; test_similar_names()
        ; test_card_color()
        ; test_card_value()
        ; test_remove_card()
        ; test_all_same_color()
        ; test_sum_cards()
        ; test_score()
        ; test_officiate()
        ; test_score_challenge()
        ; test_officiate_challenge()
        ; test_careful_player() )
end

val _ = ( UnitTest.processCommandLineArgs()
        ; TestUW2.test_complete()
        ; OS.Process.exit(OS.Process.success)
        )
