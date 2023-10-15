

class Vector2d

  attr_reader :x, :y

  def initialize(x, y)
    super()
    @x = x
    @y = y
  end

  def to_s
    "(#{x}, #{y})"
  end
end

class Point2d
  
  attr_reader :x, :y

  def initialize(x, y)
    super()
    @x = x
    @y = y
  end

  def to_s
    "(#{x}, #{y})"
  end
end

class ConvexHull
  attr_reader :boundary_points

  def initialize(pts)
    super()

    @boundary_points = compute_convex_hull(pts)
  end

  private

  def compute_convex_hull(pts)
    mid = pts[pts.length / 2]
    puts mid
    
    # TODO
    nil
  end
end

convex_hull = ConvexHull.new([Point2d.new(1, 2), Point2d.new(3, 4), Point2d.new(5, 6), Point2d.new(7, 8), Point2d.new(9, 0)])
