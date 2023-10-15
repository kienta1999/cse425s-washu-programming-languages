# Dennis Cosgrove

class IntRange
  attr_reader :min_inclusive, :max_exclusive

  def initialize(min_inclusive, max_exclusive)
    @min_inclusive = min_inclusive
    @max_exclusive = max_exclusive
  end

  def each
    v = @min_inclusive
    while v < @max_exclusive
      yield v
      v += 1
    end
  end
end

if __FILE__ == $0
  sum = 0
  IntRange.new(0, 101).each { |x| sum += x }
  puts sum
end