require "test/unit"

require_relative 'require_all_but_composite'
require_relative '../../../../main/ruby/render/core/opengl_utils'

require_relative '../../../../core/ruby/download/download_utils'

class PartCMoveMethodUnitTest < Test::Unit::TestCase
  @@transformables = nil

  def test_move_left
    check_move(:left)
  end

  def test_move_right
    check_move(:right)
  end

  def test_move_up
    check_move(:up)
  end

  def test_move_down
    check_move(:down)
  end

  def test_move_argument_error
    transformables.each do |transformable|
      assert_raise(ArgumentError) { transformable.move(:invalid) }
    end
  end

  private

  def check_move(direction)
    transformables.each do |transformable|
      assert(transformable.public_method(:move))

      transformable.move(direction, 1)
      assert(true)
    end
  end

  def transformables
    if @@transformables.nil?
      OpenGLUtils.setup
      @@transformables = [Rectangle.new(1, 1),
                          Ellipse.new(1, 1),
                          EquilateralTriangle.new(0.5),
                          CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI),
                          BezierCurve.new([
                                            Point2.new(-0.5, -0.5),
                                            Point2.new(0.0, +0.5),
                                            Point2.new(0.5, -0.5)
                                          ]),
                          Text.new("Hello", GLUT::GLUT_BITMAP_TIMES_ROMAN_24),
                          CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI),
                          Image.new(DownloadUtils.download_if_necessary('https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png')),
                          CompositeTransform.new(),
                          ConvexPolygon.new([
                                              Point2.new(0.85, 0.0),
                                              Point2.new(0.1, 0.25),
                                              Point2.new(0.0, 0.45),
                                              Point2.new(0.15, 0.7),
                                              Point2.new(0.65, 1.0),
                                              Point2.new(0.95, 0.95),
                                              Point2.new(1.1, 0.75)
                                            ])
      ]
      OpenGLUtils.teardown
    end
    @@transformables
  end
end
