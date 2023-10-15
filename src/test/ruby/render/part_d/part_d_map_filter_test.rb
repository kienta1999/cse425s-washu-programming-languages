require "test/unit"

require_relative '../../../../main/ruby/render/assignment/composite'
require_relative '../../../../main/ruby/render/assignment/scene'
require_relative '../../../../main/ruby/render/assignment/composite_transform'
require_relative '../../../../main/ruby/render/assignment/ellipse'
require_relative '../../../../main/ruby/render/assignment/rectangle'
require_relative '../../../../main/ruby/render/assignment/equilateral_triangle'
require_relative '../../../../main/ruby/render/assignment/rectangle'

class PartDMapFilterTest < Test::Unit::TestCase
  def test_map
    composite = create_winter_composite
    actual = composite.map do |component|
      component.class
    end
    expected = [Rectangle,
                Ellipse,
                CompositeTransform,
                CompositeTransform,
                CompositeTransform,
                CompositeTransform]
    assert_equal(expected, actual)
  end

  def test_filter
    composite = create_winter_composite
    filtered_instances = composite.select do |component|
      component.class == Ellipse
    end

    # note: this map is on Array not Composite
    actual = filtered_instances.map do |instance|
      instance.class
    end

    expected = [Ellipse]
    assert_equal(expected, actual)
  end

  private

  def create_winter_composite
    sun = Ellipse.new(0.18, 0.18, x: 0.5, y: 0.8, color: Color::YELLOW)
    snow = Rectangle.new(1.0, 0.5, y: -0.5, color: Color.new(0.85, 0.85, 0.85))

    bottom_radius = 0.2
    middle_radius = bottom_radius * 0.8
    top_radius = middle_radius * 0.8
    bottom = Ellipse.new(bottom_radius, bottom_radius, color: Color::WHITE)
    middle = Ellipse.new(middle_radius, middle_radius, y: bottom_radius + middle_radius, color: Color::WHITE)
    top = Ellipse.new(top_radius, top_radius, y: bottom_radius + 2 * middle_radius + top_radius, color: Color::WHITE)
    snow_person = CompositeTransform.new()
    snow_person.push_component(bottom)
    snow_person.push_component(middle)
    snow_person.push_component(top)

    brim_half_width = 0.15
    brim_half_height = brim_half_width * 0.1
    crown_half_width = brim_half_width * 0.8
    crown_half_height = crown_half_width * 0.7
    hat_color = Color.new(0.125, 0.5, 0.125)
    brim = Rectangle.new(brim_half_width, brim_half_height, color: hat_color)
    crown = Rectangle.new(crown_half_width, crown_half_height, y: brim_half_height + crown_half_height, color: hat_color)
    offset_hat = CompositeTransform.new(y: 0.75,)
    offset_hat.push_component(brim)
    offset_hat.push_component(crown)

    snow_person_with_hat = CompositeTransform.new(x: -0.5, y: -0.6,)
    snow_person_with_hat.push_component(snow_person)
    snow_person_with_hat.push_component(offset_hat)

    trunk_a = Rectangle.new(0.05, 0.1, y: -0.2, color: Color.new(0.65, 0.3, 0.0))
    needles_a = EquilateralTriangle.new(0.25, color: Color::GREEN)
    tree_a = CompositeTransform.new(x: 0.4, y: -0.6,)
    tree_a.push_component(trunk_a)
    tree_a.push_component(needles_a)

    trunk_b = Rectangle.new(0.04000000000000001, 0.08000000000000002, y: -0.16000000000000003, color: Color.new(0.65, 0.3, 0.0))
    needles_b = EquilateralTriangle.new(0.2, color: Color::GREEN)
    tree_b = CompositeTransform.new(y: -0.25,)
    tree_b.push_component(trunk_b)
    tree_b.push_component(needles_b)

    trunk_c = Rectangle.new(0.03, 0.06, y: -0.12, color: Color.new(0.65, 0.3, 0.0))
    needles_c = EquilateralTriangle.new(0.15, color: Color::GREEN)
    tree_c = CompositeTransform.new(x: 0.6,)
    tree_c.push_component(trunk_c)
    tree_c.push_component(needles_c)

    winter_composite_transform = CompositeTransform.new()
    winter_composite_transform.push_component(snow)
    winter_composite_transform.push_component(sun)
    winter_composite_transform.push_component(snow_person_with_hat)
    winter_composite_transform.push_component(tree_a)
    winter_composite_transform.push_component(tree_b)
    winter_composite_transform.push_component(tree_c)
    winter_composite_transform
  end
end