require_relative '../core/eval_text_image_sub_path_pair'

require_relative '../../../../main/ruby/render/assignment/equilateral_triangle'
require_relative '../../../../main/ruby/render/assignment/ellipse'
require_relative '../../../../main/ruby/render/assignment/rectangle'
require_relative '../../../../main/ruby/render/assignment/composite_transform'
require_relative '../../../../main/ruby/render/assignment/scene'
require_relative '../../../../main/ruby/render/assignment/circular_segment'
require_relative '../core/keyword_text_utils'

class PartBCompositesInfo
  def eval_text_image_sub_path_pairs(is_complete: true)
    if is_complete
      composite_transform_pairs + scene_pairs
    else
      [composite_transform_pairs.last, scene_pairs.last]
    end
  end

  private

  def result_text(identifier, is_result)
    if is_result
      identifier
    else
      ""
    end
  end

  def circular_segment_composite_transform_text(circular_segment_identifier, circular_segment_x, circular_segment_y, composite_transform_identifier, composite_x, composite_y, is_result)
    "
    #{circular_segment_identifier} = CircularSegment.new(0.3, 0.4, Math::PI/6, 2*Math::PI/3, #{KeywordTextUtils.keyword_text('x', circular_segment_x)} #{KeywordTextUtils.keyword_text('y', circular_segment_y)} color: Color::PARIS_DAISY);
#{composite_transform_identifier}=CompositeTransform.new(#{KeywordTextUtils.keyword_text('x', composite_x)} #{KeywordTextUtils.keyword_text('y', composite_y)});
#{composite_transform_identifier}.push_component(#{circular_segment_identifier});
#{result_text(composite_transform_identifier, is_result)}"
  end

  def tree_text(post_fix, needle_side_length, tree_identifier, tree_x, tree_y, is_result)
    trunk_identifier = "trunk#{post_fix}"
    needles_identifier = "needles#{post_fix}"
    trunk_half_width = needle_side_length * 0.2
    trunk_half_height = trunk_half_width * 2
    "
    #{trunk_identifier} = Rectangle.new(#{trunk_half_width}, #{trunk_half_height}, y:-#{2 * trunk_half_height}, color: Color::BAMBOO);
#{needles_identifier} = EquilateralTriangle.new(#{needle_side_length}, color: Color::OCEAN_GREEN);
#{tree_identifier} = CompositeTransform.new(#{KeywordTextUtils.keyword_text('x', tree_x)} #{KeywordTextUtils.keyword_text('y', tree_y)});
#{tree_identifier}.push_component(#{trunk_identifier});
#{tree_identifier}.push_component(#{needles_identifier});
#{result_text(tree_identifier, is_result)}"
  end

  def hat_text(post_fix, hat_identifier, hat_x, hat_y, is_result)
    brim_identifier = "brim#{post_fix}"
    crown_identifier = "crown#{post_fix}"
    "
brim_half_width = 0.15;
brim_half_height = brim_half_width*0.1;
crown_half_width = brim_half_width*0.8;
crown_half_height = crown_half_width*0.7;
hat_color=Color::BARBIE_PINK;
#{brim_identifier} = Rectangle.new(brim_half_width, brim_half_height, color: hat_color);
#{crown_identifier} = Rectangle.new(crown_half_width, crown_half_height, y: brim_half_height+crown_half_height, color: hat_color);
#{hat_identifier} = CompositeTransform.new(#{KeywordTextUtils.keyword_text('x', hat_x)} #{KeywordTextUtils.keyword_text('y', hat_y)});
#{hat_identifier}.push_component(#{brim_identifier});
#{hat_identifier}.push_component(#{crown_identifier});
#{result_text(hat_identifier, is_result)}"
  end

  def snow_person_text(post_fix, snow_person_identifier, snow_person_x, snow_person_y, is_result)
    bottom_identifier = "bottom#{post_fix}"
    middle_identifier = "middle#{post_fix}"
    top_identifier = "top#{post_fix}"
    "
bottom_radius = 0.2;
middle_radius = bottom_radius * 0.8;
top_radius = middle_radius * 0.8;
#{bottom_identifier} = Ellipse.new(bottom_radius, bottom_radius, color: Color::WHITE);
#{middle_identifier} = Ellipse.new(middle_radius, middle_radius, y: bottom_radius + middle_radius, color: Color::WHITE);
#{top_identifier} = Ellipse.new(top_radius, top_radius, y: bottom_radius + 2 * middle_radius + top_radius, color: Color::WHITE);
#{snow_person_identifier} = CompositeTransform.new(#{KeywordTextUtils.keyword_text('x', snow_person_x)} #{KeywordTextUtils.keyword_text('y', snow_person_y)});
#{snow_person_identifier}.push_component(#{bottom_identifier});
#{snow_person_identifier}.push_component(#{middle_identifier});
#{snow_person_identifier}.push_component(#{top_identifier});
#{result_text(snow_person_identifier, is_result)}"
  end

  def snow_person_with_hat(post_fix, snow_person_with_hat_identifier, snow_person_with_hat_x, snow_person_with_hat_y, is_result)
    snow_person_identifier = "snow_person#{post_fix}"
    hat_identifier = "offset_hat#{post_fix}"
    "
    #{snow_person_text(post_fix, snow_person_identifier, nil, nil, false)}
    #{hat_text(post_fix, hat_identifier, nil, 0.75, false)}
    #{snow_person_with_hat_identifier} = CompositeTransform.new(#{KeywordTextUtils.keyword_text('x', snow_person_with_hat_x)} #{KeywordTextUtils.keyword_text('y', snow_person_with_hat_y)});
#{snow_person_with_hat_identifier}.push_component(#{snow_person_identifier} );
#{snow_person_with_hat_identifier}.push_component(#{hat_identifier});
#{result_text(snow_person_with_hat_identifier, is_result)}"
  end

  def winter_composite(composite_identifier, composite_class_construction, sun_radius)
    "
sun = Ellipse.new(#{sun_radius}, #{sun_radius}, x: 0.5, y: 0.8, color: Color::PARIS_DAISY);
snow = Rectangle.new(1.0, 0.5, y: -0.5, color: Color.new(0.85, 0.85, 0.85));
#{snow_person_with_hat('', 'snow_person_with_hat', -0.5, -0.6, false)}
    #{tree_text('_a', 0.25, 'tree_a', 0.4, -0.6, false)}
    #{tree_text('_b', 0.2, 'tree_b', nil, -0.25, false)}
    #{tree_text('_c', 0.15, 'tree_c', 0.6, nil, false)}
    #{composite_identifier} = #{composite_class_construction};
#{composite_identifier}.push_component(snow);
#{composite_identifier}.push_component(sun);
#{composite_identifier}.push_component(snow_person_with_hat);
#{composite_identifier}.push_component(tree_a);
#{composite_identifier}.push_component(tree_b);
#{composite_identifier}.push_component(tree_c);
#{composite_identifier}
    "
  end

  def composite_transform_pairs
    result = []
    texts = [circular_segment_composite_transform_text("circular_segment", nil, nil, "composite_transform", nil, nil, true),
             circular_segment_composite_transform_text("offset_circular_segment", -0.7, 0.5, "composite_transform", nil, nil, true),
             circular_segment_composite_transform_text("circular_segment", nil, nil, "offset_composite_transform", 0.5, -0.3, true),
             circular_segment_composite_transform_text("offset_circular_segment", -0.7, 0.5, "offset_composite_transform", 0.5, -0.3, true),
             tree_text("", 0.25, "tree", nil, nil, true),
             tree_text("", 0.25, "offset_tree", -0.7, -0.5, true),
             hat_text("", "hat", nil, nil, true),
             hat_text("", "offset_hat", 0.5, 0.7, true),
             snow_person_text("", "snow_person", nil, nil, true),
             snow_person_text("", "offset_snow_person", 0.25, -0.7, true),
             snow_person_with_hat("", "snow_person_with_hat", nil, nil, true),
             snow_person_with_hat("", "offset_snow_person_with_hat", 0.25, -0.7, true),
             winter_composite('winter_composite_transform', 'CompositeTransform.new()', 0.18)
    ]
    texts.each do |text|
      result.push(EvalTextImageSubPathPair.new(text, "CompositeTransform#{result.length}"))
    end
    result
  end

  def planet_winter_scene(sky_color, sun_radius)
    "#{winter_composite('winter_scene', "Scene.new(background_color: #{sky_color})", sun_radius)}"
  end

  def scene_pairs
    result = []
    texts = [
      "Scene.new(background_color: Color::PARIS_DAISY)",
      "Scene.new(background_color: Color::SUMMER_SKY)",
      "
scene = Scene.new(background_color: Color::SUMMER_SKY);
scene.push_component(Rectangle.new(0.2, 0.3, color: Color::PARIS_DAISY));
scene",
      "
scene = Scene.new(background_color: Color::SUMMER_SKY);
scene.push_component(Rectangle.new(0.2, 0.3, color: Color::PARIS_DAISY));
scene.push_component(CircularSegment.new(0.4, 0.1, Math::PI, Math::PI*2, y: -0.5, color: Color::GAMBAGE))
scene",
      "
scene = Scene.new(background_color: Color::SUMMER_SKY);
scene.push_component(Rectangle.new(0.2, 0.3, color: Color::PARIS_DAISY));
scene.push_component(CircularSegment.new(0.4, 0.1, Math::PI, Math::PI*2, y: -0.5, color: Color::GAMBAGE))
#{hat_text("", "offset_hat_a", -0.5, 0.5, true)};
#{hat_text("", "offset_hat_b", 0.5, 0.5, true)};
scene.push_component(offset_hat_a)
scene.push_component(offset_hat_b)
scene",
    ]
    sun_radius_on_earth = 0.15
    sun_radius_on_mars = sun_radius_on_earth * 0.5
    [["Color::SUMMER_SKY", sun_radius_on_earth], ["Color::BAMBOO", sun_radius_on_mars]].each do |sky_color, sun_radius|
      texts.push(planet_winter_scene(sky_color, sun_radius))
    end
    texts.each do |text|
      result.push(EvalTextImageSubPathPair.new(text, "Scene#{result.length}"))
    end
    result

  end
end