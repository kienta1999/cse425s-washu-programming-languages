require "test/unit"

require_relative '../../../../main/ruby/render/core/color'
require_relative '../../../../main/ruby/render/assignment/scene'

class PartBSceneBackgroundColorTest < Test::Unit::TestCase
  def test_default
    scene = Scene.new
    assert_equal(Color::BLACK, scene.background_color)
  end

  def test_custom
    scene = Scene.new(background_color: Color::SUMMER_SKY)
    assert_equal(Color::SUMMER_SKY, scene.background_color)
  end

  def test_mutation
    scene = Scene.new(background_color: Color::FRENCH_VIOLET)
    assert_equal(Color::FRENCH_VIOLET, scene.background_color)
    scene.background_color = Color::PARIS_DAISY
    assert_equal(Color::PARIS_DAISY, scene.background_color)
  end
end