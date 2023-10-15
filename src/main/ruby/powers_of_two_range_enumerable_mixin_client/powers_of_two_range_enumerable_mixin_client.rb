# Dennis Cosgrove
require_relative '../powers_of_two_range/powers_of_two_range'


exclusive_powers_of_two = PowersOfTwoRange.new(425)

puts "map"
puts "==="
texts = exclusive_powers_of_two.map do |value|
  "*** #{value} ***"
end
p texts

puts
puts "select"
puts "======"
perfect_squares = exclusive_powers_of_two.select do |value|
  square_root = Math.sqrt(value)
  square_root == square_root.to_i
end
p perfect_squares
