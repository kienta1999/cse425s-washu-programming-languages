# Kien Ta
require_relative 'color_transform'
require_relative 'bounds'

class Ellipse < ColorTransform
  attr_accessor :x_radius, :y_radius, :theta_a, :theta_z
  def initialize(x_radius, y_radius, x: 0, y: 0, color: nil)
    super(x, y, color)
    @x_radius = x_radius
    @y_radius = y_radius
    self.calculate_local_bounds
  end

  private
  def calculate_local_bounds
    min = Point2.new(-x_radius, -y_radius)
    max = Point2.new(x_radius, y_radius)
    @bound = Bounds.new(min, max)
    @bound
  end

  def render_transformed
    slice_count = 32
    delta_theta = (2 * Math::PI) / slice_count
    theta = 0
    glBegin(GL_POLYGON)
    slice_count.times do
      glVertex2f(x_radius * Math.cos(theta), y_radius * Math.sin(theta))
      theta += delta_theta
    end
    glEnd()
  end
end



if __FILE__==$0
  require_relative '../core/render_app'
  x_radius = 0.3
  y_radius = 0.4
  app = RenderApp.new(Ellipse.new(x_radius, y_radius))
  app.main_loop
end
