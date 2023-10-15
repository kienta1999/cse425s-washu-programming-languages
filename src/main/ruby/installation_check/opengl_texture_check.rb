require 'opengl'
require 'chunky_png'

class OpenGLTextureCheck
  def initialize(path)
    @image = ChunkyPNG::Image.from_file(path)
    @data = @image.to_rgb_stream.each_byte.to_a.pack("C*")
  end

  def render
    glRasterPos2f(-0.5,0.5)
    glPixelZoom(1,-1)
    glDrawPixels(@image.width, @image.height, GL_RGB, GL_UNSIGNED_BYTE, @data)
  end
end

if __FILE__ == $0
  require_relative '../render/core/render_app'
  app = RenderApp.new(OpenGLTextureCheck.new('ruby_logo.png'), title: 'OpenGL Texture Check')
  app.main_loop
end