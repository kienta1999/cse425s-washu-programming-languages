require "test/unit"

require_relative '../../../../main/ruby/render/assignment/equilateral_triangle'
require_relative '../../../../main/ruby/render/assignment/rectangle'
require_relative '../../../../main/ruby/render/assignment/ellipse'
require_relative '../../../../main/ruby/render/assignment/image'
require_relative '../../../../main/ruby/render/assignment/text'
require_relative '../../../../main/ruby/render/assignment/circular_segment'
require_relative '../../../../main/ruby/render/assignment/bezier_curve'

class PartAAccessorUnitTest < Test::Unit::TestCase
  def test_equilateral_triangle
    equilateral_triangle = EquilateralTriangle.new(0.3)
    assert_equal(0.3, equilateral_triangle.half_side_length)

    equilateral_triangle.half_side_length = 0.7
    assert_equal(0.7, equilateral_triangle.half_side_length)
  end

  def test_rectangle
    rectangle = Rectangle.new(0.1, 0.2)
    assert_equal(0.1, rectangle.half_width)
    assert_equal(0.2, rectangle.half_height)

    rectangle.half_width = 0.3
    assert_equal(0.3, rectangle.half_width)
    rectangle.half_height = 0.4
    assert_equal(0.4, rectangle.half_height)
  end

  def test_ellipse
    ellipse = Ellipse.new(0.1, 0.2)
    assert_equal(0.1, ellipse.x_radius)
    assert_equal(0.2, ellipse.y_radius)

    ellipse.x_radius = 0.3
    assert_equal(0.3, ellipse.x_radius)
    ellipse.y_radius = 0.4
    assert_equal(0.4, ellipse.y_radius)
  end

  def test_text
    text = Text.new("Ruby", Font::TIMES_ROMAN_24)
    assert_equal("Ruby", text.text)
    assert_equal(Font::TIMES_ROMAN_24, text.font)

    text.text = "Smalltalk"
    assert_equal("Smalltalk", text.text)
    text.font = Font::HELVETICA_18
    assert_equal(Font::HELVETICA_18, text.font)
  end

  def test_circular_segment
    circular_segment = CircularSegment.new(0.1, 0.2, 0.3, 0.4)
    assert_equal(0.1, circular_segment.x_radius)
    assert_equal(0.2, circular_segment.y_radius)
    assert_equal(0.3, circular_segment.theta_a)
    assert_equal(0.4, circular_segment.theta_z)

    circular_segment.x_radius = 0.5
    assert_equal(0.5, circular_segment.x_radius)
    circular_segment.y_radius = 0.6
    assert_equal(0.6, circular_segment.y_radius)
    circular_segment.theta_a = 0.7
    assert_equal(0.7, circular_segment.theta_a)
    circular_segment.theta_z = 0.8
    assert_equal(0.8, circular_segment.theta_z)
  end

  def test_bezier_curve
    pts = [
      Point2.new(-0.1, -0.2),
      Point2.new(0.0, +0.3),
      Point2.new(0.4, -0.5)
    ]
    bezier_curve = BezierCurve.new(pts)
    assert_equal(pts, bezier_curve.control_points)

    p0 = Point2.new(-0.5, -0.5)
    p1 = Point2.new(-0.25, 0.25)
    p2 = Point2.new(0.25, -0.5)
    p3 = Point2.new(0.5, 0.5)

    pts_prime = [p0,p1,p2,p3]
    bezier_curve.control_points = pts_prime
    assert_equal(pts_prime,  bezier_curve.control_points)
  end
end
