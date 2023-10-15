require_relative 'transform_move_test'
require_relative '../../../../main/ruby/render/assignment/ellipse'

class EllipseMoveTest < Test::Unit::TestCase
  include TransformMoveTest

  private

  def create_transform(initial_x, initial_y)
    Ellipse.new(2, 3, x: initial_x, y: initial_y)
  end
end