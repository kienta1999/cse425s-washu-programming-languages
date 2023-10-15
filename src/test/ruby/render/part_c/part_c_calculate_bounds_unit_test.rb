require "test/unit"

require_relative '../../../../main/ruby/render/assignment/point2'
require_relative '../../../../main/ruby/render/assignment/bounds'

require_relative '../../../../main/ruby/render/assignment/rectangle'
require_relative '../../../../main/ruby/render/assignment/ellipse'
require_relative '../../../../main/ruby/render/assignment/equilateral_triangle'
require_relative '../../../../main/ruby/render/assignment/convex_polygon'
require_relative '../../../../main/ruby/render/assignment/scene'
require_relative '../../../../main/ruby/render/assignment/composite_transform'

class PartCCalculateBoundsUnitTest < Test::Unit::TestCase
  def test_rectangle_bounds
    half_width = 2.0
    half_height = 3.0
    rect = Rectangle.new(half_width, half_height)
    check_bounds_and_moved_bounds(rect, -half_width, -half_height, half_width, half_height)
  end

  def test_ellipse_bounds
    x_radius = 4.0
    y_radius = 5.0
    rect = Ellipse.new(x_radius, y_radius)
    check_bounds_and_moved_bounds(rect, -x_radius, -y_radius, x_radius, y_radius)
  end

  def test_equilateral_triangle_bounds
    half_side_length = 0.5
    height = (Math.sqrt(3) * half_side_length)
    rect = EquilateralTriangle.new(half_side_length)
    check_bounds_and_moved_bounds(rect, -half_side_length, -(1.0/3.0)*height, half_side_length, (2.0/3.0)*height)
  end

  def test_convex_polygon_bounds
    points = [
        Point2.new(1.0, -2.0),
        Point2.new(-3.0, 1.0),
        Point2.new(-2.0, 5.0),
        Point2.new(2.0, 4.0),
        Point2.new(1.0, -1.0),
    ]
    polygon = ConvexPolygon.new(points)
    check_bounds_and_moved_bounds(polygon, -3.0, -2.0, 2.0, 5.0)
  end

  def test_composite_transform
    check_composite(CompositeTransform.new, :check_bounds_and_moved_bounds)
  end

  def test_scene
    check_composite(Scene.new, :check_bounds)
  end

  private

  def check_composite(composite, check_method_name)
    half_width = 2.0
    half_height = 3.0
    rect = Rectangle.new(half_width, half_height)
    composite.push_component(rect)
    send(check_method_name, composite, -half_width, -half_height, half_width, half_height)

    points = [
        Point2.new(10.0, 4.0),
        Point2.new(11.0, 5.0),
        Point2.new(12.0, 6.0),
    ]
    polygon = ConvexPolygon.new(points)
    check_bounds_and_moved_bounds(polygon, 10.0, 4.0, 12.0, 6.0)

    composite.push_component(polygon)
    send(check_method_name, composite, -half_width, -half_height, 12.0, 6.0)

    polygon.move(:left, 100)
    send(check_method_name, composite, -90.0, -half_height, half_width, 6.0)

    rect.move(:up, 100)
    send(check_method_name, composite, -90.0, 4, half_width, 103.0)
  end

  def check_bounds(instance, expected_min_x, expected_min_y, expected_max_x, expected_max_y)
    bounds_at_origin = instance.calculate_bounds
    assert_in_epsilon(expected_min_x, bounds_at_origin.min.x)
    assert_in_epsilon(expected_min_y, bounds_at_origin.min.y)
    assert_in_epsilon(expected_max_x, bounds_at_origin.max.x)
    assert_in_epsilon(expected_max_y, bounds_at_origin.max.y)
  end

  def check_bounds_and_moved_bounds(transform, expected_min_x, expected_min_y, expected_max_x, expected_max_y)
    check_bounds(transform, expected_min_x, expected_min_y, expected_max_x, expected_max_y)

    x = 4.0
    transform.move(:right, x)
    check_bounds(transform, expected_min_x+x, expected_min_y, expected_max_x+x, expected_max_y)

    y = 5.0
    transform.move(:up, y)
    check_bounds(transform, expected_min_x+x, expected_min_y+y, expected_max_x+x, expected_max_y+y)

    transform.move(:down, y)
    transform.move(:left, x)
  end
end