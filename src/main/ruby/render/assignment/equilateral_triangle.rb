# Kien Ta
require_relative 'color_transform'
require_relative 'bounds'

class EquilateralTriangle < ColorTransform
  attr_accessor :half_side_length
  def initialize(half_side_length, x: 0, y: 0, color: nil)
    super(x, y, color)
    @half_side_length = half_side_length
    self.calculate_local_bounds
  end

  def height
    half_side_length * Math.sqrt(3)
  end

  private
  def calculate_local_bounds
    min = Point2.new(-half_side_length, -1.0/3 * height)
    max = Point2.new(half_side_length, 2.0/3 * height)
    @bound = Bounds.new(min, max)
    @bound
  end

  def render_transformed
    glBegin(GL_TRIANGLES)
    glVertex2d(0, 2.0/3 * height)
    glVertex2d(-half_side_length, -1.0/3 * height)
    glVertex2d(half_side_length, -1.0/3 * height)
    glEnd()
  end
end


if __FILE__ == $0
  require_relative '../core/render_app'
  half_side_length = 0.5
  app = RenderApp.new(EquilateralTriangle.new(half_side_length))
  app.main_loop
end
