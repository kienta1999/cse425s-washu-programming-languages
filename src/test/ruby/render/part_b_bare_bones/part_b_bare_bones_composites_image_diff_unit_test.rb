require "test/unit"

require_relative '../core/image_diff_unit_test_mixin'
require_relative '../part_b/part_b_composites_info'

class PartBBareBonesCompositesImageDiffUnitTest < Test::Unit::TestCase
  # generated begin

  def test_picture_diff_CompositeTransform12
    picture_diff("
sun = Ellipse.new(0.18, 0.18, x: 0.5, y: 0.8, color: Color::PARIS_DAISY);
snow = Rectangle.new(1.0, 0.5, y: -0.5, color: Color.new(0.85, 0.85, 0.85));


bottom_radius = 0.2;
middle_radius = bottom_radius * 0.8;
top_radius = middle_radius * 0.8;
bottom = Ellipse.new(bottom_radius, bottom_radius, color: Color::WHITE);
middle = Ellipse.new(middle_radius, middle_radius, y: bottom_radius + middle_radius, color: Color::WHITE);
top = Ellipse.new(top_radius, top_radius, y: bottom_radius + 2 * middle_radius + top_radius, color: Color::WHITE);
snow_person = CompositeTransform.new( );
snow_person.push_component(bottom);
snow_person.push_component(middle);
snow_person.push_component(top);


brim_half_width = 0.15;
brim_half_height = brim_half_width*0.1;
crown_half_width = brim_half_width*0.8;
crown_half_height = crown_half_width*0.7;
hat_color=Color::BARBIE_PINK;
brim = Rectangle.new(brim_half_width, brim_half_height, color: hat_color);
crown = Rectangle.new(crown_half_width, crown_half_height, y: brim_half_height+crown_half_height, color: hat_color);
offset_hat = CompositeTransform.new( y: 0.75,);
offset_hat.push_component(brim);
offset_hat.push_component(crown);

    snow_person_with_hat = CompositeTransform.new(x: -0.5, y: -0.6,);
snow_person_with_hat.push_component(snow_person );
snow_person_with_hat.push_component(offset_hat);


    trunk_a = Rectangle.new(0.05, 0.1, y:-0.2, color: Color::BAMBOO);
needles_a = EquilateralTriangle.new(0.25, color: Color::OCEAN_GREEN);
tree_a = CompositeTransform.new(x: 0.4, y: -0.6,);
tree_a.push_component(trunk_a);
tree_a.push_component(needles_a);


    trunk_b = Rectangle.new(0.04000000000000001, 0.08000000000000002, y:-0.16000000000000003, color: Color::BAMBOO);
needles_b = EquilateralTriangle.new(0.2, color: Color::OCEAN_GREEN);
tree_b = CompositeTransform.new( y: -0.25,);
tree_b.push_component(trunk_b);
tree_b.push_component(needles_b);


    trunk_c = Rectangle.new(0.03, 0.06, y:-0.12, color: Color::BAMBOO);
needles_c = EquilateralTriangle.new(0.15, color: Color::OCEAN_GREEN);
tree_c = CompositeTransform.new(x: 0.6, );
tree_c.push_component(trunk_c);
tree_c.push_component(needles_c);

    winter_composite_transform = CompositeTransform.new();
winter_composite_transform.push_component(snow);
winter_composite_transform.push_component(sun);
winter_composite_transform.push_component(snow_person_with_hat);
winter_composite_transform.push_component(tree_a);
winter_composite_transform.push_component(tree_b);
winter_composite_transform.push_component(tree_c);
winter_composite_transform
    ",
                 "CompositeTransform12")
  end

  def test_picture_diff_Scene6
    picture_diff("
sun = Ellipse.new(0.075, 0.075, x: 0.5, y: 0.8, color: Color::PARIS_DAISY);
snow = Rectangle.new(1.0, 0.5, y: -0.5, color: Color.new(0.85, 0.85, 0.85));


bottom_radius = 0.2;
middle_radius = bottom_radius * 0.8;
top_radius = middle_radius * 0.8;
bottom = Ellipse.new(bottom_radius, bottom_radius, color: Color::WHITE);
middle = Ellipse.new(middle_radius, middle_radius, y: bottom_radius + middle_radius, color: Color::WHITE);
top = Ellipse.new(top_radius, top_radius, y: bottom_radius + 2 * middle_radius + top_radius, color: Color::WHITE);
snow_person = CompositeTransform.new( );
snow_person.push_component(bottom);
snow_person.push_component(middle);
snow_person.push_component(top);


brim_half_width = 0.15;
brim_half_height = brim_half_width*0.1;
crown_half_width = brim_half_width*0.8;
crown_half_height = crown_half_width*0.7;
hat_color=Color::BARBIE_PINK;
brim = Rectangle.new(brim_half_width, brim_half_height, color: hat_color);
crown = Rectangle.new(crown_half_width, crown_half_height, y: brim_half_height+crown_half_height, color: hat_color);
offset_hat = CompositeTransform.new( y: 0.75,);
offset_hat.push_component(brim);
offset_hat.push_component(crown);

    snow_person_with_hat = CompositeTransform.new(x: -0.5, y: -0.6,);
snow_person_with_hat.push_component(snow_person );
snow_person_with_hat.push_component(offset_hat);


    trunk_a = Rectangle.new(0.05, 0.1, y:-0.2, color: Color::BAMBOO);
needles_a = EquilateralTriangle.new(0.25, color: Color::OCEAN_GREEN);
tree_a = CompositeTransform.new(x: 0.4, y: -0.6,);
tree_a.push_component(trunk_a);
tree_a.push_component(needles_a);


    trunk_b = Rectangle.new(0.04000000000000001, 0.08000000000000002, y:-0.16000000000000003, color: Color::BAMBOO);
needles_b = EquilateralTriangle.new(0.2, color: Color::OCEAN_GREEN);
tree_b = CompositeTransform.new( y: -0.25,);
tree_b.push_component(trunk_b);
tree_b.push_component(needles_b);


    trunk_c = Rectangle.new(0.03, 0.06, y:-0.12, color: Color::BAMBOO);
needles_c = EquilateralTriangle.new(0.15, color: Color::OCEAN_GREEN);
tree_c = CompositeTransform.new(x: 0.6, );
tree_c.push_component(trunk_c);
tree_c.push_component(needles_c);

    winter_scene = Scene.new(background_color: Color::BAMBOO);
winter_scene.push_component(snow);
winter_scene.push_component(sun);
winter_scene.push_component(snow_person_with_hat);
winter_scene.push_component(tree_a);
winter_scene.push_component(tree_b);
winter_scene.push_component(tree_c);
winter_scene
    ",
                 "Scene6")
  end



  # generated end

  def self.startup
    @@pictures, @@exceptions = ImageDiffUnitTestSetup.setup_pictures_and_exceptions(PartBCompositesInfo.new, is_complete: false)
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