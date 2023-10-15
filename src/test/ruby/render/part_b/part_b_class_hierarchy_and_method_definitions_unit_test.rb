require "test/unit"

require_relative '../../../../main/ruby/render/assignment/equilateral_triangle'
require_relative '../../../../main/ruby/render/assignment/rectangle'
require_relative '../../../../main/ruby/render/assignment/ellipse'
require_relative '../../../../main/ruby/render/assignment/image'
require_relative '../../../../main/ruby/render/assignment/text'
require_relative '../../../../main/ruby/render/assignment/circular_segment'
require_relative '../../../../main/ruby/render/assignment/bezier_curve'
require_relative '../../../../main/ruby/render/assignment/scene'
require_relative '../../../../main/ruby/render/assignment/transform'
require_relative '../../../../main/ruby/render/assignment/composite_transform'
require_relative '../../../../main/ruby/render/assignment/color_transform'


class PartBClassHierarchyAndMethodDefinitionsTest < Test::Unit::TestCase
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

  def test_class_hierarchy
    @@object_direct_subclasses.each do |object_direct_subclass|
      assert_equal(Object, object_direct_subclass.superclass, object_direct_subclass.name)
    end
    @@transform_direct_subclasses.each do |transform_direct_subclass|
      assert_equal(Transform, transform_direct_subclass.superclass, transform_direct_subclass.name)
    end
    @@color_transform_direct_subclasses.each do |color_transform_direct_subclass|
      assert_equal(ColorTransform, color_transform_direct_subclass.superclass, color_transform_direct_subclass.name)
    end
  end

  def test_public_render_defined
    @@object_direct_subclasses.each do |object_direct_subclass|
      assert(object_direct_subclass.public_method_defined?(:render))
    end
    @@transform_direct_subclasses.each do |transform_direct_subclass|
      assert(transform_direct_subclass.public_method_defined?(:render))
    end
    @@color_transform_direct_subclasses.each do |color_transform_direct_subclass|
      assert(color_transform_direct_subclass.public_method_defined?(:render))
    end
  end

  def test_private_render_transformed_defined
    @@transform_direct_subclasses.each do |transform_direct_subclass|
      unless transform_direct_subclass == ColorTransform
        assert(transform_direct_subclass.private_method_defined?(:render_transformed), transform_direct_subclass.name)
      end
    end
    @@color_transform_direct_subclasses.each do |color_transform_direct_subclass|
      assert(color_transform_direct_subclass.private_method_defined?(:render_transformed), color_transform_direct_subclass.name)
    end
  end
end