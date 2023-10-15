require "test/unit"

require_relative '../../../../main/ruby/render/assignment/composite'
require_relative '../../../../main/ruby/render/assignment/scene'
require_relative '../../../../main/ruby/render/assignment/composite_transform'

class PartDMethodsFromMixinTest < Test::Unit::TestCase
  def test_mixin
    [:push_component, :each_component].each do |method_name|
      handle_method(method_name, :public_method_defined?)
    end
    [:initialize_components, :calculate_local_bounds].each do |method_name|
      handle_method(method_name, :private_method_defined?)
    end
  end

  def test_enumerable_method_owner
    enumerable_method_names = Enumerable.public_instance_methods(include_super = false)
    enumerable_method_names.each do |enumerable_method_name|
      [CompositeTransform, Scene, Composite].each do |cls_or_module|
        cls_method = cls_or_module.public_instance_method(enumerable_method_name)
        assert_equal(Enumerable, cls_method.owner, "#{cls_or_module} #{enumerable_method_name}")
      end
    end
  end

  private

  def handle_method(method_name, method_defined_name)
    [Composite, CompositeTransform, Scene].each do |module_or_class|
      assert(module_or_class.send(method_defined_name, method_name), "#{module_or_class} does not have a #{method_defined_name} #{method_name}")
    end
    [CompositeTransform, Scene].each do |cls|
      method = cls.instance_method(method_name)
      assert_equal(Composite, method.owner, "method #{method_name} on class #{cls} expected to be mixed in from Composite")
    end
  end
end
