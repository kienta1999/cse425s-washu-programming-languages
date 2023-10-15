require "test/unit"

class BoundsRequiresPoint2Test < Test::Unit::TestCase
  def test_bounds_requires_point2
    # assert_false Object.const_defined?(:Point2)
    # assert_false Object.const_defined?(:Bounds)
    require_relative '../../../../main/ruby/render/assignment/bounds'
    assert_true Object.const_defined?(:Point2)
    assert_true Object.const_defined?(:Bounds)
  end
end