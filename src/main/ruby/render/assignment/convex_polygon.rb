require_relative 'color_transform'
require_relative 'bounds'
require_relative 'point2'

class ConvexPolygon < ColorTransform
  attr_accessor :points
  def initialize(points, x: 0, y: 0, color: nil)
    super(x, y, color)
    @points = points
    self.calculate_local_bounds
  end

  private
  def render_transformed
    glBegin(GL_POLYGON)
    points.each{ |point|
      glVertex2d(point.x, point.y)
    }
    glEnd()
  end
  def calculate_local_bounds
    @bound = Bounds.new(Point2.new(9999, 9999), Point2.new(-9999, -9999))
    @points.each { |point|
      @bound.min.x = [@bound.min.x, point.x].min
      @bound.min.y = [@bound.min.y, point.y].min
      @bound.max.x = [@bound.max.x, point.x].max
      @bound.max.y = [@bound.max.y, point.y].max
    }
    @bound
  end
end

if __FILE__ == $0
  require_relative '../core/render_app'
  points = [
    Point2.new(0.85, 0.0),
    Point2.new(0.1, 0.25),
    Point2.new(0.0, 0.45),
    Point2.new(0.15, 0.7),
    Point2.new(0.65, 1.0),
    Point2.new(0.95, 0.95),
    Point2.new(1.1, 0.75)
  ]

  app = RenderApp.new(ConvexPolygon.new(points, x: -0.5, y: -0.5, color: Color.new(1, 0, 0)))
  app.main_loop
end