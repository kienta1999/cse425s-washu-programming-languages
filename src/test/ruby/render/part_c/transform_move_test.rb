require "test/unit"

module TransformMoveTest
  def test_left
    initial_x = 4
    initial_y = 5
    transform = create_transform(initial_x, initial_y)

    expected_x = initial_x
    delta_xs = [0.5, -0.25, 0.123]
    delta_xs.each do |delta_x|
      transform.move(:left, delta_x)
      expected_x -= delta_x
      assert_equal(expected_x, transform.x)
      assert_equal(initial_y, transform.y)
    end
  end

  def test_right
    initial_x = 6
    initial_y = 7
    transform = create_transform(initial_x, initial_y)

    expected_x = initial_x
    delta_xs = [0.5, -0.25, 0.123]
    delta_xs.each do |delta_x|
      transform.move(:right, delta_x)
      expected_x += delta_x
      assert_equal(expected_x, transform.x)
      assert_equal(initial_y, transform.y)
    end
  end

  def test_down
    initial_x = 7
    initial_y = 8
    transform = create_transform(initial_x, initial_y)

    expected_y = initial_y
    delta_ys = [0.5, -0.25, 0.123]
    delta_ys.each do |delta_y|
      transform.move(:down, delta_y)
      expected_y -= delta_y
      assert_equal(initial_x, transform.x)
      assert_equal(expected_y, transform.y)
    end
  end

  def test_up
    initial_x = 9
    initial_y = 10
    transform = create_transform(initial_x, initial_y)

    expected_y = initial_y
    delta_ys = [0.5, -0.25, 0.123]
    delta_ys.each do |delta_y|
      transform.move(:up, delta_y)
      expected_y += delta_y
      assert_equal(initial_x, transform.x)
      assert_equal(expected_y, transform.y)
    end
  end

  private

  def create_transform(initial_x, initial_y)
    raise "override method: #{__method__} on class: #{self.class}"
  end
end