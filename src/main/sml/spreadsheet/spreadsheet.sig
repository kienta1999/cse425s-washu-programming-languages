(* Dennis Cosgrove *)
signature SPREADSHEET = sig
    datatype cell = EMPTY | TEXT of string | VALUE of int
    type sheet = cell list list

    val create_sheet : string list list -> sheet
    val row_count : sheet -> int
    val column_count : sheet -> int

    val cell_at : (sheet*int*int) -> cell

    val row_at : (sheet*int) -> cell list
    val column_at : (sheet*int) -> cell list

    val sum_values_in_row : (sheet*int) -> int
    val sum_values_in_column : (sheet*int) -> int

    val max_value_in_row : (sheet*int) -> int option
    val max_value_in_column : (sheet*int) -> int option

    val count_if_in_row : (sheet*int*(cell->bool)) -> int
    val count_if_in_column : (sheet*int*(cell->bool)) -> int

    val to_dictionaries_using_headers_as_keys : sheet -> (cell,cell) SingleChainedDictionary.dictionary list
end
