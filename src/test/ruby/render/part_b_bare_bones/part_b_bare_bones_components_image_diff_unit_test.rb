require "test/unit"

require_relative '../core/image_diff_unit_test_mixin'
require_relative '../part_b/part_b_components_info'

class PartBBareBonesComponentsImageDiffUnitTest < Test::Unit::TestCase
  # generated begin

  def test_picture_diff_EquilateralTriangle7
    picture_diff("EquilateralTriangle.new(0.2, y: 0.3, color: Color::BARBIE_PINK, x: -0.7)",
                 "EquilateralTriangle7")
  end

  def test_picture_diff_Rectangle7
    picture_diff("Rectangle.new(0.2, 0.5, y: 0.3, color: Color::BARBIE_PINK, x: -0.7)",
                 "Rectangle7")
  end

  def test_picture_diff_Ellipse7
    picture_diff("Ellipse.new(0.2, 0.5, y: 0.3, color: Color::BARBIE_PINK, x: -0.7)",
                 "Ellipse7")
  end

  def test_picture_diff_CircularSegment7
    picture_diff("CircularSegment.new(0.2, 0.5, Math::PI/4, 3*Math::PI/2, y: 0.3, color: Color::BARBIE_PINK, x: -0.7)",
                 "CircularSegment7")
  end

  def test_picture_diff_Image5
    picture_diff("path = DownloadUtils.download_if_necessary('https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/resources/ruby_logo.png');Image.new(path, y: 0.3, x: -0.7)",
                 "Image5")
  end

  def test_picture_diff_Text11
    picture_diff("Text.new(\"Ruby\", Font::TIMES_ROMAN_24, y: 0.3, color: Color::BARBIE_PINK, x: -0.7)",
                 "Text11")
  end

  def test_picture_diff_BezierCurve7
    picture_diff("p0 = Point2.new(-0.5, -0.5);p1 = Point2.new(0.0, +0.5);p2 = Point2.new(0.5, -0.5);BezierCurve.new([p0,p1,p2], y: 0.3, color: Color::BARBIE_PINK, x: -0.7)",
                 "BezierCurve7")
  end


  # generated end

  def self.startup
    @@pictures, @@exceptions = ImageDiffUnitTestSetup.setup_pictures_and_exceptions(PartBComponentsInfo.new, is_complete: false)
  end

  private

  include ImageDiffUnitTestMixin

  def expected_sub_path
    'part_b'
  end

  def setup_exception_hash
    @@exceptions
  end

  def setup_picture_hash
    @@pictures
  end
end