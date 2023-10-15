# puts Stack

class Stack
  def initialize
    @array = []
  end

  def push(o)
    @array.push(o)
  end

  def pop
    @array.pop
  end

  def peek
    @array.last
  end

  #freeze
end
