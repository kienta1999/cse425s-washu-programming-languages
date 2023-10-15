# Kien Ta
require_relative 'transform'
require 'chunky_png'

class Image < Transform
  attr_accessor :path
  def initialize(path, x: 0, y: 0)
    super(x, y)
    @path = path
    @png = ChunkyPNG::Image.from_file(path)
    @pixel_data = @png.to_rgb_stream.each_byte.to_a.pack("C*")
  end

  private
  def calculate_local_bounds
    raise StandardError.new("not yet implemented")
  end
  def render_transformed
    glRasterPos2f(0, 0)
    OpenGLUtils.preserve_previous_and_set_pixel_zoom(1,-1)
    glDrawPixels(@png.width, @png.height, GL_RGB, GL_UNSIGNED_BYTE, @pixel_data)
    OpenGLUtils.restore_previous_pixel_zoom
  end
end


if __FILE__ == $0
  require_relative '../core/render_app'
  require_relative '../../../../core/ruby/download/download_utils'
  uri = 'https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png'
  path = DownloadUtils.download(uri)
  app = RenderApp.new(Image.new(path))
  app.main_loop
end
