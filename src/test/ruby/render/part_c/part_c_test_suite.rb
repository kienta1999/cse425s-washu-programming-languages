# require 'test/unit/testsuite'

require_relative 'part_c_bounds_requires_point2_test'
require_relative 'part_c_bounds_unit_test'
require_relative 'part_c_convex_polygon_class_hierarchy_unit_test'
require_relative 'part_c_convex_polygon_render_methods_unit_test'
require_relative 'part_c_calculate_bounds_methods_test'
require_relative 'part_c_calculate_bounds_unit_test'
require_relative 'part_c_move_method_unit_test'
require_relative 'part_c_ellipse_move_test'
require_relative 'part_c_rectangle_move_test'
require_relative 'part_c_image_diff_unit_test'
require_relative '../part_b_bare_bones/part_b_bare_bones_test_suite'
require_relative '../part_a_bare_bones/part_a_bare_bones_test_suite'

# class PartCSuite < Test::Unit::TestSuite
#   def initialize(name = nil, test_case = nil)
#     super
#     self << PartCConvexPolygonClassHierarchyUnitTest
#     self << PartCConvexPolygonRenderMethodsUnitTest
#     self << PartCMoveUnitTest
#
#     # self << PartBBaseUnitTest
#     # self << PartBBareBonesImageDiffUnitTest
#     # self << PartBCompositeTransformSceneImageDiffUnitTest
#
#     # self << PartAUnitTest
#   end
# end
