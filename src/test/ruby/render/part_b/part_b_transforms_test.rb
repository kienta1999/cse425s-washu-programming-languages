require "test/unit"

require_relative '../../../../core/ruby/download/download_utils'
require_relative '../../../../main/ruby/render/assignment/scene'
require_relative '../../../../main/ruby/render/assignment/transform'
require_relative '../../../../main/ruby/render/assignment/composite_transform'
require_relative '../../../../main/ruby/render/assignment/color_transform'

require_relative '../../../../main/ruby/render/assignment/equilateral_triangle'
require_relative '../../../../main/ruby/render/assignment/rectangle'
require_relative '../../../../main/ruby/render/assignment/ellipse'
require_relative '../../../../main/ruby/render/assignment/image'
require_relative '../../../../main/ruby/render/assignment/text'
require_relative '../../../../main/ruby/render/assignment/circular_segment'
require_relative '../../../../main/ruby/render/assignment/bezier_curve'

class PartBTransformsTest < Test::Unit::TestCase
  def test_equilateral_triangle
    half_side_length = 1.0
    check_color_transform(EquilateralTriangle.new(half_side_length), 0, 0, nil)
    check_color_transform(EquilateralTriangle.new(half_side_length, x: 0.1), 0.1, 0, nil)
    check_color_transform(EquilateralTriangle.new(half_side_length, y: 0.2), 0, 0.2, nil)
    check_color_transform(EquilateralTriangle.new(half_side_length, x: 0.3, y: 0.4), 0.3, 0.4, nil)
    check_color_transform(EquilateralTriangle.new(half_side_length, color: Color::HONOLULU_BLUE), 0, 0, Color::HONOLULU_BLUE)
    check_color_transform(EquilateralTriangle.new(half_side_length, x: 0.5, y: 0.6, color: Color::PARIS_DAISY), 0.5, 0.6, Color::PARIS_DAISY)
  end

  def test_rectangle
    half_width = 1.0
    half_height = 2.0
    check_color_transform(Rectangle.new(half_width, half_height), 0, 0, nil)
    check_color_transform(Rectangle.new(half_width, half_height, x: 0.1), 0.1, 0, nil)
    check_color_transform(Rectangle.new(half_width, half_height, y: 0.2), 0, 0.2, nil)
    check_color_transform(Rectangle.new(half_width, half_height, x: 0.3, y: 0.4), 0.3, 0.4, nil)
    check_color_transform(Rectangle.new(half_width, half_height, color: Color::HONOLULU_BLUE), 0, 0, Color::HONOLULU_BLUE)
    check_color_transform(Rectangle.new(half_width, half_height, x: 0.5, y: 0.6, color: Color::PARIS_DAISY), 0.5, 0.6, Color::PARIS_DAISY)
  end

  def test_ellipse
    x_radius = 1.0
    y_radius = 2.0
    check_color_transform(Ellipse.new(x_radius, y_radius), 0, 0, nil)
    check_color_transform(Ellipse.new(x_radius, y_radius, x: 0.1), 0.1, 0, nil)
    check_color_transform(Ellipse.new(x_radius, y_radius, y: 0.2), 0, 0.2, nil)
    check_color_transform(Ellipse.new(x_radius, y_radius, x: 0.3, y: 0.4), 0.3, 0.4, nil)
    check_color_transform(Ellipse.new(x_radius, y_radius, color: Color::HONOLULU_BLUE), 0, 0, Color::HONOLULU_BLUE)
    check_color_transform(Ellipse.new(x_radius, y_radius, x: 0.5, y: 0.6, color: Color::PARIS_DAISY), 0.5, 0.6, Color::PARIS_DAISY)
  end

  def test_circular_segment
    x_radius = 1.0
    y_radius = 2.0
    theta_a = Math::PI/4
    theta_z = Math::PI/2
    check_color_transform(CircularSegment.new(x_radius, y_radius, theta_a, theta_z), 0, 0, nil)
    check_color_transform(CircularSegment.new(x_radius, y_radius, theta_a, theta_z, x: 0.1), 0.1, 0, nil)
    check_color_transform(CircularSegment.new(x_radius, y_radius, theta_a, theta_z, y: 0.2), 0, 0.2, nil)
    check_color_transform(CircularSegment.new(x_radius, y_radius, theta_a, theta_z, x: 0.3, y: 0.4), 0.3, 0.4, nil)
    check_color_transform(CircularSegment.new(x_radius, y_radius, theta_a, theta_z, color: Color::HONOLULU_BLUE), 0, 0, Color::HONOLULU_BLUE)
    check_color_transform(CircularSegment.new(x_radius, y_radius, theta_a, theta_z, x: 0.5, y: 0.6, color: Color::PARIS_DAISY), 0.5, 0.6, Color::PARIS_DAISY)
  end

  def test_bezier_curve
    control_points = [
      Point2.new(-1, -1),
      Point2.new(0.0, 1),
      Point2.new(2, -2)
    ]
    check_color_transform(BezierCurve.new(control_points), 0, 0, nil)
    check_color_transform(BezierCurve.new(control_points, x: 0.1), 0.1, 0, nil)
    check_color_transform(BezierCurve.new(control_points, y: 0.2), 0, 0.2, nil)
    check_color_transform(BezierCurve.new(control_points, x: 0.3, y: 0.4), 0.3, 0.4, nil)
    check_color_transform(BezierCurve.new(control_points, color: Color::HONOLULU_BLUE), 0, 0, Color::HONOLULU_BLUE)
    check_color_transform(BezierCurve.new(control_points, x: 0.5, y: 0.6, color: Color::PARIS_DAISY), 0.5, 0.6, Color::PARIS_DAISY)
  end

  def test_text
    check_color_transform(Text.new("SML, Racket, Ruby, Java", Font::TIMES_ROMAN_10), 0, 0, nil)
    check_color_transform(Text.new("SML, Racket, Ruby, Java", Font::TIMES_ROMAN_10, x: 0.1), 0.1, 0, nil)
    check_color_transform(Text.new("SML, Racket, Ruby, Java", Font::TIMES_ROMAN_10, y: 0.2), 0, 0.2, nil)
    check_color_transform(Text.new("SML, Racket, Ruby, Java", Font::TIMES_ROMAN_10, x: 0.3, y: 0.4), 0.3, 0.4, nil)
    check_color_transform(Text.new("SML, Racket, Ruby, Java", Font::TIMES_ROMAN_10, color: Color::HONOLULU_BLUE), 0, 0, Color::HONOLULU_BLUE)
    check_color_transform(Text.new("SML, Racket, Ruby, Java", Font::TIMES_ROMAN_10, x: 0.5, y: 0.6, color: Color::PARIS_DAISY), 0.5, 0.6, Color::PARIS_DAISY)
  end

  def test_image
    uri = 'https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png'
    path = DownloadUtils.download(uri)
    # check_transform(Image.new(path), 0, 0)
    # check_transform(Image.new(path, x: 0.1), 0.1, 0)
    # check_transform(Image.new(path, y: 0.2), 0, 0.2)
    check_transform(Image.new(path, x: 0.3, y: 0.4), 0.3, 0.4)
  end

  def test_composite_transform
    composite_transform = CompositeTransform.new(x: 1.0, y: 2.0)
    composite_transform.push_component(Rectangle.new(0.2, 0.2, y: -0.3, color:Color::ALIZARAN_CRIMSON))
    composite_transform.push_component(EquilateralTriangle.new(0.25, color: Color::JEEPERS_CREEPERS))
    check_transform(composite_transform, 1.0, 2.0)
  end

  private

  def check_transform(transform, expected_x, expected_y)
    assert_equal(expected_x, transform.x)
    assert_equal(expected_y, transform.y)

    transform.x = 425
    assert_equal(425, transform.x)
    assert_equal(expected_y, transform.y)
    transform.x = 231
    assert_equal(231, transform.x)
    assert_equal(expected_y, transform.y)
    transform.x = expected_x
    assert_equal(expected_x, transform.x)
    assert_equal(expected_y, transform.y)

    transform.y = 425
    assert_equal(425, transform.y)
    assert_equal(expected_x, transform.x)
    transform.y = 231
    assert_equal(231, transform.y)
    assert_equal(expected_x, transform.x)
    transform.y = expected_y
    assert_equal(expected_y, transform.y)
    assert_equal(expected_x, transform.x)
  end

  def check_color_transform(color_transform, expected_x, expected_y, expected_color)
    check_transform(color_transform, expected_x, expected_y)
    assert_equal(expected_color, color_transform.color)
    color_transform.color = Color::BAMBOO
    assert_equal(Color::BAMBOO, color_transform.color)
    color_transform.color = Color::FRENCH_VIOLET
    assert_equal(Color::FRENCH_VIOLET, color_transform.color)
    color_transform.color = expected_color
    assert_equal(expected_color, color_transform.color)
  end
end