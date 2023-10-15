require "test/unit"
require_relative '../../../../main/ruby/render/assignment/convex_polygon'

class PartCConvexPolygonRenderMethodsUnitTest < Test::Unit::TestCase
  def test_public_render_defined
    assert(ConvexPolygon.public_method_defined?(:render))
  end

  def test_private_render_transformed_defined
    assert(ConvexPolygon.private_method_defined?(:render_transformed))
  end
end