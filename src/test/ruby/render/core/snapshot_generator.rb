require_relative '../../../../main/ruby/render/core/opengl_utils'
require_relative '../../../../main/ruby/render/core/color'

include OpenGL, GLU, GLUT

class SnapshotGenerator
  attr_reader :width, :height

  def initialize(width: 256, height: 256, clear_color: Color::HONOLULU_BLUE)

    @width = width
    @height = height
    @clear_color = clear_color

    OpenGLUtils.setup

    border_x = 16
    border_y = 32
    @window = GLFW.glfwCreateWindow(@width + border_x, @height + border_y, "snapshot", nil, nil)
    GLFW.glfwMakeContextCurrent(@window)
  end

  def generate(renderable)
    is_clear_desired = true
    if Module.constants.include?(:Scene) and renderable.is_a?(Scene)
      is_clear_desired = false
    end

    if is_clear_desired
      glClearColor(@clear_color.red, @clear_color.green, @clear_color.blue, 1.0)
      glClear(GL_COLOR_BUFFER_BIT)
    end

    glViewport(0, 0, @width, @height)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    glOrtho(-1.0, 1.0, -1.0, 1.0, 1.0, -1.0)
    glMatrixMode(GL_MODELVIEW)

    glLoadIdentity()
    # set the color to white
    glColor3f(1.0, 1.0, 1.0)

    renderable.render
    glFlush

    pixels = Array.new(@width * @height * 3, 0)
    data = pixels.pack("C*")
    glReadBuffer(GL_BACK)
    glReadPixels(0, 0, @width, @height, GL_RGB, GL_UNSIGNED_BYTE, data)

    data.unpack("C*")
  end

  def generate_png(renderable)
    pixels = generate(renderable)
    rgbs = Array.new(pixels.length / 3)
    s = 0
    y = @height - 1
    x = 0
    while s < pixels.length
      if x == @width
        x = 0
        y -= 1
      end
      r = pixels[s]
      g = pixels[s + 1]
      b = pixels[s + 2]
      d = (y * @width) + x
      rgbs[d] = ChunkyPNG::Color.rgba(r, g, b, 255)
      s += 3
      x += 1
    end

    ChunkyPNG::Image.new(@width, @height, rgbs)
  end

  def teardown
    GLFW.glfwDestroyWindow(@window)
    OpenGLUtils.teardown
  end
end