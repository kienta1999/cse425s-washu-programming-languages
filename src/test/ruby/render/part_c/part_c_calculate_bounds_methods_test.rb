require "test/unit"

require_relative 'require_all_but_composite'

class PartCCalculateBoundsMethodsTest < Test::Unit::TestCase
  @@object_direct_subclasses = [
    Transform,
    Scene
  ]
  @@transform_direct_subclasses = [
    ColorTransform,
    CompositeTransform,
    Image
  ]
  @@color_transform_direct_subclasses = [
    EquilateralTriangle,
    Rectangle,
    Ellipse,
    CircularSegment,
    Text,
    BezierCurve
  ]

  def test_public_calculate_bounds_defined
    (@@object_direct_subclasses + @@transform_direct_subclasses + @@color_transform_direct_subclasses).each do |cls|
      assert(cls.public_method_defined?(:calculate_bounds))
      # puts "#{cls} calculate_bounds"
    end
  end

  def test_private_calculate_local_bounds_defined
    (@@transform_direct_subclasses + @@color_transform_direct_subclasses).each do |cls|
      unless cls == ColorTransform
        assert(cls.private_method_defined?(:calculate_local_bounds), cls.to_s)
      end
    end
  end
end
