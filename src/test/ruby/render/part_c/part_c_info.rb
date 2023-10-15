require_relative '../../../../core/ruby/download/download_utils'
require_relative '../core/eval_text_image_sub_path_pair'

require_relative 'require_all_but_composite'
require_relative '../core/keyword_text_utils'

class PartCInfo
  def eval_text_image_sub_path_pairs(is_complete: true)
    if is_complete
      convex_polygon_pairs + move_pairs
    else
      [convex_polygon_pairs.last, move_pairs.last]
    end
  end

  private

  def move_pairs
    result = []
    base_texts = [['Rectangle.new(0.5, 0.3, __XY__ color: Color::YELLOW);__MOVES__', 'Rectangle'],
                  ['Ellipse.new(0.2, 0.4, __XY__ color: Color::YELLOW);__MOVES__', 'Ellipse'],
                  ['EquilateralTriangle.new(0.5, __XY__ color: Color::YELLOW);__MOVES__', 'EquilateralTriangle'],
                  ['CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI, __XY__ color: Color::YELLOW);__MOVES__', 'CircularSegment'],
                  ['BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)], __XY__ color: Color::YELLOW);__MOVES__', 'BezierCurve'],
                  ['Text.new("Hello", Font::TIMES_ROMAN_24, __XY__ color: Color::YELLOW);__MOVES__', 'Text'],
                  ['ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)], __XY__ color: Color::YELLOW);__MOVES__', 'ConvexPolygon'],
                  ['Image.new(DownloadUtils.download_if_necessary("https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png"), __XY__);__MOVES__', 'Image'],
                  ['CompositeTransform.new(__XY__);movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));__MOVES__', 'CompositeTransform']
    ]
    base_texts.each do |base_text, prefix|
      result += move_pairs_for(base_text, prefix)
    end
    result
  end

  def move_pairs_for(base_text, prefix)
    texts = []
    xy_texts = ["",
                # ", x:0.2, ",
                # ", y:0.3, ",
                "x:0.4, y:0.5, "]
    moves_texts = ["",
                   "movable.move(:left, 0.5)",
                   "movable.move(:left, 0.5);movable.move(:right, 0.3)",
                   "movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1)",
                   "movable.move(:down, 0.5)",
                   "movable.move(:down, 0.5);movable.move(:up, 0.3)",
                   "movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1)",
                   "movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1)",
    ]
    xy_texts.each do |xy_text|
      moves_texts.each do |moves_text|
        text = 'movable = '
        text += base_text.gsub('__XY__', xy_text)
        text = text.gsub('__MOVES__', moves_text)
        text += ";movable"
        texts.push(text)
      end
    end
    result = []
    texts.each do |text|
      result.push(EvalTextImageSubPathPair.new(text, "#{prefix}_move#{result.length}"))
    end
    result
  end

  def convex_polygon_pairs
    texts = []
    points_texts.each do |points_text|
      texts.push(eval_text(points_text))
      texts.push(eval_text(points_text, x: -0.5))
      texts.push(eval_text(points_text, y: -0.2))
      texts.push(eval_text(points_text, color: "Color::YELLOW"))
      texts.push(eval_text(points_text, x: -0.5, y: -0.2, color: "Color::RED"))
    end

    result = []
    texts.each do |text|
      result.push(EvalTextImageSubPathPair.new(text, "ConvexPolygon#{result.length}"))
    end
    result
  end

  def points_texts
    complete_points_text = ["[Point2.new(-0.5, -0.5),
       Point2.new(-0.25, 0.25),
       Point2.new(0.25, 0.5),
       Point2.new(0.4, -0.35)
     ]",
                            "[Point2.new(0.0, 0.5),
      Point2.new(0.5, 0.0),
      Point2.new(0.0, -0.5),
      Point2.new(-0.6, -0.4),
      Point2.new(-0.7, 0.2),
     ]",
                            "[Point2.new(0.85, 0.0),
       Point2.new(0.1, 0.25),
       Point2.new(0.0, 0.45),
       Point2.new(0.15, 0.7),
       Point2.new(0.65, 1.0),
       Point2.new(0.95, 0.95),
       Point2.new(1.1, 0.75)
     ]"]
    complete_points_text
  end

  def eval_text(pts, x: nil, y: nil, color: nil)
    "ConvexPolygon.new(#{pts}, #{KeywordTextUtils.keyword_text('x', x)} #{KeywordTextUtils.keyword_text('y', y)} #{KeywordTextUtils.keyword_text('color', color)})"
  end

end