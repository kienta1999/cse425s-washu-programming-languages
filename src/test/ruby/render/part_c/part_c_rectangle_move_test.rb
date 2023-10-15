require_relative 'transform_move_test'
require_relative '../../../../main/ruby/render/assignment/rectangle'

class RectangleMoveTest < Test::Unit::TestCase
  include TransformMoveTest

  private

  def create_transform(initial_x, initial_y)
    rect = Rectangle.new(2,3, x: initial_x, y: initial_y)
    assert_equal(initial_x, rect.x)
    assert_equal(initial_y, rect.y)
    rect
  end
end