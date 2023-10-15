# Kien Ta
require_relative 'color_transform'
require_relative 'bounds'

class Rectangle < ColorTransform
  attr_accessor :half_width, :half_height
  def initialize(half_width, half_height, x: 0, y: 0, color: nil)
    super(x, y, color)
    @half_width = half_width
    @half_height = half_height
    self.calculate_local_bounds
  end

  private
  def render_transformed
    glBegin(GL_QUADS)
    glVertex2d(-half_width, -half_height)
    glVertex2d(half_width, -half_height)
    glVertex2d(half_width, half_height)
    glVertex2d(-half_width, half_height)
    glEnd()
  end

  def calculate_local_bounds
    min = Point2.new(-half_width, -half_height)
    max = Point2.new(half_width, half_height)
    @bound = Bounds.new(min, max)
    @bound
  end
end



if __FILE__==$0
  require_relative '../core/render_app'
  phi = 1.618
  half_height = 0.5
  half_width = phi*half_height
  app = RenderApp.new(Rectangle.new(half_width, half_height))
  app.main_loop
end
