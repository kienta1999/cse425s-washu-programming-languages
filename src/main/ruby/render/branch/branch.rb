require_relative '../logo/logo_turtle'
# Kien Ta
# Dennis Cosgrove

class Branch
  def initialize(length: 1.4, line_width: 0.01, max_depth: 5, wood_color: Color::CARMINE, leaf_color: Color::JEEPERS_CREEPERS, clear_color: Color::WHITE)
    super()
    @length = length
    @line_width = line_width
    @max_depth = max_depth

    @wood_color = wood_color
    @leaf_color = leaf_color
    @clear_color = clear_color

    @turtle = LogoTurtle.new
    @pen_width_stack = []
    @pen_color_stack = []
  end

  def render
    glTranslatef(-0.9, 0.0, 0.0)
    glRotatef(-90, 0.0, 0.0, 1.0)
    glClearColor(@clear_color.red, @clear_color.green, @clear_color.blue, 1.0)
    branch(@length, @line_width, @max_depth)
  end


  private

  def push_do_pop
    glPushMatrix()
    # do st

    glPopMatrix()
  end

  def branch(length, line_width, depth_remaining)
    @turtle.pen_color = @leaf_color
    @turtle.pen_width = line_width
    if depth_remaining == 0
      @turtle.forward length
      @turtle.right 180
      @turtle.forward length
      @turtle.right 180
      return
    else
      next_length = length * 0.5
      next_line_width = line_width * 0.8

      # first branch
      @turtle.pen_color = @clear_color
      @turtle.forward(length / 3.0)
      @turtle.right -30
      branch(next_length, next_line_width, depth_remaining - 1)
      @turtle.right 30

      # second branch
      # self.clear_color
      @turtle.pen_color = @clear_color
      @turtle.forward(length / 3.0)
      @turtle.right 30
      branch(next_length, next_line_width, depth_remaining - 1)
      @turtle.right -30

      # go to end of the branch
      @turtle.forward(length / 3.0)

      # go backward
      @turtle.pen_color = @wood_color
      glLineWidth(line_width)
      @turtle.right 180
      @turtle.forward(length)
      @turtle.right 180

    end
  end
end

if __FILE__ == $0
  require_relative '../core/render_app'
  app = RenderApp.new(Branch.new)
  app.main_loop
end
