datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank
type player = card list

(* Kien Ta *)
exception NotYetImplemented

fun is_card_valid((_, c_rank) : card) : bool =
    case c_rank of 
        Num i => i >= 2 andalso i <= 10
        | _ => true

fun are_all_cards_valid(taken_cards : card list) : bool =
	case taken_cards of
        [] => true
        | c :: other_cards => is_card_valid(c) andalso are_all_cards_valid(other_cards)
        

fun card_score(c : card) : int =
	case c of
        (Hearts, _) => 1
        | (Diamonds, Jack) => ~10
        | (Spades, Queen) => 13
        | _ => 0
            

fun total_score_of_card_list(cards : card list) : int =
	case cards of
        [] => 0
        | c :: other_cards => card_score(c) + total_score_of_card_list(other_cards)

fun total_score_of_player_list(players : player list) : int =
    let fun f(players, acc) =
        case players of
        [] => acc
        | cards :: other_players => f(other_players, acc + total_score_of_card_list(cards))
    in
      f(players, 0)
    end

fun total_card_count_for_all_players(players : player list) : int =
		case players of
        [] => 0
        | cards :: other_players => length(cards) + total_card_count_for_all_players(other_players)

fun is_correct_total_of_cards(players : player list) : bool =
	total_card_count_for_all_players(players) = 52

fun is_shenanigans_detected(players : player list) =
	total_score_of_player_list(players) <> 16
