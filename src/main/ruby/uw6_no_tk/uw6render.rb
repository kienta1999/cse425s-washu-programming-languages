require 'opengl'
require 'glu'
require 'glut'
require 'os'
require 'fileutils'

require_relative '../render/core/opengl_utils.rb'

include OpenGL, GLU, GLUT

class RenderAppImplementation
  def initialize(root, title, width, height, grid_line_color)
    @root = root
    @title = if title.nil? then
               "#{File.basename($0)} #{root.class.name}"
               # "RenderApp"
             else
               title
             end
    @initial_width = width
    @initial_height = height
  end

end

OpenGLUtils.setup

# https://github.com/vaiorabbit/ruby-opengl/blob/master/sample/simple.rb
class GlfwImplementation < RenderAppImplementation
  def initialize(root, title, width, height, grid_line_color)
    super
    @key_callbacks = {}
  end

  def bind(char, callback)
    @key_callbacks[char.upcase] = callback
  end

  def main_loop
    # include GLFW
    window = GLFW.glfwCreateWindow(@initial_width, @initial_height, @title, nil, nil)
    GLFW.glfwMakeContextCurrent(window)

    key_callback = GLFW::create_callback(:GLFWkeyfun) do |window_handle, key, scancode, action, mods|
      if action == GLFW::GLFW_PRESS
        if (key == GLFW::GLFW_KEY_ESCAPE || key == GLFW::GLFW_KEY_Q)
          GLFW.glfwSetWindowShouldClose(window_handle, 1)
        else
          k = nil
          if key == GLFW::GLFW_KEY_LEFT
            k = "LEFT"
          elsif key == GLFW::GLFW_KEY_RIGHT
            k = "RIGHT"
          elsif key == GLFW::GLFW_KEY_DOWN
            k = "DOWN"
          elsif key == GLFW::GLFW_KEY_UP
            k = "UP"
          elsif key == GLFW::GLFW_KEY_SPACE
            k = "SPACE"
          else
            k = key.chr(Encoding::UTF_8)
          end
          unless k.nil?
            callback = @key_callbacks[k]
            callback.call unless callback.nil?
          end
        end
      end
    end
    GLFW.glfwSetKeyCallback(window, key_callback)

    while GLFW.glfwWindowShouldClose(window) == 0
      width_ptr = ' ' * 8
      height_ptr = ' ' * 8
      GLFW.glfwGetFramebufferSize(window, width_ptr, height_ptr)
      width = width_ptr.unpack('L')[0]
      height = height_ptr.unpack('L')[0]
      # ratio = width.to_f / height.to_f

      glViewport(0, 0, width, height)
      glClearColor(0.8, 0.8, 1.0, 1.0)
      glClear(GL_COLOR_BUFFER_BIT)
      glMatrixMode(GL_PROJECTION)
      glLoadIdentity()
      glOrtho(0, width, height, 0, 1, -1)
      glMatrixMode(GL_MODELVIEW)
      glLoadIdentity()

      @root.render

      GLFW.glfwSwapBuffers(window)
      GLFW.glfwPollEvents()
    end

    GLFW.glfwDestroyWindow(window)
    GLFW.glfwTerminate()

  end
end

class TetrisRoot
  @@instance = nil

  def self.singleton
    @@instance
  end

  attr_reader :renderables

  def initialize
    @@instance = self
    @impl = GlfwImplementation.new(self, "Tetris", 205, 615, nil)
    @root = nil
    @renderables = []
  end

  def add_renderable(renderable)
    @renderables.push(renderable)
  end

  def stopTimer
    @timer_delay = nil
    @timer_callback = nil
  end

  def startTimer(delay, callback)
    @timer_delay = delay * 0.001
    @timer_callback = callback
  end

  def render
    unless @timer_delay.nil?
      curr_time = GLFW.glfwGetTime()
      if @prev_time.nil?
        @prev_time = curr_time
      end
      delta_time = curr_time - @prev_time
      if (delta_time > @timer_delay)
        @timer_callback.call
        @prev_time = curr_time
      end
    end

    @renderables.each do |r|
      r.render
    end
    # puts "TODO: render"
  end

  def bind(char, callback)
    @impl.bind(char, callback)
  end

  def mainLoop
    @impl.main_loop
  end

  def exitProgram
    puts "TODO: exitProgram"
  end

  # Necessary so we can unwrap before passing to Tk in some instances.
  # Student code MUST NOT CALL THIS.
  # attr_reader :root
end

class TetrisTimer
  def initialize
  end

  def stop
    TetrisRoot.singleton.stopTimer
  end

  def start(delay, callback)
    TetrisRoot.singleton.startTimer(delay, callback)
  end
end

class TetrisCanvas
  def initialize
    TetrisRoot.singleton.add_renderable(self)
    @rects = []
  end

  def add_rect(rect)
    @rects.push(rect)
  end

  def remove_rect(rect)
    @rects.delete(rect)
  end

  def place(height, width, x, y)
    @x = x
    @y = y
    @width = width
    @height = height
  end

  def unplace
    @x = nil
  end

  def delete
    puts "TODO: TetrisCanvas delete"
  end

  def render
    unless @x.nil?
      glColor3f(0.4, 0.4, 0.4)
      glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
      glBegin(GL_QUADS)
      glVertex2f(@x + @width, @y)
      glVertex2f(@x + @width, @y + @height)
      glVertex2f(@x, @y + @height)
      glVertex2f(@x, @y)
      glEnd()
      glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
      glColor3f(1.0, 1.0, 1.0)
      glBegin(GL_QUADS)
      glVertex2f(@x + @width, @y)
      glVertex2f(@x + @width, @y + @height)
      glVertex2f(@x, @y + @height)
      glVertex2f(@x, @y)
      glEnd()

      glPushMatrix
      glTranslatef(@x, @y, 0.0)
      @rects.each { |rect| rect.render }
      glPopMatrix
    end
  end

  # Necessary so we can unwrap before passing to Tk in some instances.
  # Student code MUST NOT CALL THIS.
  attr_reader :canvas
end

class TetrisLabel
  def initialize(wrapped_root, &options)
    TetrisRoot.singleton.add_renderable(self)
    @text = "Current Score"
  end

  def place(height, width, x, y)
    @x = x
    @y = y
    @width = width
    @height = height
  end

  def text(str)
    @text = str.to_s
  end

  def render
    glColor3f(0, 0, 0)
    unless @x.nil?
      unless @text.nil?
        glRasterPos2f(@x, @y)
        @text.each_byte do |c|
          glutBitmapCharacter(GLUT_BITMAP_HELVETICA_12, c)
        end
      end
    end
  end
end

class TetrisButton
  def initialize(label, color)
    # puts "TODO: TetrisButton initialize"
  end

  def place(height, width, x, y)
    # puts "TODO: TetrisButton place"
  end
end

class TetrisRect
  # color blind friendly selection
  # http://mkweb.bcgsc.ca/colorblind/img/colorblindness.palettes.v11.pdf
  @@color_hash = {
    'DarkGreen' => [53, 155, 115],
    'dark blue' => [34, 113, 178],
    'dark red' => [144, 0, 0],
    'gold2' => [240, 228, 66],
    'Purple3' => [247, 72, 165],
    'OrangeRed2' => [213, 94, 0],
    'LightSkyBlue' => [61, 183, 233]
  }

  def initialize(wrapped_canvas, a, b, c, d, color)
    @canvas = TetrisRoot.singleton.renderables[0]
    @x0 = a
    @y0 = b
    @x1 = c
    @y1 = d
    @color = @@color_hash[color]
    if @color.nil?
      # this should never happen
      random = Random.new
      @color = [random.rand(1.0), random.rand(1.0), random.rand(1.0)]
      @@color_hash[color] = @color
    end

    @canvas.add_rect(self)
  end

  def remove
    @canvas.remove_rect(self)
  end

  def move(dx, dy)
    @x0 += dx
    @x1 += dx
    @y0 += dy
    @y1 += dy
  end

  def render
    glColor3ub(@color[0], @color[1], @color[2])
    glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
    glBegin(GL_QUADS)
    glVertex2f(@x0, @y0)
    glVertex2f(@x1, @y0)
    glVertex2f(@x1, @y1)
    glVertex2f(@x0, @y1)
    glEnd()
    glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
    glColor3f(0.0, 0.0, 0.0)
    glBegin(GL_QUADS)
    glVertex2f(@x0, @y0)
    glVertex2f(@x1, @y0)
    glVertex2f(@x1, @y1)
    glVertex2f(@x0, @y1)
    glEnd()
  end
end

def mainLoop
  TetrisRoot.singleton.mainLoop
end

def exitProgram
  TetrisRoot.singleton.exitProgram
end
