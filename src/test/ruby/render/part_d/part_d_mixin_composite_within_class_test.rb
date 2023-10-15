require "test/unit"

class MixinCompositeWithinClassTest < Test::Unit::TestCase
  def test_composite_transform_imports_composite_within_class
    check_pre
    require_relative "../../../../main/ruby/render/assignment/composite_transform"
    check_post(CompositeTransform)
  end

  def test_scene_imports_composite_within_class
    check_pre
    require_relative "../../../../main/ruby/render/assignment/scene"
    check_post(Scene)
  end

  private

  def check_pre
    [:any?, :all?, :map, :select].each do |symbol|
      assert_false(Object.method_defined?(symbol), "========\nObject should NOT have method defined: #{symbol}.\nPossible import Enumerable at top-level in other file.\n========\n")
    end
  end

  def check_post(cls)
    [:any?, :all?, :map, :select].each do |symbol|
      assert_false(Object.method_defined?(symbol), "========\nObject should NOT have method defined: #{symbol}.\nPossible import Enumerable at top-level.\n========\n")
      assert_true(cls.method_defined?(symbol), "========\n#{cls} should have method defined: #{symbol}.\nPossible failure to import Enumerable within the class.\n========\n")
    end
  end
end