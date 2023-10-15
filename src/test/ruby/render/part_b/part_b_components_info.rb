require_relative '../../../../core/ruby/download/download_utils'
require_relative '../core/eval_text_image_sub_path_pair'

require_relative '../../../../main/ruby/render/assignment/equilateral_triangle'
require_relative '../../../../main/ruby/render/assignment/rectangle'
require_relative '../../../../main/ruby/render/assignment/ellipse'
require_relative '../../../../main/ruby/render/assignment/image'
require_relative '../../../../main/ruby/render/assignment/text'
require_relative '../../../../main/ruby/render/assignment/circular_segment'
require_relative '../../../../main/ruby/render/assignment/bezier_curve'

class PartBComponentsInfo
  def eval_text_image_sub_path_pairs(is_complete: true)
    if is_complete
      equilateral_triangle_pairs + rectangle_pairs + ellipse_pairs + circular_segment_pairs + image_pairs + text_pairs + bezier_curve_pairs
    else
      [equilateral_triangle_pairs.last, rectangle_pairs.last, ellipse_pairs.last, circular_segment_pairs.last, image_pairs.last, text_pairs.last, bezier_curve_pairs.last]
    end
  end

  private

  def equilateral_triangle_pairs
    result = []
    [0.5, 0.2].each do |half_side_length|
      result.push(EvalTextImageSubPathPair.new("EquilateralTriangle.new(#{half_side_length}, x: 0.5)", "EquilateralTriangle#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("EquilateralTriangle.new(#{half_side_length}, y: -0.5)", "EquilateralTriangle#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("EquilateralTriangle.new(#{half_side_length}, color: Color::PARIS_DAISY)", "EquilateralTriangle#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("EquilateralTriangle.new(#{half_side_length}, y: 0.3, color: Color::BARBIE_PINK, x: -0.7)", "EquilateralTriangle#{result.length}"))
    end
    result
  end

  def rectangle_pairs
    result = []
    [[0.4, 0.3], [0.2, 0.5]].each do |half_width,half_height|
      result.push(EvalTextImageSubPathPair.new("Rectangle.new(#{half_width}, #{half_height}, x: 0.5)", "Rectangle#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("Rectangle.new(#{half_width}, #{half_height}, y: -0.5)", "Rectangle#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("Rectangle.new(#{half_width}, #{half_height}, color: Color::PARIS_DAISY)", "Rectangle#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("Rectangle.new(#{half_width}, #{half_height}, y: 0.3, color: Color::BARBIE_PINK, x: -0.7)", "Rectangle#{result.length}"))
    end
    result
  end

  def ellipse_pairs
    result = []
    [[0.4, 0.3], [0.2, 0.5]].each do |x_radius,y_radius|
      result.push(EvalTextImageSubPathPair.new("Ellipse.new(#{x_radius}, #{y_radius}, x: 0.5)", "Ellipse#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("Ellipse.new(#{x_radius}, #{y_radius}, y: -0.5)", "Ellipse#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("Ellipse.new(#{x_radius}, #{y_radius}, color: Color::PARIS_DAISY)", "Ellipse#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("Ellipse.new(#{x_radius}, #{y_radius}, y: 0.3, color: Color::BARBIE_PINK, x: -0.7)", "Ellipse#{result.length}"))
    end
    result
  end

  def circular_segment_pairs
    result = []
    [[0.3, 0.4, "-Math::PI/3", "Math::PI/2"], [0.2, 0.5, "Math::PI/4", "3*Math::PI/2"]].each do |x_radius,y_radius, theta_a, theta_z|
      result.push(EvalTextImageSubPathPair.new("CircularSegment.new(#{x_radius}, #{y_radius}, #{theta_a}, #{theta_z}, x: 0.5)", "CircularSegment#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("CircularSegment.new(#{x_radius}, #{y_radius}, #{theta_a}, #{theta_z}, y: -0.5)", "CircularSegment#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("CircularSegment.new(#{x_radius}, #{y_radius}, #{theta_a}, #{theta_z}, color: Color::PARIS_DAISY)", "CircularSegment#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("CircularSegment.new(#{x_radius}, #{y_radius}, #{theta_a}, #{theta_z}, y: 0.3, color: Color::BARBIE_PINK, x: -0.7)", "CircularSegment#{result.length}"))
    end
    result
  end

  def image_pairs
    result = []
    ["dan128", "ruby_logo"].each do |sub_path|
      prefix = "path = DownloadUtils.download_if_necessary('https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/resources/#{sub_path}.png')"
      result.push(EvalTextImageSubPathPair.new("#{prefix};Image.new(path, x: 0.5)", "Image#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("#{prefix};Image.new(path, y: -0.5)", "Image#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("#{prefix};Image.new(path, y: 0.3, x: -0.7)", "Image#{result.length}"))
    end
    result
  end

  def text_pairs
    result = []
    ["SML", "Racket", "Ruby"].each do |s|
      result.push(EvalTextImageSubPathPair.new("Text.new(\"#{s}\", Font::TIMES_ROMAN_24, x: 0.5)", "Text#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("Text.new(\"#{s}\", Font::TIMES_ROMAN_24, y: -0.5)", "Text#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("Text.new(\"#{s}\", Font::TIMES_ROMAN_24, color: Color::PARIS_DAISY)", "Text#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("Text.new(\"#{s}\", Font::TIMES_ROMAN_24, y: 0.3, color: Color::BARBIE_PINK, x: -0.7)", "Text#{result.length}"))
    end
    result
  end

  def bezier_curve_pairs
    result = []
    ['p0 = Point2.new(-0.5, -0.5);p1 = Point2.new(-0.25, 0.25);p2 = Point2.new(0.25, -0.5);p3 = Point2.new(0.5, 0.5);BezierCurve.new([p0,p1,p2,p3]',
     'p0 = Point2.new(-0.5, -0.5);p1 = Point2.new(0.0, +0.5);p2 = Point2.new(0.5, -0.5);BezierCurve.new([p0,p1,p2]'].each do |prefix|
      result.push(EvalTextImageSubPathPair.new("#{prefix}, x: 0.5)", "BezierCurve#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("#{prefix}, y: -0.5)", "BezierCurve#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("#{prefix}, color: Color::PARIS_DAISY)", "BezierCurve#{result.length}"))
      result.push(EvalTextImageSubPathPair.new("#{prefix}, y: 0.3, color: Color::BARBIE_PINK, x: -0.7)", "BezierCurve#{result.length}"))
    end
    result
  end
end