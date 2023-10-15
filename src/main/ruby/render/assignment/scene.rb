# Kien Ta
require_relative 'bounds'
require_relative 'composite'

class Scene
  include Composite
  attr_accessor :background_color
  attr_reader :components
  def initialize(background_color: Color::BLACK)
    @background_color = background_color
    self.initialize_components
    calculate_bounds
  end

  def render
    glClearColor(@background_color.red, @background_color.green, @background_color.blue, 1.0)
    glClear(GL_COLOR_BUFFER_BIT)
    components.each { |component|
      component.render
    }
  end

  def calculate_bounds
    self.calculate_local_bounds
  end
end



if __FILE__ == $0
  require_relative '../core/render_app'
  require_relative 'equilateral_triangle'
  require_relative 'rectangle'
  require_relative 'composite_transform'
  class House < CompositeTransform
    def initialize(x: 0, y: 0)
      super
      push_component(Rectangle.new(0.2, 0.2, y: -0.3, color:Color::ALIZARAN_CRIMSON))
      push_component(EquilateralTriangle.new(0.25, color: Color::JEEPERS_CREEPERS))
    end
  end

  scene = Scene.new
  scene.push_component(House.new(x: -0.4, y: 0.5))
  scene.push_component(House.new(x: +0.2, y: -0.2))
  app = RenderApp.new(scene)
  app.main_loop
end
