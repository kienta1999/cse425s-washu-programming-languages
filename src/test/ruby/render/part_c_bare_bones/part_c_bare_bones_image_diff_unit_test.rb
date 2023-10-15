require "test/unit"

require_relative '../core/image_diff_unit_test_mixin'
require_relative '../part_c/part_c_info'

class PartCBareBonesImageDiffUnitTest < Test::Unit::TestCase
  # generated begin

  def test_picture_diff_ConvexPolygon14
    picture_diff("ConvexPolygon.new([Point2.new(0.85, 0.0),
       Point2.new(0.1, 0.25),
       Point2.new(0.0, 0.45),
       Point2.new(0.15, 0.7),
       Point2.new(0.65, 1.0),
       Point2.new(0.95, 0.95),
       Point2.new(1.1, 0.75)
     ], x: -0.5, y: -0.2, color: Color::RED,)",
                 "ConvexPolygon14")
  end

  def test_picture_diff_CompositeTransform_move15
    picture_diff("movable = CompositeTransform.new(x:0.4, y:0.5, );movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "CompositeTransform_move15")
  end

  # generated end

  def self.startup
    @@pictures, @@exceptions = ImageDiffUnitTestSetup.setup_pictures_and_exceptions(PartCInfo.new, is_complete: false)
  end

  private

  include ImageDiffUnitTestMixin

  def expected_sub_path
    'part_c'
  end

  def setup_exception_hash
    @@exceptions
  end

  def setup_picture_hash
    @@pictures
  end
end