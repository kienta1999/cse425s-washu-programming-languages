# Kien Ta

require_relative 'point2'
require_relative 'color_transform'

# https://en.wikipedia.org/wiki/B%C3%A9zier_curve#Quadratic_B%C3%A9zier_curves
class BezierCurve < ColorTransform
  attr_accessor :control_points
  # array of Point2
  def initialize(control_points, x: 0, y: 0, color: nil)
    super(x, y, color)
    @control_points = control_points
  end

  private
  def calculate_local_bounds
    raise StandardError.new("not yet implemented")
  end

  def render_transformed
    flat_xyzs = []
    control_points.each do |p|
      flat_xyzs.push(p.x)
      flat_xyzs.push(p.y)
      flat_xyzs.push(0.0)
    end

    control_data = flat_xyzs.pack("f*")

    glMap1f(GL_MAP1_VERTEX_3, 0.0, 1.0, 3, control_points.length, control_data)
    glEnable(GL_MAP1_VERTEX_3)
    glBegin(GL_LINE_STRIP)
    resolution_of_curve = 48
    resolution_of_curve.times do |i|
      glEvalCoord1f(i.to_f / resolution_of_curve)
    end
    glEvalCoord1d(1.0)
    glEnd()


    #draw the control points
    # glPointSize(8.0)
    # glBegin(GL_POINTS)
    # control_points.each do |p|
    #   glVertex2f(p.x, p.y);
    # end
    # glEnd()

  end
end



if __FILE__==$0
  require_relative '../core/render_app'
  control_points = [
      Point2.new(-0.5, -0.5),
      Point2.new(0.0, +0.5),
      Point2.new(0.5, -0.5)
  ]
  app = RenderApp.new(BezierCurve.new(control_points))
  app.main_loop
end
