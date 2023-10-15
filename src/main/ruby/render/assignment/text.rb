# Kien Ta

require_relative '../core/font'
require_relative 'color_transform'

class Text < ColorTransform
  attr_accessor :text, :font
  def initialize(text, font, x: 0, y: 0, color: nil)
    super(x, y, color)
    @text = text
    @font = font
  end

  private
  def calculate_local_bounds
    raise StandardError.new("not yet implemented")
  end
  def render_transformed
    bitmap_font = OpenGLUtils.to_bitmap_font(font)
    glRasterPos2i(0, 0)
    text.each_byte do |c|
      glutBitmapCharacter(bitmap_font, c)
    end
  end
end



if __FILE__==$0
  require_relative '../core/render_app'
  text = "SML, Racket, and Ruby"
  app = RenderApp.new(Text.new(text, Font::TIMES_ROMAN_24))
  app.main_loop
end
