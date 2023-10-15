require_relative 'point2d'

class PolarPoint2d < Point2d
  attr_reader :radius, :theta

  def initialize(radius, theta)
    @radius = radius
    @theta = theta
  end

  def x
    @radius * Math.cos(@theta)
  end

  def y
    @radius * Math.sin(@theta)
  end

  def distance_from_origin
    @radius
  end

  def to_s
    "(r: #{@radius}, θ: #{@theta})"
  end
end