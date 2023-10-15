require_relative '../../../../core/ruby/download/download_utils'
require_relative '../core/eval_text_image_sub_path_pair'

require_relative '../../../../main/ruby/render/assignment/equilateral_triangle'
require_relative '../../../../main/ruby/render/assignment/rectangle'
require_relative '../../../../main/ruby/render/assignment/ellipse'
require_relative '../../../../main/ruby/render/assignment/image'
require_relative '../../../../main/ruby/render/assignment/text'
require_relative '../../../../main/ruby/render/assignment/circular_segment'
require_relative '../../../../main/ruby/render/assignment/bezier_curve'

class PartAInfo
  def initialize
    @complete = [[EvalTextImageSubPathPair.new('EquilateralTriangle.new(0.5)', 'EquilateralTriangle_A'),
                  EvalTextImageSubPathPair.new('EquilateralTriangle.new(0.1)', 'EquilateralTriangle_B')],
                 [EvalTextImageSubPathPair.new('Rectangle.new(0.4, 0.6)', 'Rectangle_A'),
                  EvalTextImageSubPathPair.new('Rectangle.new(0.7, 0.1)', 'Rectangle_B')],
                 [EvalTextImageSubPathPair.new('Ellipse.new(0.1, 0.2)', 'Ellipse_A'),
                  EvalTextImageSubPathPair.new('Ellipse.new(0.3, 0.4)', 'Ellipse_B')],
                 [EvalTextImageSubPathPair.new('CircularSegment.new(0.3, 0.4, -Math::PI/3, Math::PI/2)', 'CircularSegment_A'),
                  EvalTextImageSubPathPair.new('CircularSegment.new(0.7, 0.5, Math::PI, 3*Math::PI/2)', 'CircularSegment_B')],
                 [EvalTextImageSubPathPair.new("path = DownloadUtils.download_if_necessary('https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/resources/dan128.png');Image.new(path)", 'Image_A')],
                 [EvalTextImageSubPathPair.new('Text.new("SML", Font::TIMES_ROMAN_24)', 'Text_A'),
                  EvalTextImageSubPathPair.new('Text.new("Racket", Font::TIMES_ROMAN_24)', 'Text_B'),
                  EvalTextImageSubPathPair.new('Text.new("Ruby",Font::TIMES_ROMAN_24)', 'Text_C'),
                  EvalTextImageSubPathPair.new('Text.new("Java", Font::TIMES_ROMAN_24)', 'Text_D')],
                 [EvalTextImageSubPathPair.new('p0 = Point2.new(-0.5, -0.5);p1 = Point2.new(-0.25, 0.25);p2 = Point2.new(0.25, -0.5);p3 = Point2.new(0.5, 0.5);BezierCurve.new([p0, p1, p2, p3])', 'BezierCurve_A'),
                  EvalTextImageSubPathPair.new('p0 = Point2.new(0.3, 0.5);p1 = Point2.new(0.25, -0.25);p2 = Point2.new(-0.25, 0.75);p3 = Point2.new(-0.25, -0.25);BezierCurve.new([p0, p1, p2, p3])', 'BezierCurve_B')]]
  end

  def eval_text_image_sub_path_pairs(is_complete: true)
    if is_complete
      @complete.flatten(1)
    else
      @complete.map do |array|
        array.last
      end
    end
  end
end