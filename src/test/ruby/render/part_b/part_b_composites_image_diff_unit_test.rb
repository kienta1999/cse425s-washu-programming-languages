require "test/unit"

require_relative '../core/image_diff_unit_test_mixin'
require_relative 'part_b_composites_info'

class PartBCompositeTransformSceneImageDiffUnitTest < Test::Unit::TestCase
  # generated begin

  def test_picture_diff_CompositeTransform0
    picture_diff("
circular_segment = CircularSegment.new(0.3, 0.4, Math::PI/6, 2*Math::PI/3,   color: Color::YELLOW);
composite_transform=CompositeTransform.new( );
composite_transform.push_component(circular_segment);
composite_transform",
                 "CompositeTransform0")
  end

  def test_picture_diff_CompositeTransform1
    picture_diff("
offset_circular_segment = CircularSegment.new(0.3, 0.4, Math::PI/6, 2*Math::PI/3, x: -0.7, y: 0.5, color: Color::YELLOW);
composite_transform=CompositeTransform.new( );
composite_transform.push_component(offset_circular_segment);
composite_transform",
                 "CompositeTransform1")
  end

  def test_picture_diff_CompositeTransform2
    picture_diff("
circular_segment = CircularSegment.new(0.3, 0.4, Math::PI/6, 2*Math::PI/3,   color: Color::YELLOW);
offset_composite_transform=CompositeTransform.new(x: 0.5, y: -0.3,);
offset_composite_transform.push_component(circular_segment);
offset_composite_transform",
                 "CompositeTransform2")
  end

  def test_picture_diff_CompositeTransform3
    picture_diff("
offset_circular_segment = CircularSegment.new(0.3, 0.4, Math::PI/6, 2*Math::PI/3, x: -0.7, y: 0.5, color: Color::YELLOW);
offset_composite_transform=CompositeTransform.new(x: 0.5, y: -0.3,);
offset_composite_transform.push_component(offset_circular_segment);
offset_composite_transform",
                 "CompositeTransform3")
  end

  def test_picture_diff_CompositeTransform4
    picture_diff("
trunk = Rectangle.new(0.05, 0.1, y:-0.2, color: Color.new(0.65, 0.3, 0.0));
needles = EquilateralTriangle.new(0.25, color: Color::GREEN);
tree = CompositeTransform.new( );
tree.push_component(trunk);
tree.push_component(needles);
tree",
                 "CompositeTransform4")
  end

  def test_picture_diff_CompositeTransform5
    picture_diff("
trunk = Rectangle.new(0.05, 0.1, y:-0.2, color: Color.new(0.65, 0.3, 0.0));
needles = EquilateralTriangle.new(0.25, color: Color::GREEN);
offset_tree = CompositeTransform.new(x: -0.7, y: -0.5,);
offset_tree.push_component(trunk);
offset_tree.push_component(needles);
offset_tree",
                 "CompositeTransform5")
  end

  def test_picture_diff_CompositeTransform6
    picture_diff("
brim_half_width = 0.15;
brim_half_height = brim_half_width*0.1;
crown_half_width = brim_half_width*0.8;
crown_half_height = crown_half_width*0.7;
hat_color=Color.new(0.125,0.5,0.125);
brim = Rectangle.new(brim_half_width, brim_half_height, color: hat_color);
crown = Rectangle.new(crown_half_width, crown_half_height, y: brim_half_height+crown_half_height, color: hat_color);
hat = CompositeTransform.new( );
hat.push_component(brim);
hat.push_component(crown);
hat",
                 "CompositeTransform6")
  end

  def test_picture_diff_CompositeTransform7
    picture_diff("
brim_half_width = 0.15;
brim_half_height = brim_half_width*0.1;
crown_half_width = brim_half_width*0.8;
crown_half_height = crown_half_width*0.7;
hat_color=Color.new(0.125,0.5,0.125);
brim = Rectangle.new(brim_half_width, brim_half_height, color: hat_color);
crown = Rectangle.new(crown_half_width, crown_half_height, y: brim_half_height+crown_half_height, color: hat_color);
offset_hat = CompositeTransform.new(x: 0.5, y: 0.7,);
offset_hat.push_component(brim);
offset_hat.push_component(crown);
offset_hat",
                 "CompositeTransform7")
  end

  def test_picture_diff_CompositeTransform8
    picture_diff("
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
snow_person",
                 "CompositeTransform8")
  end

  def test_picture_diff_CompositeTransform9
    picture_diff("
bottom_radius = 0.2;
middle_radius = bottom_radius * 0.8;
top_radius = middle_radius * 0.8;
bottom = Ellipse.new(bottom_radius, bottom_radius, color: Color::WHITE);
middle = Ellipse.new(middle_radius, middle_radius, y: bottom_radius + middle_radius, color: Color::WHITE);
top = Ellipse.new(top_radius, top_radius, y: bottom_radius + 2 * middle_radius + top_radius, color: Color::WHITE);
offset_snow_person = CompositeTransform.new(x: 0.25, y: -0.7,);
offset_snow_person.push_component(bottom);
offset_snow_person.push_component(middle);
offset_snow_person.push_component(top);
offset_snow_person",
                 "CompositeTransform9")
  end

  def test_picture_diff_CompositeTransform10
    picture_diff("

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
hat_color=Color.new(0.125,0.5,0.125);
brim = Rectangle.new(brim_half_width, brim_half_height, color: hat_color);
crown = Rectangle.new(crown_half_width, crown_half_height, y: brim_half_height+crown_half_height, color: hat_color);
offset_hat = CompositeTransform.new( y: 0.75,);
offset_hat.push_component(brim);
offset_hat.push_component(crown);

snow_person_with_hat = CompositeTransform.new( );
snow_person_with_hat.push_component(snow_person );
snow_person_with_hat.push_component(offset_hat);
snow_person_with_hat",
                 "CompositeTransform10")
  end

  def test_picture_diff_CompositeTransform11
    picture_diff("

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
hat_color=Color.new(0.125,0.5,0.125);
brim = Rectangle.new(brim_half_width, brim_half_height, color: hat_color);
crown = Rectangle.new(crown_half_width, crown_half_height, y: brim_half_height+crown_half_height, color: hat_color);
offset_hat = CompositeTransform.new( y: 0.75,);
offset_hat.push_component(brim);
offset_hat.push_component(crown);

offset_snow_person_with_hat = CompositeTransform.new(x: 0.25, y: -0.7,);
offset_snow_person_with_hat.push_component(snow_person );
offset_snow_person_with_hat.push_component(offset_hat);
offset_snow_person_with_hat",
                 "CompositeTransform11")
  end

  def test_picture_diff_CompositeTransform12
    picture_diff("
sun = Ellipse.new(0.18, 0.18, x: 0.5, y: 0.8, color: Color::YELLOW);
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
hat_color=Color.new(0.125,0.5,0.125);
brim = Rectangle.new(brim_half_width, brim_half_height, color: hat_color);
crown = Rectangle.new(crown_half_width, crown_half_height, y: brim_half_height+crown_half_height, color: hat_color);
offset_hat = CompositeTransform.new( y: 0.75,);
offset_hat.push_component(brim);
offset_hat.push_component(crown);

snow_person_with_hat = CompositeTransform.new(x: -0.5, y: -0.6,);
snow_person_with_hat.push_component(snow_person );
snow_person_with_hat.push_component(offset_hat);


trunk_a = Rectangle.new(0.05, 0.1, y:-0.2, color: Color.new(0.65, 0.3, 0.0));
needles_a = EquilateralTriangle.new(0.25, color: Color::GREEN);
tree_a = CompositeTransform.new(x: 0.4, y: -0.6,);
tree_a.push_component(trunk_a);
tree_a.push_component(needles_a);


trunk_b = Rectangle.new(0.04000000000000001, 0.08000000000000002, y:-0.16000000000000003, color: Color.new(0.65, 0.3, 0.0));
needles_b = EquilateralTriangle.new(0.2, color: Color::GREEN);
tree_b = CompositeTransform.new( y: -0.25,);
tree_b.push_component(trunk_b);
tree_b.push_component(needles_b);


trunk_c = Rectangle.new(0.03, 0.06, y:-0.12, color: Color.new(0.65, 0.3, 0.0));
needles_c = EquilateralTriangle.new(0.15, color: Color::GREEN);
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

  def test_picture_diff_Scene0
    picture_diff("Scene.new(background_color: Color::YELLOW)",
                 "Scene0")
  end

  def test_picture_diff_Scene1
    picture_diff("Scene.new(background_color: Color::BLUE)",
                 "Scene1")
  end

  def test_picture_diff_Scene2
    picture_diff("
scene = Scene.new(background_color: Color::BLUE);
scene.push_component(Rectangle.new(0.2, 0.3, color: Color::YELLOW));
scene",
                 "Scene2")
  end

  def test_picture_diff_Scene3
    picture_diff("
scene = Scene.new(background_color: Color::BLUE);
scene.push_component(Rectangle.new(0.2, 0.3, color: Color::YELLOW));
scene.push_component(CircularSegment.new(0.4, 0.1, Math::PI, Math::PI*2, y: -0.5, color: Color::RED))
scene",
                 "Scene3")
  end

  def test_picture_diff_Scene4
    picture_diff("
scene = Scene.new(background_color: Color::BLUE);
scene.push_component(Rectangle.new(0.2, 0.3, color: Color::YELLOW));
scene.push_component(CircularSegment.new(0.4, 0.1, Math::PI, Math::PI*2, y: -0.5, color: Color::RED))

brim_half_width = 0.15;
brim_half_height = brim_half_width*0.1;
crown_half_width = brim_half_width*0.8;
crown_half_height = crown_half_width*0.7;
hat_color=Color.new(0.125,0.5,0.125);
brim = Rectangle.new(brim_half_width, brim_half_height, color: hat_color);
crown = Rectangle.new(crown_half_width, crown_half_height, y: brim_half_height+crown_half_height, color: hat_color);
offset_hat_a = CompositeTransform.new(x: -0.5, y: 0.5,);
offset_hat_a.push_component(brim);
offset_hat_a.push_component(crown);
offset_hat_a;

brim_half_width = 0.15;
brim_half_height = brim_half_width*0.1;
crown_half_width = brim_half_width*0.8;
crown_half_height = crown_half_width*0.7;
hat_color=Color.new(0.125,0.5,0.125);
brim = Rectangle.new(brim_half_width, brim_half_height, color: hat_color);
crown = Rectangle.new(crown_half_width, crown_half_height, y: brim_half_height+crown_half_height, color: hat_color);
offset_hat_b = CompositeTransform.new(x: 0.5, y: 0.5,);
offset_hat_b.push_component(brim);
offset_hat_b.push_component(crown);
offset_hat_b;
scene.push_component(offset_hat_a)
scene.push_component(offset_hat_b)
scene",
                 "Scene4")
  end

  def test_picture_diff_Scene5
    picture_diff("
sun = Ellipse.new(0.15, 0.15, x: 0.5, y: 0.8, color: Color::YELLOW);
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
hat_color=Color.new(0.125,0.5,0.125);
brim = Rectangle.new(brim_half_width, brim_half_height, color: hat_color);
crown = Rectangle.new(crown_half_width, crown_half_height, y: brim_half_height+crown_half_height, color: hat_color);
offset_hat = CompositeTransform.new( y: 0.75,);
offset_hat.push_component(brim);
offset_hat.push_component(crown);

snow_person_with_hat = CompositeTransform.new(x: -0.5, y: -0.6,);
snow_person_with_hat.push_component(snow_person );
snow_person_with_hat.push_component(offset_hat);


trunk_a = Rectangle.new(0.05, 0.1, y:-0.2, color: Color.new(0.65, 0.3, 0.0));
needles_a = EquilateralTriangle.new(0.25, color: Color::GREEN);
tree_a = CompositeTransform.new(x: 0.4, y: -0.6,);
tree_a.push_component(trunk_a);
tree_a.push_component(needles_a);


trunk_b = Rectangle.new(0.04000000000000001, 0.08000000000000002, y:-0.16000000000000003, color: Color.new(0.65, 0.3, 0.0));
needles_b = EquilateralTriangle.new(0.2, color: Color::GREEN);
tree_b = CompositeTransform.new( y: -0.25,);
tree_b.push_component(trunk_b);
tree_b.push_component(needles_b);


trunk_c = Rectangle.new(0.03, 0.06, y:-0.12, color: Color.new(0.65, 0.3, 0.0));
needles_c = EquilateralTriangle.new(0.15, color: Color::GREEN);
tree_c = CompositeTransform.new(x: 0.6, );
tree_c.push_component(trunk_c);
tree_c.push_component(needles_c);

winter_scene = Scene.new(background_color: Color.new(0.8, 0.8, 1.0));
winter_scene.push_component(snow);
winter_scene.push_component(sun);
winter_scene.push_component(snow_person_with_hat);
winter_scene.push_component(tree_a);
winter_scene.push_component(tree_b);
winter_scene.push_component(tree_c);
winter_scene
    ",
                 "Scene5")
  end

  def test_picture_diff_Scene6
    picture_diff("
sun = Ellipse.new(0.075, 0.075, x: 0.5, y: 0.8, color: Color::YELLOW);
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
hat_color=Color.new(0.125,0.5,0.125);
brim = Rectangle.new(brim_half_width, brim_half_height, color: hat_color);
crown = Rectangle.new(crown_half_width, crown_half_height, y: brim_half_height+crown_half_height, color: hat_color);
offset_hat = CompositeTransform.new( y: 0.75,);
offset_hat.push_component(brim);
offset_hat.push_component(crown);

snow_person_with_hat = CompositeTransform.new(x: -0.5, y: -0.6,);
snow_person_with_hat.push_component(snow_person );
snow_person_with_hat.push_component(offset_hat);


trunk_a = Rectangle.new(0.05, 0.1, y:-0.2, color: Color.new(0.65, 0.3, 0.0));
needles_a = EquilateralTriangle.new(0.25, color: Color::GREEN);
tree_a = CompositeTransform.new(x: 0.4, y: -0.6,);
tree_a.push_component(trunk_a);
tree_a.push_component(needles_a);


trunk_b = Rectangle.new(0.04000000000000001, 0.08000000000000002, y:-0.16000000000000003, color: Color.new(0.65, 0.3, 0.0));
needles_b = EquilateralTriangle.new(0.2, color: Color::GREEN);
tree_b = CompositeTransform.new( y: -0.25,);
tree_b.push_component(trunk_b);
tree_b.push_component(needles_b);


trunk_c = Rectangle.new(0.03, 0.06, y:-0.12, color: Color.new(0.65, 0.3, 0.0));
needles_c = EquilateralTriangle.new(0.15, color: Color::GREEN);
tree_c = CompositeTransform.new(x: 0.6, );
tree_c.push_component(trunk_c);
tree_c.push_component(needles_c);

winter_scene = Scene.new(background_color: Color.new(1.0, 0.3, 0.0));
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
    @@pictures, @@exceptions = ImageDiffUnitTestSetup.setup_pictures_and_exceptions(PartBCompositesInfo.new, is_complete: true)
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