# def count_up_to_five(n)
#   prefix = "\t"*n
#   puts "#{prefix}enter count_up_to_five(#{n})"
#   if n < 5
#     puts "#{prefix}pre yield #{n}"
#     yield n
#     puts "#{prefix}post yield #{n}"
#     count_up_to_five(n + 1) do |value|
#       puts "#{prefix}\t<<< about to yield from block of recursive call to count_up_to_five(#{n + 1}): #{value}"
#       yield value
#     end
#   end
#   puts "#{prefix}leave count_up_to_five(#{n})"
# end

def count_up_to_five(n)
  if n < 5
    yield n
    count_up_to_five(n + 1) do |value|
      yield value
    end
  end
end

count_up_to_five(0) do |x|
  puts
  puts "*********************"
  puts "client received: #{x}"
  puts "*********************"
  puts
end
