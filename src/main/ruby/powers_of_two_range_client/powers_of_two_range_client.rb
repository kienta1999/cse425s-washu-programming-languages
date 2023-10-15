# Dennis Cosgrove
require_relative '../powers_of_two_range/powers_of_two_range'

puts "exclusive"
puts "========="

exclusive_powers_of_two = PowersOfTwoRange.new(64)
exclusive_powers_of_two.each do |n|
  puts n
end

puts
puts "inclusive"
puts "========="

inclusive_powers_of_two = PowersOfTwoRange.new(64, inclusive: true)
inclusive_powers_of_two.each do |n|
  puts n
end

puts
puts "exclusive (blockless each returns enum)"
puts "======================================="
as_enum = exclusive_powers_of_two.each
p as_enum.to_a

puts
puts "exclusive (with index)"
puts "======================"
exclusive_powers_of_two.each_with_index do |n, index|
  puts "#{n}, #{index}"
end

