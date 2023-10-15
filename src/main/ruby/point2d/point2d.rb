class Point2d
  def x
    raise "override method: #{__method__} on class: #{self.class}"
  end

  def y
    raise "override method: #{__method__} on class: #{self.class}"
  end

  def distance_from_origin
    Math.sqrt(x * x + y * y)
  end
end