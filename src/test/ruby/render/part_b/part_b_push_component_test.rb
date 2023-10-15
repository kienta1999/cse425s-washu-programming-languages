require "test/unit"

require_relative '../../../../main/ruby/render/assignment/scene'
require_relative '../../../../main/ruby/render/assignment/composite_transform'
require_relative '../../../../main/ruby/render/assignment/equilateral_triangle'
require_relative '../../../../main/ruby/render/assignment/rectangle'
require_relative '../../../../main/ruby/render/assignment/ellipse'
require_relative '../../../../main/ruby/render/assignment/circular_segment'

class PartBPushComponentTest < Test::Unit::TestCase
  def test_composite_transform_default
    composite_transform = CompositeTransform.new
    assert_equal([], composite_transform.components)
  end

  def test_scene_default
    scene = Scene.new
    assert_equal([], scene.components)
  end

  def test_composite_transform_mutation
    check_mutation(CompositeTransform.new)
  end

  def test_scene_mutation
    check_mutation(Scene.new)
  end

  private

  def check_mutation(composite)
    assert_equal([], composite.components)

    equilateral_triangle = EquilateralTriangle.new(0.1)
    composite.push_component(equilateral_triangle)
    assert_equal([equilateral_triangle], composite.components)

    rectangle = Rectangle.new(0.2, 0.3)
    composite.push_component(rectangle)
    assert_equal([equilateral_triangle, rectangle], composite.components)

    ellipse = Ellipse.new(0.4, 0.5)
    composite.push_component(ellipse)
    assert_equal([equilateral_triangle, rectangle, ellipse], composite.components)

    child_transform = CompositeTransform.new
    assert_equal([], child_transform.components)

    circular_segment = CircularSegment.new(0.6, 0.7, Math::PI/4, Math::PI/3)
    child_transform.push_component(circular_segment)
    assert_equal([circular_segment], child_transform.components)


    composite.push_component(child_transform)
    assert_equal([equilateral_triangle, rectangle, ellipse, child_transform], composite.components)
  end
end