require_relative '../stack/stack'

s = Stack.new
s.push(4)
s.push(66)
s.push(99)

puts "peek: #{s.peek}"
puts ""
puts " pop: #{s.pop}"
puts " pop: #{s.pop}"
puts " pop: #{s.pop}"
puts " pop: #{s.pop}"
