require_relative 'point2d'

class CartesianPoint2d < Point2d
  attr_reader :x, :y
  def initialize(x,y)
    @x = x
    @y = y
  end

  def to_s
    "(#{@x}, #{@y})"
  end
end