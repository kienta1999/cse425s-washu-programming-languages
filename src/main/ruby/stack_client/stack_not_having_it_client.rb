require_relative '../stack/stack'

class Stack
  # def unshift(o)
  #   @array.unshift(o)
  # end
  #
  # def [](index)
  #   @array[index]
  # end

  private
  def method_missing(id, *args)
    if @array.respond_to?(id)
      @array.send(id, *args)
    else
      super
    end
  end
end

if __FILE__ == $0
  s = Stack.new
  s.push(425)
  s.push(231)
  puts s.unshift(131)
  puts s[1]
end

