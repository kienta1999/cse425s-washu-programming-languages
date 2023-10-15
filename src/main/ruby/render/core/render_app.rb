require 'opengl'
require 'glu'
require 'glut'
require 'os'
require 'fileutils'

require_relative 'opengl_utils'

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
    @grid_line_color = grid_line_color

    @theta = 0
    @delta_theta = 0
    @zoom = 1
    @delta_zoom = 0
  end

  private

  def render_grid_if_necessary
    unless @grid_line_color.nil?
      glColor3f(@grid_line_color.red, @grid_line_color.green, @grid_line_color.blue)
      glLineWidth(5)
      glBegin(GL_LINES)
      glVertex2d(-2.0, 0.0)
      glVertex2d(2.0, 0.0)
      xs = [-1.0, 0.0, 1.0]
      xs.each do |x|
        glVertex2d(x, -2.0)
        glVertex2d(x, 2.0)
      end
      glEnd()

      glLineWidth(1)
      glBegin(GL_LINES)
      vs = [0.25, 0.5, 0.75, 1.25]
      vs.each do |v|
        glVertex2d(-2.0, v)
        glVertex2d(2.0, v)
        glVertex2d(-2.0, -v)
        glVertex2d(2.0, -v)
        glVertex2d(v, -2.0)
        glVertex2d(v, 2.0)
        glVertex2d(-v, -2.0)
        glVertex2d(-v, 2.0)
      end
      glEnd()
    end
  end
end

OpenGLUtils.setup

# https://github.com/vaiorabbit/ruby-opengl/blob/master/sample/simple.rb
class GlfwImplementation < RenderAppImplementation
  def main_loop
    # include GLFW
    window = GLFW.glfwCreateWindow(@initial_width, @initial_height, @title, nil, nil)
    GLFW.glfwMakeContextCurrent(window)

    key_callback = GLFW::create_callback(:GLFWkeyfun) do |window_handle, key, scancode, action, mods|
      delta_theta_abs = 45.0
      delta_zoom_abs = 0.4
      if key == GLFW::GLFW_KEY_ESCAPE && action == GLFW::GLFW_PRESS
        GLFW.glfwSetWindowShouldClose(window_handle, 1)
      elsif key == GLFW::GLFW_KEY_LEFT && action == GLFW::GLFW_PRESS
        @delta_theta = delta_theta_abs
      elsif key == GLFW::GLFW_KEY_RIGHT && action == GLFW::GLFW_PRESS
        @delta_theta = -delta_theta_abs
      elsif key == GLFW::GLFW_KEY_DOWN && action == GLFW::GLFW_PRESS
        @delta_zoom = delta_zoom_abs
      elsif key == GLFW::GLFW_KEY_UP && action == GLFW::GLFW_PRESS
        @delta_zoom = -delta_zoom_abs
      elsif action == GLFW::GLFW_RELEASE
        @delta_theta = 0.0
        @delta_zoom = 0.0
      end
    end
    GLFW.glfwSetKeyCallback(window, key_callback)

    prev_time = GLFW.glfwGetTime()
    while GLFW.glfwWindowShouldClose(window) == 0
      curr_time = GLFW.glfwGetTime()
      delta_time = curr_time - prev_time
      @theta += @delta_theta * delta_time
      @zoom += @delta_zoom * delta_time
      @zoom = [@zoom, 0.1].max

      width_ptr = ' ' * 8
      height_ptr = ' ' * 8
      GLFW.glfwGetFramebufferSize(window, width_ptr, height_ptr)
      width = width_ptr.unpack('L')[0]
      height = height_ptr.unpack('L')[0]
      ratio = width.to_f / height.to_f


      glViewport(0, 0, width, height)
      glClear(GL_COLOR_BUFFER_BIT)
      glMatrixMode(GL_PROJECTION)
      glLoadIdentity()
      glOrtho(-ratio * @zoom, ratio * @zoom, -@zoom, @zoom, 1.0, -1.0)
      glMatrixMode(GL_MODELVIEW)

      glLoadIdentity()
      # set the color to white
      glColor3f(1.0, 1.0, 1.0)

      glRotated(@theta, 0, 0, 1)

      render_grid_if_necessary
      @root.render

      GLFW.glfwSwapBuffers(window)
      GLFW.glfwPollEvents()
      prev_time = curr_time
    end

    GLFW.glfwDestroyWindow(window)
    GLFW.glfwTerminate()

  end
end

class RenderApp
  def initialize(root, title: nil, width: 640, height: 480, grid_line_color: nil)
    @impl = GlfwImplementation.new(root, title, width, height, grid_line_color)
  end

  def main_loop
    @impl.main_loop
  end
end
