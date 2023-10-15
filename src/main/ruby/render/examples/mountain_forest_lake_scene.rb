require_relative '../assignment/composite_transform'
require_relative '../assignment/equilateral_triangle'
require_relative '../assignment/rectangle'
require_relative '../assignment/ellipse'
require_relative '../assignment/bezier_curve'
require_relative '../assignment/circular_segment'
require_relative '../assignment/scene'

class Tree < CompositeTransform
  def initialize(x, y)
    super(x: x, y: y)
    push_component(Rectangle.new(0.01, 0.025, x: 0, y: -0.05, color: Color.new(0.39, 0.26, 0.12)))
    push_component(EquilateralTriangle.new(0.05, x: 0, y: 0, color: Color.new(0, 1, 0)))
  end
end

class Forest < CompositeTransform
  def initialize(x, y)
    super(x: x, y: y)
    r = Random.new(231425)
    24.times do
      x = r.rand(-0.5..0.5)
      y = r.rand(-0.9..0.9)
      push_component(Tree.new(x, y))
    end
  end
end

class Sailboat < CompositeTransform
  def initialize(x, y)
    super(x: x, y: y)
    push_component(EquilateralTriangle.new(0.05, x: 0, y: 0, color: Color.new(1, 1, 1)))
    push_component(CircularSegment.new(0.075, 0.075, -3*Math::PI/4, -Math::PI/4, x: 0, y: 0.025, color: Color.new(0, 0, 0)))
  end
end

class Lake < CompositeTransform
  def initialize(x, y)
    super(x: x, y: y)
    push_component(Ellipse.new(0.45, 0.3, x: 0, y: 0, color: Color.new(0.5, 0.5, 1)))
    push_component(Sailboat.new(0.1, -0.05))
  end
end

class Mountain < CompositeTransform
  def initialize(x, y)
    super(x: x, y: y)
    push_component(EquilateralTriangle.new(0.45, x: 0, y: 0, color: Color.new(0.25, 0, 0.5)))
    push_component(EquilateralTriangle.new(0.1, x: 0, y: 0.4, color: Color.new(1, 1, 1)))
  end
end


class MountainForestLakeScene < Scene
  def initialize
    super(background_color: Color.new(0.1, 0.3, 0.1))
    push_component(Forest.new(0.5, 0.0))
    push_component(BezierCurve.new([
                                       Point2.new(0.1, -0.25),
                                       Point2.new(0.025, 0.125),
                                       Point2.new(-0.025, -0.25),
                                       Point2.new(-0.1, 0.25)
                                   ], x: -0.6, y: 0, color: Color.new(0.5, 0.5, 1)))
    push_component(Lake.new(-0.5, -0.5))
    push_component(Mountain.new(-0.6, 0.4))
  end

end

if __FILE__ == $0
  require_relative '../core/render_app'
  app = RenderApp.new(MountainForestLakeScene.new)
  app.main_loop
end