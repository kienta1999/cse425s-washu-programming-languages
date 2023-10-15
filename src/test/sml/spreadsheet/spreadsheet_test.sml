(* Dennis Cosgrove *)
structure TestSpreadsheet :> TEST_SPREADSHEET = struct
    open Csv
    open Spreadsheet
    open UnitTesting

    val nums_csv = "1,2,3,4\n10,20,30,40"
    val nums_string_list_list = [["1", "2", "3", "4"], ["10", "20", "30", "40"]]
    val grades_csv = "Name,Java List,SML Calendar,SML Hearts,SML Card Game,Java HOF,SML Binary Tree,SML Pattern Matching\nMax,100,104,100,104,100,100,105\nJoshua Bloch,100,85,80,75,100,70,65\nHarry Q. Bovik,80,81,82,83,84,85,86\nDan Grossman,75,104,100,104,80,100,105\nShannon O'Ganns,70,40,0,120,120,130,140"
    val grades_string_list_list = [["Name", "Java List", "SML Calendar", "SML Hearts", "SML Card Game", "Java HOF", "SML Binary Tree", "SML Pattern Matching"], ["Max", "100", "104", "100", "104", "100", "100", "105"], ["Joshua Bloch", "100", "85", "80", "75", "100", "70", "65"], ["Harry Q. Bovik", "80", "81", "82", "83", "84", "85", "86"], ["Dan Grossman", "75", "104", "100", "104", "80", "100", "105"], ["Shannon O'Ganns", "70", "40", "0", "120", "120", "130", "140"]]
    val hockey_csv = "Name,Uniform Number,Birth Year,Games Played,Goals,Assists\nBobby Orr,4,1948,657,270,645\nWayne Gretzky,99,1961,1487,894,1963\nMario Lemieux,66,1965,915,690,1033"
    val hockey_string_list_list = [["Name", "Uniform Number", "Birth Year", "Games Played", "Goals", "Assists"], ["Bobby Orr", "4", "1948", "657", "270", "645"], ["Wayne Gretzky", "99", "1961", "1487", "894", "1963"], ["Mario Lemieux", "66", "1965", "915", "690", "1033"]]

    fun test_read_csv() =
        let
			fun assert_read_csv_with_argument_text(expected, csv_text, argument_text) =
				let
					val actual = read_csv(csv_text)
				in
					StringTest.assertListListEqualsWithMessage(expected, actual, "read_csv(" ^ argument_text ^ ")")
				end

			fun assert_read_csv(expected, csv_text) =
				let
					fun to_quoted_newline_handling_string(text) =
						"\"" ^ (String.translate Char.toString text) ^ "\""
				in
					assert_read_csv_with_argument_text(expected, csv_text, "read_csv(" ^ to_quoted_newline_handling_string(csv_text) ^ ")")
				end

		    val name_rank_serial_csv = "name,rank,serial\nDwight David Eisenhower,General,5\nVasily Zaitsev,Sniper,225\nGrace Hopper,Rear Admiral,1952"
		    val name_rank_serial_string_list_list = [["name","rank","serial"],["Dwight David Eisenhower","General","5"],["Vasily Zaitsev","Sniper","225"], ["Grace Hopper", "Rear Admiral", "1952"]]
        in
			( enter("create_sheet") 
				(* 
				 * NOTE: very reasonable implementations of read_csv can come up with different results for "" so I have opted not to test it at all.
				 *)
				; assert_read_csv([["1"]], "1")
				; assert_read_csv([["1"],["2"]], "1\n2")
				; assert_read_csv([["",""]], ",")
				; assert_read_csv([["1","2","3","4"]], "1,2,3,4")
				; assert_read_csv_with_argument_text(nums_string_list_list, nums_csv, "nums_csv")
				; assert_read_csv_with_argument_text(grades_string_list_list, grades_csv, "grades_csv")
				; assert_read_csv_with_argument_text(hockey_string_list_list, hockey_csv, "hockey_csv")
				; assert_read_csv_with_argument_text(name_rank_serial_string_list_list, name_rank_serial_csv, "name_rank_serial_csv")
			; leave()
			)
        end
    
    val nums_spreadsheet = [[VALUE(1), VALUE(2), VALUE(3), VALUE(4)], [VALUE(10), VALUE(20), VALUE(30), VALUE(40)]]
    val grades_spreadsheet = [[TEXT("Name"), TEXT("Java List"), TEXT("SML Calendar"), TEXT("SML Hearts"), TEXT("SML Card Game"), TEXT("Java HOF"), TEXT("SML Binary Tree"), TEXT("SML Pattern Matching")], [TEXT("Max"), VALUE(100), VALUE(104), VALUE(100), VALUE(104), VALUE(100), VALUE(100), VALUE(105)], [TEXT("Joshua Bloch"), VALUE(100), VALUE(85), VALUE(80), VALUE(75), VALUE(100), VALUE(70), VALUE(65)], [TEXT("Harry Q. Bovik"), VALUE(80), VALUE(81), VALUE(82), VALUE(83), VALUE(84), VALUE(85), VALUE(86)], [TEXT("Dan Grossman"), VALUE(75), VALUE(104), VALUE(100), VALUE(104), VALUE(80), VALUE(100), VALUE(105)], [TEXT("Shannon O'Ganns"), VALUE(70), VALUE(40), VALUE(0), VALUE(120), VALUE(120), VALUE(130), VALUE(140)]]
    val hockey_spreadsheet = [[TEXT("Name"), TEXT("Uniform Number"), TEXT("Birth Year"), TEXT("Games Played"), TEXT("Goals"), TEXT("Assists")], [TEXT("Bobby Orr"), VALUE(4), VALUE(1948), VALUE(657), VALUE(270), VALUE(645)], [TEXT("Wayne Gretzky"), VALUE(99), VALUE(1961), VALUE(1487), VALUE(894), VALUE(1963)], [TEXT("Mario Lemieux"), VALUE(66), VALUE(1965), VALUE(915), VALUE(690), VALUE(1033)]]

    fun test_create_sheet() =
		let
			fun assert_create_sheet_with_argument_text(expected, csv_list_list, argument_text) =
				let
					val actual = create_sheet(csv_list_list)
				in
					CellTest.assertListListEqualsWithMessage(expected, actual, "create_sheet(" ^ argument_text ^ ")")
				end

			fun assert_create_sheet(expected, csv_list_list) =
				assert_create_sheet_with_argument_text(expected, csv_list_list, StringTest.toListListString(csv_list_list))

		in
			( enter("create_sheet") 
				; assert_create_sheet([], [])
				; assert_create_sheet([[EMPTY]], [[""]])
				; assert_create_sheet([[VALUE(1)]], [["1"]])
				; assert_create_sheet([[TEXT("fred")]], [["fred"]])
				; assert_create_sheet([[TEXT("fred"), TEXT("george")]],[["fred", "george"]])
				; assert_create_sheet_with_argument_text(nums_spreadsheet, nums_string_list_list, "nums_string_list_list")
				; assert_create_sheet_with_argument_text(grades_spreadsheet, grades_string_list_list, "grades_string_list_list")
				; assert_create_sheet_with_argument_text(hockey_spreadsheet, hockey_string_list_list, "hockey_string_list_list")
			; leave()
			)
		end

    fun test_row_count() =
		let
			fun assert_row_count_with_argument_text(expected, sheet, argument_text) =
				let
					val actual = row_count(sheet)
				in
					IntTest.assertEqualsWithMessage(expected, actual, "row_count(" ^ argument_text ^ ")")
				end

			fun assert_row_count(expected, sheet) =
				assert_row_count_with_argument_text(expected, sheet, CellTest.toListListString(sheet))
		in
			( enter("row_count") 
				; assert_row_count(0, [])
				; assert_row_count_with_argument_text(2, nums_spreadsheet, "nums_spreadsheet")
				; assert_row_count_with_argument_text(6, grades_spreadsheet, "grades_spreadsheet")
				; assert_row_count_with_argument_text(4, hockey_spreadsheet, "hockey_spreadsheet")
			; leave()
			)
		end

    fun test_column_count() =
		let
			fun assert_column_count_with_argument_text(expected, sheet, argument_text) =
				let
					val actual = column_count(sheet)
				in
					IntTest.assertEqualsWithMessage(expected, actual, "column_count(" ^ argument_text ^ ")")
				end

			fun assert_column_count(expected, sheet) =
				assert_column_count_with_argument_text(expected, sheet, CellTest.toListListString(sheet))
		in
			( enter("column_count") 
				; assert_column_count(0, [])
				; assert_column_count_with_argument_text(4, nums_spreadsheet, "nums_spreadsheet")
				; assert_column_count_with_argument_text(8, grades_spreadsheet, "grades_spreadsheet")
				; assert_column_count_with_argument_text(6, hockey_spreadsheet, "hockey_spreadsheet")
			; leave()
			)
		end

    fun test_cell_at() =
		let
			fun assert_cell_at_with_argument_text(expected, sheet, row_index, col_index, argument_text) =
				let
					val actual = cell_at(sheet, row_index, col_index)
				in
					CellTest.assertEqualsWithMessage(expected, actual, "cell_at(" ^ argument_text ^ ", " ^ Int.toString(row_index) ^ ", "  ^ Int.toString(col_index) ^ ")")
				end

		in
			( enter("cell_at") 
				; assert_cell_at_with_argument_text(TEXT("Name"), hockey_spreadsheet, 0, 0, "hockey_spreadsheet")
				; assert_cell_at_with_argument_text(TEXT("Uniform Number"), hockey_spreadsheet, 0, 1, "hockey_spreadsheet")
				; assert_cell_at_with_argument_text(TEXT("Birth Year"), hockey_spreadsheet, 0, 2, "hockey_spreadsheet")
				; assert_cell_at_with_argument_text(TEXT("Games Played"), hockey_spreadsheet, 0, 3, "hockey_spreadsheet")
				; assert_cell_at_with_argument_text(TEXT("Goals"), hockey_spreadsheet, 0, 4, "hockey_spreadsheet")
				; assert_cell_at_with_argument_text(TEXT("Assists"), hockey_spreadsheet, 0, 5, "hockey_spreadsheet")

				; assert_cell_at_with_argument_text(TEXT("Bobby Orr"), hockey_spreadsheet, 1, 0, "hockey_spreadsheet")
				; assert_cell_at_with_argument_text(VALUE(4), hockey_spreadsheet, 1, 1, "hockey_spreadsheet")
				; assert_cell_at_with_argument_text(VALUE(1948), hockey_spreadsheet, 1, 2, "hockey_spreadsheet")
				; assert_cell_at_with_argument_text(VALUE(657), hockey_spreadsheet, 1, 3, "hockey_spreadsheet")
				; assert_cell_at_with_argument_text(VALUE(270), hockey_spreadsheet, 1, 4, "hockey_spreadsheet")
				; assert_cell_at_with_argument_text(VALUE(645), hockey_spreadsheet, 1, 5, "hockey_spreadsheet")
			; leave()
			)
		end

    fun test_row_at() =
        ( enter("row_at") 
			; CellTest.assertListEquals( [VALUE(1), VALUE(2), VALUE(3), VALUE(4)], row_at(nums_spreadsheet, 0))
			; CellTest.assertListEquals( [VALUE(10), VALUE(20), VALUE(30), VALUE(40)], row_at(nums_spreadsheet, 1))

			; CellTest.assertListEquals( [TEXT("Name"), TEXT("Java List"), TEXT("SML Calendar"), TEXT("SML Hearts"), TEXT("SML Card Game"), TEXT("Java HOF"), TEXT("SML Binary Tree"), TEXT("SML Pattern Matching")], row_at(grades_spreadsheet, 0))
			; CellTest.assertListEquals( [TEXT("Max"), VALUE(100), VALUE(104), VALUE(100), VALUE(104), VALUE(100), VALUE(100), VALUE(105)], row_at(grades_spreadsheet, 1))
			; CellTest.assertListEquals( [TEXT("Joshua Bloch"), VALUE(100), VALUE(85), VALUE(80), VALUE(75), VALUE(100), VALUE(70), VALUE(65)], row_at(grades_spreadsheet, 2))
			; CellTest.assertListEquals( [TEXT("Harry Q. Bovik"), VALUE(80), VALUE(81), VALUE(82), VALUE(83), VALUE(84), VALUE(85), VALUE(86)], row_at(grades_spreadsheet, 3))
			; CellTest.assertListEquals( [TEXT("Dan Grossman"), VALUE(75), VALUE(104), VALUE(100), VALUE(104), VALUE(80), VALUE(100), VALUE(105)], row_at(grades_spreadsheet, 4))
			; CellTest.assertListEquals( [TEXT("Shannon O'Ganns"), VALUE(70), VALUE(40), VALUE(0), VALUE(120), VALUE(120), VALUE(130), VALUE(140)], row_at(grades_spreadsheet, 5))

			; CellTest.assertListEquals( [TEXT("Name"), TEXT("Uniform Number"), TEXT("Birth Year"), TEXT("Games Played"), TEXT("Goals"), TEXT("Assists")], row_at(hockey_spreadsheet, 0))
			; CellTest.assertListEquals( [TEXT("Bobby Orr"), VALUE(4), VALUE(1948), VALUE(657), VALUE(270), VALUE(645)], row_at(hockey_spreadsheet, 1))
			; CellTest.assertListEquals( [TEXT("Wayne Gretzky"), VALUE(99), VALUE(1961), VALUE(1487), VALUE(894), VALUE(1963)], row_at(hockey_spreadsheet, 2))
			; CellTest.assertListEquals( [TEXT("Mario Lemieux"), VALUE(66), VALUE(1965), VALUE(915), VALUE(690), VALUE(1033)], row_at(hockey_spreadsheet, 3))
        ; leave()
		)

    fun test_column_at() =
        ( enter("column_at") 
			; CellTest.assertListEquals([VALUE(1), VALUE(10)], column_at(nums_spreadsheet, 0))
			; CellTest.assertListEquals([VALUE(2), VALUE(20)], column_at(nums_spreadsheet, 1))
			; CellTest.assertListEquals([VALUE(3), VALUE(30)], column_at(nums_spreadsheet, 2))
			; CellTest.assertListEquals([VALUE(4), VALUE(40)], column_at(nums_spreadsheet, 3))

			; CellTest.assertListEquals([TEXT("Name"), TEXT("Max"), TEXT("Joshua Bloch"), TEXT("Harry Q. Bovik"), TEXT("Dan Grossman"), TEXT("Shannon O'Ganns")], column_at(grades_spreadsheet, 0))
			; CellTest.assertListEquals([TEXT("Java List"), VALUE(100), VALUE(100), VALUE(80), VALUE(75), VALUE(70)], column_at(grades_spreadsheet, 1))
			; CellTest.assertListEquals([TEXT("SML Calendar"), VALUE(104), VALUE(85), VALUE(81), VALUE(104), VALUE(40)], column_at(grades_spreadsheet, 2))
			; CellTest.assertListEquals([TEXT("SML Hearts"), VALUE(100), VALUE(80), VALUE(82), VALUE(100), VALUE(0)], column_at(grades_spreadsheet, 3))
			; CellTest.assertListEquals([TEXT("SML Card Game"), VALUE(104), VALUE(75), VALUE(83), VALUE(104), VALUE(120)], column_at(grades_spreadsheet, 4))
			; CellTest.assertListEquals([TEXT("Java HOF"), VALUE(100), VALUE(100), VALUE(84), VALUE(80), VALUE(120)], column_at(grades_spreadsheet, 5))
			; CellTest.assertListEquals([TEXT("SML Binary Tree"), VALUE(100), VALUE(70), VALUE(85), VALUE(100), VALUE(130)], column_at(grades_spreadsheet, 6))
			; CellTest.assertListEquals([TEXT("SML Pattern Matching"), VALUE(105), VALUE(65), VALUE(86), VALUE(105), VALUE(140)], column_at(grades_spreadsheet, 7))

			; CellTest.assertListEquals( [TEXT("Name"), TEXT("Bobby Orr"), TEXT("Wayne Gretzky"), TEXT("Mario Lemieux")], column_at(hockey_spreadsheet, 0))
			; CellTest.assertListEquals( [TEXT("Uniform Number"), VALUE(4), VALUE(99), VALUE(66)], column_at(hockey_spreadsheet, 1))
			; CellTest.assertListEquals( [TEXT("Birth Year"), VALUE(1948), VALUE(1961), VALUE(1965)], column_at(hockey_spreadsheet, 2))
			; CellTest.assertListEquals( [TEXT("Games Played"), VALUE(657), VALUE(1487), VALUE(915)], column_at(hockey_spreadsheet, 3))
			; CellTest.assertListEquals( [TEXT("Goals"), VALUE(270), VALUE(894), VALUE(690)], column_at(hockey_spreadsheet, 4))
			; CellTest.assertListEquals( [TEXT("Assists"), VALUE(645), VALUE(1963), VALUE(1033)], column_at(hockey_spreadsheet, 5))
        ; leave()
    	)

    fun test_sum_values_in_row() =
        ( enter("sum_values_in_row") 
			; IntTest.assertEquals(0, sum_values_in_row([[EMPTY]], 0))
			; IntTest.assertEquals(0, sum_values_in_row([[TEXT("fred")]], 0))
			; IntTest.assertEquals(425, sum_values_in_row([[VALUE(425)]], 0))
			; IntTest.assertEquals(425, sum_values_in_row([[EMPTY, VALUE(425), TEXT("fred")]], 0))
			; IntTest.assertEquals(656, sum_values_in_row([[VALUE(425), VALUE(231)]], 0))

			; IntTest.assertEquals(10, sum_values_in_row(nums_spreadsheet, 0))
			; IntTest.assertEquals(100, sum_values_in_row(nums_spreadsheet, 1))

			; IntTest.assertEquals(0, sum_values_in_row(grades_spreadsheet, 0))
			; IntTest.assertEquals(713, sum_values_in_row(grades_spreadsheet, 1))
			; IntTest.assertEquals(575, sum_values_in_row(grades_spreadsheet, 2))
			; IntTest.assertEquals(581, sum_values_in_row(grades_spreadsheet, 3))
			; IntTest.assertEquals(668, sum_values_in_row(grades_spreadsheet, 4))
			; IntTest.assertEquals(620, sum_values_in_row(grades_spreadsheet, 5))

			; IntTest.assertEquals(0, sum_values_in_row(hockey_spreadsheet, 0))
			; IntTest.assertEquals(3524, sum_values_in_row(hockey_spreadsheet, 1))
			; IntTest.assertEquals(6404, sum_values_in_row(hockey_spreadsheet, 2))
			; IntTest.assertEquals(4669, sum_values_in_row(hockey_spreadsheet, 3))
        ; leave()
    	)

    fun test_sum_values_in_column() =
        ( enter("sum_values_in_column") 
			; IntTest.assertEquals(11, sum_values_in_column(nums_spreadsheet, 0))
			; IntTest.assertEquals(22, sum_values_in_column(nums_spreadsheet, 1))
			; IntTest.assertEquals(33, sum_values_in_column(nums_spreadsheet, 2))
			; IntTest.assertEquals(44, sum_values_in_column(nums_spreadsheet, 3))

			; IntTest.assertEquals(0, sum_values_in_column(grades_spreadsheet, 0))
			; IntTest.assertEquals(425, sum_values_in_column(grades_spreadsheet, 1))
			; IntTest.assertEquals(414, sum_values_in_column(grades_spreadsheet, 2))
			; IntTest.assertEquals(362, sum_values_in_column(grades_spreadsheet, 3))
			; IntTest.assertEquals(486, sum_values_in_column(grades_spreadsheet, 4))
			; IntTest.assertEquals(484, sum_values_in_column(grades_spreadsheet, 5))
			; IntTest.assertEquals(485, sum_values_in_column(grades_spreadsheet, 6))
			; IntTest.assertEquals(501, sum_values_in_column(grades_spreadsheet, 7))

			; IntTest.assertEquals(0, sum_values_in_column(hockey_spreadsheet, 0))
			; IntTest.assertEquals(169, sum_values_in_column(hockey_spreadsheet, 1))
			; IntTest.assertEquals(5874, sum_values_in_column(hockey_spreadsheet, 2))
			; IntTest.assertEquals(3059, sum_values_in_column(hockey_spreadsheet, 3))
        ; leave()
    	)

    fun test_max_value_in_row() =
        ( enter("max_value_in_row") 
			; IntTest.assertOptionEquals(NONE, max_value_in_row([[EMPTY]], 0))
			; IntTest.assertOptionEquals(NONE, max_value_in_row([[TEXT("fred")]], 0))
			; IntTest.assertOptionEquals(SOME(425), max_value_in_row([[VALUE(425)]], 0))
			; IntTest.assertOptionEquals(SOME(425), max_value_in_row([[EMPTY, VALUE(425), TEXT("fred")]], 0))
			; IntTest.assertOptionEquals(SOME(425), max_value_in_row([[VALUE(425), VALUE(231)]], 0))
			; IntTest.assertOptionEquals(SOME(425), max_value_in_row([[VALUE(231), VALUE(425)]], 0))

			; IntTest.assertOptionEquals(SOME(4), max_value_in_row(nums_spreadsheet, 0))
			; IntTest.assertOptionEquals(SOME(40), max_value_in_row(nums_spreadsheet, 1))

			; IntTest.assertOptionEquals(NONE, max_value_in_row(grades_spreadsheet, 0))
			; IntTest.assertOptionEquals(SOME(105), max_value_in_row(grades_spreadsheet, 1))
			; IntTest.assertOptionEquals(SOME(100), max_value_in_row(grades_spreadsheet, 2))
			; IntTest.assertOptionEquals(SOME(86), max_value_in_row(grades_spreadsheet, 3))
			; IntTest.assertOptionEquals(SOME(105), max_value_in_row(grades_spreadsheet, 4))
			; IntTest.assertOptionEquals(SOME(140), max_value_in_row(grades_spreadsheet, 5))

			; IntTest.assertOptionEquals(NONE, max_value_in_row(hockey_spreadsheet, 0))
			; IntTest.assertOptionEquals(SOME(1948), max_value_in_row(hockey_spreadsheet, 1))
			; IntTest.assertOptionEquals(SOME(1963), max_value_in_row(hockey_spreadsheet, 2))
			; IntTest.assertOptionEquals(SOME(1965), max_value_in_row(hockey_spreadsheet, 3))
        ; leave()
    	)

    fun test_max_value_in_column() =
        ( enter("max_value_in_column") 
			; IntTest.assertOptionEquals(SOME(10), max_value_in_column(nums_spreadsheet, 0))
			; IntTest.assertOptionEquals(SOME(20), max_value_in_column(nums_spreadsheet, 1))
			; IntTest.assertOptionEquals(SOME(30), max_value_in_column(nums_spreadsheet, 2))
			; IntTest.assertOptionEquals(SOME(40), max_value_in_column(nums_spreadsheet, 3))

			; IntTest.assertOptionEquals(NONE, max_value_in_column(grades_spreadsheet, 0))
			; IntTest.assertOptionEquals(SOME(100), max_value_in_column(grades_spreadsheet, 1))
			; IntTest.assertOptionEquals(SOME(104), max_value_in_column(grades_spreadsheet, 2))
			; IntTest.assertOptionEquals(SOME(100), max_value_in_column(grades_spreadsheet, 3))
			; IntTest.assertOptionEquals(SOME(120), max_value_in_column(grades_spreadsheet, 4))
			; IntTest.assertOptionEquals(SOME(120), max_value_in_column(grades_spreadsheet, 5))
			; IntTest.assertOptionEquals(SOME(130), max_value_in_column(grades_spreadsheet, 6))
			; IntTest.assertOptionEquals(SOME(140), max_value_in_column(grades_spreadsheet, 7))

			; IntTest.assertOptionEquals(NONE, max_value_in_column(hockey_spreadsheet, 0))
			; IntTest.assertOptionEquals(SOME(99), max_value_in_column(hockey_spreadsheet, 1))
			; IntTest.assertOptionEquals(SOME(1965), max_value_in_column(hockey_spreadsheet, 2))
			; IntTest.assertOptionEquals(SOME(1487), max_value_in_column(hockey_spreadsheet, 3))
			; IntTest.assertOptionEquals(SOME(894), max_value_in_column(hockey_spreadsheet, 4))
			; IntTest.assertOptionEquals(SOME(1963), max_value_in_column(hockey_spreadsheet, 5))
        ; leave()
    	)

    fun is_extra(cell) = 
        case cell of
            EMPTY => false
        |  TEXT(_) => false
        | VALUE(v) => v > 100

    fun is_even(cell) = 
        case cell of
            EMPTY => false
        |  TEXT(_) => false
        | VALUE(v) => (v mod 2) = 0

    fun count_if_is_greater_than_max(column_index : int) : int =
        let
            fun is_greater_than_max(max) = 
                fn(cell) => 
                    case cell of
                        EMPTY => false
                    |  TEXT(_) => false
                    | VALUE(v) => v > max

            fun value_of_max(column_index : int) : int = 
                case cell_at(grades_spreadsheet, 1, column_index) of
                        EMPTY => raise Fail("exprected value; actual EMPTY")
                    |  TEXT(s) => raise Fail("exprected value; actual TEXT(\"" ^ s ^ "\")" )
                    | VALUE(v) => v
        in
            count_if_in_column(grades_spreadsheet, column_index, is_greater_than_max(value_of_max(column_index)))
        end

    fun test_count_if_in_row() =
        ( enter("count_if_in_row")
			; IntTest.assertEquals(2, count_if_in_row(nums_spreadsheet, 0, is_even))
			; IntTest.assertEquals(4, count_if_in_row(nums_spreadsheet, 1, is_even))

			; IntTest.assertEquals(0, count_if_in_row(grades_spreadsheet, 0, is_extra))
			; IntTest.assertEquals(3, count_if_in_row(grades_spreadsheet, 1, is_extra))
			; IntTest.assertEquals(0, count_if_in_row(grades_spreadsheet, 2, is_extra))
			; IntTest.assertEquals(0, count_if_in_row(grades_spreadsheet, 3, is_extra))
			; IntTest.assertEquals(3, count_if_in_row(grades_spreadsheet, 4, is_extra))
			; IntTest.assertEquals(4, count_if_in_row(grades_spreadsheet, 5, is_extra))

			; IntTest.assertEquals(0, count_if_in_row(hockey_spreadsheet, 0, is_even))
			; IntTest.assertEquals(3, count_if_in_row(hockey_spreadsheet, 1, is_even))
			; IntTest.assertEquals(1, count_if_in_row(hockey_spreadsheet, 2, is_even))
			; IntTest.assertEquals(2, count_if_in_row(hockey_spreadsheet, 3, is_even))
        ; leave()
    	)

    fun test_count_if_in_column() =
        ( enter("count_if_in_column")
			; IntTest.assertEquals(1, count_if_in_column(nums_spreadsheet, 0, is_even))
			; IntTest.assertEquals(2, count_if_in_column(nums_spreadsheet, 1, is_even))
			; IntTest.assertEquals(1, count_if_in_column(nums_spreadsheet, 2, is_even))
			; IntTest.assertEquals(2, count_if_in_column(nums_spreadsheet, 3, is_even))

			; IntTest.assertEquals(0, count_if_in_column(grades_spreadsheet, 0, is_extra))
			; IntTest.assertEquals(0, count_if_in_column(grades_spreadsheet, 1, is_extra))
			; IntTest.assertEquals(2, count_if_in_column(grades_spreadsheet, 2, is_extra))
			; IntTest.assertEquals(0, count_if_in_column(grades_spreadsheet, 3, is_extra))
			; IntTest.assertEquals(3, count_if_in_column(grades_spreadsheet, 4, is_extra))
			; IntTest.assertEquals(1, count_if_in_column(grades_spreadsheet, 5, is_extra))
			; IntTest.assertEquals(1, count_if_in_column(grades_spreadsheet, 6, is_extra))
			; IntTest.assertEquals(3, count_if_in_column(grades_spreadsheet, 7, is_extra))

			; IntTest.assertEquals(0, count_if_in_column(hockey_spreadsheet, 0, is_even))
			; IntTest.assertEquals(2, count_if_in_column(hockey_spreadsheet, 1, is_even))
			; IntTest.assertEquals(1, count_if_in_column(hockey_spreadsheet, 2, is_even))
			; IntTest.assertEquals(0, count_if_in_column(hockey_spreadsheet, 3, is_even))
			; IntTest.assertEquals(3, count_if_in_column(hockey_spreadsheet, 4, is_even))
			; IntTest.assertEquals(0, count_if_in_column(hockey_spreadsheet, 5, is_even))

			; IntTest.assertEquals(0, count_if_is_greater_than_max(1))
			; IntTest.assertEquals(0, count_if_is_greater_than_max(2))
			; IntTest.assertEquals(0, count_if_is_greater_than_max(3))
			; IntTest.assertEquals(1, count_if_is_greater_than_max(4))
			; IntTest.assertEquals(1, count_if_is_greater_than_max(5))
			; IntTest.assertEquals(1, count_if_is_greater_than_max(6))
			; IntTest.assertEquals(1, count_if_is_greater_than_max(7))
        ; leave()
    	)

    fun test_all_but_to_dictionaries() =
        ( test_read_csv()
		; test_create_sheet()
        ; test_row_count()
        ; test_column_count()
        ; test_cell_at()
        ; test_row_at()
        ; test_column_at()
        ; test_sum_values_in_row()
        ; test_sum_values_in_column()
        ; test_max_value_in_row()
        ; test_max_value_in_column()
        ; test_count_if_in_row()
        ; test_count_if_in_column()
	    )

    fun test_to_dictionaries() =
        let
            val _ = enter("to_dictionaries_using_headers_as_keys")

            val nums_dicts = to_dictionaries_using_headers_as_keys(nums_spreadsheet)
            val _ = IntTest.assertEquals(1, List.length(nums_dicts))
            val nums_dict_a = List.nth(nums_dicts, 0)
            
            val grades_dicts = to_dictionaries_using_headers_as_keys(grades_spreadsheet)
            val _ = IntTest.assertEquals(5, List.length(grades_dicts))
            val grades_dict_a = List.nth(grades_dicts, 0)
            val grades_dict_b = List.nth(grades_dicts, 1)
            val grades_dict_c = List.nth(grades_dicts, 2)
            val grades_dict_d = List.nth(grades_dicts, 3)
            val grades_dict_e = List.nth(grades_dicts, 4)

            val hockey_dicts = to_dictionaries_using_headers_as_keys(hockey_spreadsheet)
            val _ = IntTest.assertEquals(3, List.length(hockey_dicts))
            val hockey_dict_a = List.nth(hockey_dicts, 0)
            val hockey_dict_b = List.nth(hockey_dicts, 1)
            val hockey_dict_c = List.nth(hockey_dicts, 2)
        in
            	( CellTest.assertOptionEquals(SOME(VALUE(10)), SingleChainedDictionary.get(nums_dict_a, VALUE(1)))
				; CellTest.assertOptionEquals(SOME(VALUE(20)), SingleChainedDictionary.get(nums_dict_a, VALUE(2)))
				; CellTest.assertOptionEquals(SOME(VALUE(30)), SingleChainedDictionary.get(nums_dict_a, VALUE(3)))
				; CellTest.assertOptionEquals(SOME(VALUE(40)), SingleChainedDictionary.get(nums_dict_a, VALUE(4)))
				; CellTest.assertOptionEquals(NONE, SingleChainedDictionary.get(nums_dict_a, TEXT("NOT A HEADER")))


				; CellTest.assertOptionEquals(SOME(TEXT("Max")), SingleChainedDictionary.get(grades_dict_a, TEXT("Name")))
				; CellTest.assertOptionEquals(SOME(VALUE(100)), SingleChainedDictionary.get(grades_dict_a, TEXT("Java List")))
				; CellTest.assertOptionEquals(SOME(VALUE(104)), SingleChainedDictionary.get(grades_dict_a, TEXT("SML Calendar")))
				; CellTest.assertOptionEquals(SOME(VALUE(100)), SingleChainedDictionary.get(grades_dict_a, TEXT("SML Hearts")))
				; CellTest.assertOptionEquals(SOME(VALUE(104)), SingleChainedDictionary.get(grades_dict_a, TEXT("SML Card Game")))
				; CellTest.assertOptionEquals(SOME(VALUE(100)), SingleChainedDictionary.get(grades_dict_a, TEXT("Java HOF")))
				; CellTest.assertOptionEquals(SOME(VALUE(100)), SingleChainedDictionary.get(grades_dict_a, TEXT("SML Binary Tree")))
				; CellTest.assertOptionEquals(SOME(VALUE(105)), SingleChainedDictionary.get(grades_dict_a, TEXT("SML Pattern Matching")))
				; CellTest.assertOptionEquals(NONE, SingleChainedDictionary.get(grades_dict_a, TEXT("NOT A HEADER")))

				; CellTest.assertOptionEquals(SOME(TEXT("Joshua Bloch")), SingleChainedDictionary.get(grades_dict_b, TEXT("Name")))
				; CellTest.assertOptionEquals(SOME(VALUE(100)), SingleChainedDictionary.get(grades_dict_b, TEXT("Java List")))
				; CellTest.assertOptionEquals(SOME(VALUE(85)), SingleChainedDictionary.get(grades_dict_b, TEXT("SML Calendar")))
				; CellTest.assertOptionEquals(SOME(VALUE(80)), SingleChainedDictionary.get(grades_dict_b, TEXT("SML Hearts")))
				; CellTest.assertOptionEquals(SOME(VALUE(75)), SingleChainedDictionary.get(grades_dict_b, TEXT("SML Card Game")))
				; CellTest.assertOptionEquals(SOME(VALUE(100)), SingleChainedDictionary.get(grades_dict_b, TEXT("Java HOF")))
				; CellTest.assertOptionEquals(SOME(VALUE(70)), SingleChainedDictionary.get(grades_dict_b, TEXT("SML Binary Tree")))
				; CellTest.assertOptionEquals(SOME(VALUE(65)), SingleChainedDictionary.get(grades_dict_b, TEXT("SML Pattern Matching")))
				; CellTest.assertOptionEquals(NONE, SingleChainedDictionary.get(grades_dict_a, TEXT("NOT A HEADER")))

				; CellTest.assertOptionEquals(SOME(TEXT("Shannon O'Ganns")), SingleChainedDictionary.get(grades_dict_e, TEXT("Name")))
				; CellTest.assertOptionEquals(SOME(VALUE(70)), SingleChainedDictionary.get(grades_dict_e, TEXT("Java List")))
				; CellTest.assertOptionEquals(SOME(VALUE(40)), SingleChainedDictionary.get(grades_dict_e, TEXT("SML Calendar")))
				; CellTest.assertOptionEquals(SOME(VALUE(0)), SingleChainedDictionary.get(grades_dict_e, TEXT("SML Hearts")))
				; CellTest.assertOptionEquals(SOME(VALUE(120)), SingleChainedDictionary.get(grades_dict_e, TEXT("SML Card Game")))
				; CellTest.assertOptionEquals(SOME(VALUE(120)), SingleChainedDictionary.get(grades_dict_e, TEXT("Java HOF")))
				; CellTest.assertOptionEquals(SOME(VALUE(130)), SingleChainedDictionary.get(grades_dict_e, TEXT("SML Binary Tree")))
				; CellTest.assertOptionEquals(SOME(VALUE(140)), SingleChainedDictionary.get(grades_dict_e, TEXT("SML Pattern Matching")))
				; CellTest.assertOptionEquals(NONE, SingleChainedDictionary.get(grades_dict_a, TEXT("NOT A HEADER")))

				; CellTest.assertOptionEquals(SOME(TEXT("Bobby Orr")), SingleChainedDictionary.get(hockey_dict_a, TEXT("Name")))
				; CellTest.assertOptionEquals(SOME(VALUE(4)), SingleChainedDictionary.get(hockey_dict_a, TEXT("Uniform Number")))
				; CellTest.assertOptionEquals(SOME(VALUE(1948)), SingleChainedDictionary.get(hockey_dict_a, TEXT("Birth Year")))
				; CellTest.assertOptionEquals(SOME(VALUE(657)), SingleChainedDictionary.get(hockey_dict_a, TEXT("Games Played")))
				; CellTest.assertOptionEquals(SOME(VALUE(270)), SingleChainedDictionary.get(hockey_dict_a, TEXT("Goals")))
				; CellTest.assertOptionEquals(SOME(VALUE(645)), SingleChainedDictionary.get(hockey_dict_a, TEXT("Assists")))
				; CellTest.assertOptionEquals(NONE, SingleChainedDictionary.get(hockey_dict_a, TEXT("NOT A HEADER")))


				; CellTest.assertOptionEquals(SOME(TEXT("Wayne Gretzky")), SingleChainedDictionary.get(hockey_dict_b, TEXT("Name")))
				; CellTest.assertOptionEquals(SOME(VALUE(99)), SingleChainedDictionary.get(hockey_dict_b, TEXT("Uniform Number")))
				; CellTest.assertOptionEquals(SOME(VALUE(1961)), SingleChainedDictionary.get(hockey_dict_b, TEXT("Birth Year")))
				; CellTest.assertOptionEquals(SOME(VALUE(1487)), SingleChainedDictionary.get(hockey_dict_b, TEXT("Games Played")))
				; CellTest.assertOptionEquals(SOME(VALUE(894)), SingleChainedDictionary.get(hockey_dict_b, TEXT("Goals")))
				; CellTest.assertOptionEquals(SOME(VALUE(1963)), SingleChainedDictionary.get(hockey_dict_b, TEXT("Assists")))
				; CellTest.assertOptionEquals(NONE, SingleChainedDictionary.get(hockey_dict_b, TEXT("NOT A HEADER")))


				; CellTest.assertOptionEquals(SOME(TEXT("Mario Lemieux")), SingleChainedDictionary.get(hockey_dict_c, TEXT("Name")))
				; CellTest.assertOptionEquals(SOME(VALUE(66)), SingleChainedDictionary.get(hockey_dict_c, TEXT("Uniform Number")))
				; CellTest.assertOptionEquals(SOME(VALUE(1965)), SingleChainedDictionary.get(hockey_dict_c, TEXT("Birth Year")))
				; CellTest.assertOptionEquals(SOME(VALUE(915)), SingleChainedDictionary.get(hockey_dict_c, TEXT("Games Played")))
				; CellTest.assertOptionEquals(SOME(VALUE(690)), SingleChainedDictionary.get(hockey_dict_c, TEXT("Goals")))
				; CellTest.assertOptionEquals(SOME(VALUE(1033)), SingleChainedDictionary.get(hockey_dict_c, TEXT("Assists")))
				; CellTest.assertOptionEquals(NONE, SingleChainedDictionary.get(hockey_dict_c, TEXT("NOT A HEADER")))

            ; leave()
            )
        end       
end
