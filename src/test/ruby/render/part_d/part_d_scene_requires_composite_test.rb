require "test/unit"

require_relative 'requires_file_utils'

class SceneRequiresCompositeTest < Test::Unit::TestCase
  include RequiresFileUtils

  def test_scene_requires_composite
    check_symbol(:Composite, :Scene, 'scene')
  end
end