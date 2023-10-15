# Kien Ta
require_relative 'color_transform'

class CircularSegment < ColorTransform
  attr_accessor :x_radius, :y_radius, :theta_a, :theta_z
  def initialize(x_radius, y_radius, theta_a, theta_z, x: 0, y: 0, color: nil)
    super(x, y, color)
    @x_radius = x_radius
    @y_radius = y_radius
    @theta_a = theta_a
    @theta_z = theta_z
  end

  private
  def calculate_local_bounds
    raise StandardError.new("not yet implemented")
  end
  def render_transformed
    slice_count = 32
    delta_theta = (theta_z - theta_a) / slice_count
    theta = theta_a
    glBegin(GL_POLYGON)
    (slice_count + 1).times do
      glVertex2f(x_radius * Math.cos(theta), y_radius * Math.sin(theta))
      theta += delta_theta
    end
    glEnd()
  end
end



if __FILE__==$0
  require_relative '../core/render_app'
  x_radius = 0.6
  y_radius = 0.8
  theta_a = Math::PI/4
  theta_z = (3*Math::PI)/4
  app = RenderApp.new(CircularSegment.new(x_radius, y_radius, theta_a, theta_z))
  app.main_loop
end
