# Kien Ta

require_relative 'transform'
require_relative '../core/color'

class ColorTransform < Transform
  attr_accessor :color
  def initialize(x, y, color)
    super(x, y)
    @color = color
  end

  def render
    if !color.nil?
      glColor3f(color.red, color.green, color.blue)
    end
    super
  end
end
