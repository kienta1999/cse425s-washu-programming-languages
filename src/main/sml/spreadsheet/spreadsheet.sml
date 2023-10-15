(* Kien Ta *)
(* Dennis Cosgrove *)
structure Spreadsheet :> SPREADSHEET = struct

    datatype cell = EMPTY | TEXT of string | VALUE of int
    type sheet = cell list list

    fun create_sheet(word_lists : string list list) : sheet =
        let
          fun string_to_cell(entry: string) : cell =
            (case entry of
               "" => EMPTY
             | entry_str => (case Int.fromString(entry_str) of
                            NONE => TEXT(entry_str)
                            | SOME entry_int => VALUE(entry_int))
            )
        in
          case word_lists of
            [] => []
            | row::tail_word_lists => (List.map string_to_cell row)::create_sheet(tail_word_lists)
        end

    fun row_count(s : sheet) : int =
        List.length s

    fun column_count(s : sheet) : int = 
        case s of
           [] => 0
         | hd_s::_ => List.length(hd_s)

    fun row_at(s : sheet, row_index : int) : cell list = 
        List.nth(s, row_index)

    fun cell_in_row_at_column_index( r : cell list, col_index : int) : cell = 
        List.nth(r, col_index)

    fun cell_at(s : sheet, row_index : int, col_index : int) : cell = 
        cell_in_row_at_column_index(row_at(s, row_index), col_index)

    fun column_at(s : sheet, col_index : int) : cell list =
        List.map (fn(row) => cell_in_row_at_column_index(row, col_index)) s

    fun sum_values_in_cell_list(cells : cell list) : int =
        List.foldl 
            (fn(cell, init) => case cell of
            VALUE(int_val) => int_val + init
            | pat2 => init)
            0 cells

    fun sum_values_in_row(s : sheet, row_index : int) : int =
        sum_values_in_cell_list(row_at(s, row_index))

    fun sum_values_in_column(s : sheet, column_index : int) : int =
        sum_values_in_cell_list(column_at(s, column_index))

    fun max_value_in_cell_list(cells : cell list) : int option =
        let
          val ans = List.foldl 
            (fn(cell, init) => case cell of
            VALUE(int_val) => Int.max(int_val, init)
            | pat2 => init)
            ~9999999 cells
        in
          if ans = ~9999999 then NONE else SOME(ans)
        end

    fun max_value_in_row(s : sheet, row_index : int) : int option =
        max_value_in_cell_list(row_at(s, row_index))

    fun max_value_in_column(s : sheet, column_index : int) : int option =
        max_value_in_cell_list(column_at(s, column_index))

    fun count_if_in_cell_list(cells : cell list, predicate : (cell -> bool)) : int = 
        List.foldl 
            (fn(curr_cell, init) => (if predicate(curr_cell) then 1 + init else init)) 0 cells

    fun count_if_in_row(s : sheet, row_index : int, predicate : (cell -> bool)) : int = 
        count_if_in_cell_list(row_at(s, row_index), predicate)

    fun count_if_in_column(s : sheet, col_index : int, predicate : (cell -> bool)) : int = 
        count_if_in_cell_list(column_at(s, col_index), predicate)

    fun to_dictionaries_using_headers_as_keys(s : sheet) : (cell,cell) SingleChainedDictionary.dictionary list =
        let
            val header = hd(s)
            val rest = tl(s)
            val num_count = row_count(s)
            fun row_to_dict(row: cell list): (cell,cell) SingleChainedDictionary.dictionary =
                let
                    val dict = SingleChainedDictionary.create()
                    val _ = List.map (fn(curr_header, curr_cell) => 
                                        SingleChainedDictionary.put(dict, curr_header, curr_cell))
                                     (ListPair.zip(header, row))
                in
                    dict
                end
        in
          List.map row_to_dict rest
        end
        
end
