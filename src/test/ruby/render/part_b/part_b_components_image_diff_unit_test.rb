require "test/unit"

require_relative '../core/image_diff_unit_test_mixin'
require_relative 'part_b_components_info'

class PartBImageDiffUnitTest < Test::Unit::TestCase
  # generated begin

  def test_picture_diff_EquilateralTriangle0
    picture_diff("EquilateralTriangle.new(0.5, x: 0.5)",
                 "EquilateralTriangle0")
  end

  def test_picture_diff_EquilateralTriangle1
    picture_diff("EquilateralTriangle.new(0.5, y: -0.5)",
                 "EquilateralTriangle1")
  end

  def test_picture_diff_EquilateralTriangle2
    picture_diff("EquilateralTriangle.new(0.5, color: Color.new(1,0,0))",
                 "EquilateralTriangle2")
  end

  def test_picture_diff_EquilateralTriangle3
    picture_diff("EquilateralTriangle.new(0.5, y: 0.3, color: Color.new(0.5,0.5,1), x: -0.7)",
                 "EquilateralTriangle3")
  end

  def test_picture_diff_EquilateralTriangle4
    picture_diff("EquilateralTriangle.new(0.2, x: 0.5)",
                 "EquilateralTriangle4")
  end

  def test_picture_diff_EquilateralTriangle5
    picture_diff("EquilateralTriangle.new(0.2, y: -0.5)",
                 "EquilateralTriangle5")
  end

  def test_picture_diff_EquilateralTriangle6
    picture_diff("EquilateralTriangle.new(0.2, color: Color.new(1,0,0))",
                 "EquilateralTriangle6")
  end

  def test_picture_diff_EquilateralTriangle7
    picture_diff("EquilateralTriangle.new(0.2, y: 0.3, color: Color.new(0.5,0.5,1), x: -0.7)",
                 "EquilateralTriangle7")
  end

  def test_picture_diff_Rectangle0
    picture_diff("Rectangle.new(0.4, 0.3, x: 0.5)",
                 "Rectangle0")
  end

  def test_picture_diff_Rectangle1
    picture_diff("Rectangle.new(0.4, 0.3, y: -0.5)",
                 "Rectangle1")
  end

  def test_picture_diff_Rectangle2
    picture_diff("Rectangle.new(0.4, 0.3, color: Color.new(1,0,0))",
                 "Rectangle2")
  end

  def test_picture_diff_Rectangle3
    picture_diff("Rectangle.new(0.4, 0.3, y: 0.3, color: Color.new(0.5,0.5,1), x: -0.7)",
                 "Rectangle3")
  end

  def test_picture_diff_Rectangle4
    picture_diff("Rectangle.new(0.2, 0.5, x: 0.5)",
                 "Rectangle4")
  end

  def test_picture_diff_Rectangle5
    picture_diff("Rectangle.new(0.2, 0.5, y: -0.5)",
                 "Rectangle5")
  end

  def test_picture_diff_Rectangle6
    picture_diff("Rectangle.new(0.2, 0.5, color: Color.new(1,0,0))",
                 "Rectangle6")
  end

  def test_picture_diff_Rectangle7
    picture_diff("Rectangle.new(0.2, 0.5, y: 0.3, color: Color.new(0.5,0.5,1), x: -0.7)",
                 "Rectangle7")
  end

  def test_picture_diff_Ellipse0
    picture_diff("Ellipse.new(0.4, 0.3, x: 0.5)",
                 "Ellipse0")
  end

  def test_picture_diff_Ellipse1
    picture_diff("Ellipse.new(0.4, 0.3, y: -0.5)",
                 "Ellipse1")
  end

  def test_picture_diff_Ellipse2
    picture_diff("Ellipse.new(0.4, 0.3, color: Color.new(1,0,0))",
                 "Ellipse2")
  end

  def test_picture_diff_Ellipse3
    picture_diff("Ellipse.new(0.4, 0.3, y: 0.3, color: Color.new(0.5,0.5,1), x: -0.7)",
                 "Ellipse3")
  end

  def test_picture_diff_Ellipse4
    picture_diff("Ellipse.new(0.2, 0.5, x: 0.5)",
                 "Ellipse4")
  end

  def test_picture_diff_Ellipse5
    picture_diff("Ellipse.new(0.2, 0.5, y: -0.5)",
                 "Ellipse5")
  end

  def test_picture_diff_Ellipse6
    picture_diff("Ellipse.new(0.2, 0.5, color: Color.new(1,0,0))",
                 "Ellipse6")
  end

  def test_picture_diff_Ellipse7
    picture_diff("Ellipse.new(0.2, 0.5, y: 0.3, color: Color.new(0.5,0.5,1), x: -0.7)",
                 "Ellipse7")
  end

  def test_picture_diff_CircularSegment0
    picture_diff("CircularSegment.new(0.3, 0.4, -Math::PI/3, Math::PI/2, x: 0.5)",
                 "CircularSegment0")
  end

  def test_picture_diff_CircularSegment1
    picture_diff("CircularSegment.new(0.3, 0.4, -Math::PI/3, Math::PI/2, y: -0.5)",
                 "CircularSegment1")
  end

  def test_picture_diff_CircularSegment2
    picture_diff("CircularSegment.new(0.3, 0.4, -Math::PI/3, Math::PI/2, color: Color.new(1,0,0))",
                 "CircularSegment2")
  end

  def test_picture_diff_CircularSegment3
    picture_diff("CircularSegment.new(0.3, 0.4, -Math::PI/3, Math::PI/2, y: 0.3, color: Color.new(0.5,0.5,1), x: -0.7)",
                 "CircularSegment3")
  end

  def test_picture_diff_CircularSegment4
    picture_diff("CircularSegment.new(0.2, 0.5, Math::PI/4, 3*Math::PI/2, x: 0.5)",
                 "CircularSegment4")
  end

  def test_picture_diff_CircularSegment5
    picture_diff("CircularSegment.new(0.2, 0.5, Math::PI/4, 3*Math::PI/2, y: -0.5)",
                 "CircularSegment5")
  end

  def test_picture_diff_CircularSegment6
    picture_diff("CircularSegment.new(0.2, 0.5, Math::PI/4, 3*Math::PI/2, color: Color.new(1,0,0))",
                 "CircularSegment6")
  end

  def test_picture_diff_CircularSegment7
    picture_diff("CircularSegment.new(0.2, 0.5, Math::PI/4, 3*Math::PI/2, y: 0.3, color: Color.new(0.5,0.5,1), x: -0.7)",
                 "CircularSegment7")
  end

  def test_picture_diff_Image0
    picture_diff("path = DownloadUtils.download_if_necessary('https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/resources/dan128.png');Image.new(path, x: 0.5)",
                 "Image0")
  end

  def test_picture_diff_Image1
    picture_diff("path = DownloadUtils.download_if_necessary('https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/resources/dan128.png');Image.new(path, y: -0.5)",
                 "Image1")
  end

  def test_picture_diff_Image2
    picture_diff("path = DownloadUtils.download_if_necessary('https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/resources/dan128.png');Image.new(path, y: 0.3, x: -0.7)",
                 "Image2")
  end

  def test_picture_diff_Image3
    picture_diff("path = DownloadUtils.download_if_necessary('https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/resources/ruby_logo.png');Image.new(path, x: 0.5)",
                 "Image3")
  end

  def test_picture_diff_Image4
    picture_diff("path = DownloadUtils.download_if_necessary('https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/resources/ruby_logo.png');Image.new(path, y: -0.5)",
                 "Image4")
  end

  def test_picture_diff_Image5
    picture_diff("path = DownloadUtils.download_if_necessary('https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/resources/ruby_logo.png');Image.new(path, y: 0.3, x: -0.7)",
                 "Image5")
  end

  def test_picture_diff_Text0
    picture_diff("Text.new(\"SML\", GLUT_BITMAP_TIMES_ROMAN_24, x: 0.5)",
                 "Text0")
  end

  def test_picture_diff_Text1
    picture_diff("Text.new(\"SML\", GLUT_BITMAP_TIMES_ROMAN_24, y: -0.5)",
                 "Text1")
  end

  def test_picture_diff_Text2
    picture_diff("Text.new(\"SML\", GLUT_BITMAP_TIMES_ROMAN_24, color: Color.new(1,0,0))",
                 "Text2")
  end

  def test_picture_diff_Text3
    picture_diff("Text.new(\"SML\", GLUT_BITMAP_TIMES_ROMAN_24, y: 0.3, color: Color.new(0.5,0.5,1), x: -0.7)",
                 "Text3")
  end

  def test_picture_diff_Text4
    picture_diff("Text.new(\"Racket\", GLUT_BITMAP_TIMES_ROMAN_24, x: 0.5)",
                 "Text4")
  end

  def test_picture_diff_Text5
    picture_diff("Text.new(\"Racket\", GLUT_BITMAP_TIMES_ROMAN_24, y: -0.5)",
                 "Text5")
  end

  def test_picture_diff_Text6
    picture_diff("Text.new(\"Racket\", GLUT_BITMAP_TIMES_ROMAN_24, color: Color.new(1,0,0))",
                 "Text6")
  end

  def test_picture_diff_Text7
    picture_diff("Text.new(\"Racket\", GLUT_BITMAP_TIMES_ROMAN_24, y: 0.3, color: Color.new(0.5,0.5,1), x: -0.7)",
                 "Text7")
  end

  def test_picture_diff_Text8
    picture_diff("Text.new(\"Ruby\", GLUT_BITMAP_TIMES_ROMAN_24, x: 0.5)",
                 "Text8")
  end

  def test_picture_diff_Text9
    picture_diff("Text.new(\"Ruby\", GLUT_BITMAP_TIMES_ROMAN_24, y: -0.5)",
                 "Text9")
  end

  def test_picture_diff_Text10
    picture_diff("Text.new(\"Ruby\", GLUT_BITMAP_TIMES_ROMAN_24, color: Color.new(1,0,0))",
                 "Text10")
  end

  def test_picture_diff_Text11
    picture_diff("Text.new(\"Ruby\", GLUT_BITMAP_TIMES_ROMAN_24, y: 0.3, color: Color.new(0.5,0.5,1), x: -0.7)",
                 "Text11")
  end

  def test_picture_diff_BezierCurve0
    picture_diff("p0 = Point2.new(-0.5, -0.5);p1 = Point2.new(-0.25, 0.25);p2 = Point2.new(0.25, -0.5);p3 = Point2.new(0.5, 0.5);BezierCurve.new([p0,p1,p2,p3], x: 0.5)",
                 "BezierCurve0")
  end

  def test_picture_diff_BezierCurve1
    picture_diff("p0 = Point2.new(-0.5, -0.5);p1 = Point2.new(-0.25, 0.25);p2 = Point2.new(0.25, -0.5);p3 = Point2.new(0.5, 0.5);BezierCurve.new([p0,p1,p2,p3], y: -0.5)",
                 "BezierCurve1")
  end

  def test_picture_diff_BezierCurve2
    picture_diff("p0 = Point2.new(-0.5, -0.5);p1 = Point2.new(-0.25, 0.25);p2 = Point2.new(0.25, -0.5);p3 = Point2.new(0.5, 0.5);BezierCurve.new([p0,p1,p2,p3], color: Color.new(1,0,0))",
                 "BezierCurve2")
  end

  def test_picture_diff_BezierCurve3
    picture_diff("p0 = Point2.new(-0.5, -0.5);p1 = Point2.new(-0.25, 0.25);p2 = Point2.new(0.25, -0.5);p3 = Point2.new(0.5, 0.5);BezierCurve.new([p0,p1,p2,p3], y: 0.3, color: Color.new(0.5,0.5,1), x: -0.7)",
                 "BezierCurve3")
  end

  def test_picture_diff_BezierCurve4
    picture_diff("p0 = Point2.new(-0.5, -0.5);p1 = Point2.new(0.0, +0.5);p2 = Point2.new(0.5, -0.5);BezierCurve.new([p0,p1,p2], x: 0.5)",
                 "BezierCurve4")
  end

  def test_picture_diff_BezierCurve5
    picture_diff("p0 = Point2.new(-0.5, -0.5);p1 = Point2.new(0.0, +0.5);p2 = Point2.new(0.5, -0.5);BezierCurve.new([p0,p1,p2], y: -0.5)",
                 "BezierCurve5")
  end

  def test_picture_diff_BezierCurve6
    picture_diff("p0 = Point2.new(-0.5, -0.5);p1 = Point2.new(0.0, +0.5);p2 = Point2.new(0.5, -0.5);BezierCurve.new([p0,p1,p2], color: Color.new(1,0,0))",
                 "BezierCurve6")
  end

  def test_picture_diff_BezierCurve7
    picture_diff("p0 = Point2.new(-0.5, -0.5);p1 = Point2.new(0.0, +0.5);p2 = Point2.new(0.5, -0.5);BezierCurve.new([p0,p1,p2], y: 0.3, color: Color.new(0.5,0.5,1), x: -0.7)",
                 "BezierCurve7")
  end

  # generated end

  def self.startup
    @@pictures, @@exceptions = ImageDiffUnitTestSetup.setup_pictures_and_exceptions(PartBComponentsInfo.new, is_complete: true)
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