require 'opengl'

class OpenGLCheck
  def render
    glColor3f(1.0,0.0,0.0)
    glBegin(GL_TRIANGLES)
    glVertex2d(-0.5, -0.5)
    glVertex2d(0.5, -0.5)
    glVertex2d(0, 0.5)
    glEnd()
  end
end

if __FILE__ == $0
  require_relative '../render/core/render_app'
  app = RenderApp.new(OpenGLCheck.new, title: 'OpenGL Check')
  app.main_loop
end