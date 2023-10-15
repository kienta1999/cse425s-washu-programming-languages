# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

# Kien Ta
# require_relative './uw6provided'

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here
  All_My_Pieces = All_Pieces.dup

  # your enhancements here
  New_Pieces = [
    # xx
    # xxx
    rotations([[-1, -1], [0, -1], [-1, 0], [0, 0], [1, 0]]),
    # x
    # xx
    rotations([[-1, 0], [0, 0], [0, 1]]),
    # longer (only needs two)
    [[[-2, 0], [-1, 0], [0,0], [1, 0], [2, 0]],
     [[0, -2], [0, -1], [0,0], [0, 1], [0, 2]]],
  ]
  All_My_Pieces.concat(New_Pieces)

  def self.next_piece (board)
    MyPiece.new(All_My_Pieces.sample, board)
  end


end

class MyBoard < Board
  # your enhancements here

  def initialize (game)
    super
    @current_block = MyPiece.next_piece(self)
    @cheat = false
  end

  def rotate_180
    self.rotate_clockwise
    self.rotate_clockwise
  end

  def cheat
    if !@cheat && score >= 100
      @cheat = true
      @score -= 100
    end
  end

  def next_piece
    if @cheat
      @current_block = MyPiece.new([[[0, 0]]], self)
    else
      @current_block = MyPiece.next_piece(self)
    end
    @current_pos = nil
    @cheat = false
  end

  def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    (0..locations.size - 1).each{|index|
      current = locations[index];
      @grid[current[1]+displacement[1]][current[0]+displacement[0]] =
        @current_pos[index]
    }
    remove_filled
    @delay = [@delay - 2, 80].max
  end
  
end

class MyTetris < Tetris
  # your enhancements here
  def key_bindings
    super
    @root.bind('u', proc {@board.rotate_180})
    @root.bind('c', proc {@board.cheat})
  end

  def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end
end


