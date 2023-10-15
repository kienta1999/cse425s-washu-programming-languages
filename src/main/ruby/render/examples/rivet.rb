require_relative '../assignment/composite_transform'
require_relative '../assignment/rectangle'
require_relative '../assignment/ellipse'
require_relative '../assignment/circular_segment'

class Rivet < CompositeTransform
  def initialize(x: 0, y: 0)
    super
    radius = 0.25
    push_component(CircularSegment.new(radius, radius, 0, Math::PI, x: 0.0, y: 0.0, color: Color.new(0, 0.5, 0),))
    half_width = radius - 0.1
    half_height = 0.3
    push_component(Rectangle.new(half_width, half_height, x: 0.0, y: -half_height, color: Color.new(1, 0.5, 0)))
  end
end

if __FILE__ == $0
  require_relative '../core/render_app'
  require_relative '../assignment/scene'

  class RivetScene < Scene
    def initialize
      super
      x0 = -0.5
      y = -0.5
      radius = 0.15
      3.times do |i|
        push_component(Ellipse.new(radius, radius, x: x0 + 0.5 * i, y: y, color: Color.new(0.5, 0.5, 1.0)))
      end
      push_component(Rivet.new(x: x0, y: 0.5))
    end
  end

  app = RenderApp.new(RivetScene.new)
  app.main_loop
end
