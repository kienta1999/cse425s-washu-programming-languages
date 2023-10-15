# https://el.media.mit.edu/logo-foundation/what_is_logo/logo_primer.html
require_relative '../core/color'

class LogoTurtle
  attr_accessor :pen_color, :pen_width
  def initialize
    super
    @is_pen_down = true
    @pen_width = 0.005
    @pen_color = Color::WHITE
  end

  def pen_up
    @is_pen_down = false
  end

  def pen_down
    @is_pen_down = true
  end


  def forward(amount)
    y = amount
    x = @pen_width
    if @is_pen_down
      glColor3f(@pen_color.red, @pen_color.green, @pen_color.blue)
      glBegin(GL_QUADS)
      glVertex2d(-x, 0.0)
      glVertex2d(-x, y)
      glVertex2d(x, y)
      glVertex2d(x, 0.0)
      glEnd()
    end
    glTranslatef(0,y,0)
  end

  def right(degrees)
    glRotatef(degrees, 0, 0, -1)
  end
end
