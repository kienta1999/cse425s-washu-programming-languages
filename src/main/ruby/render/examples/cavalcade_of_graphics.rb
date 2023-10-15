require 'chunky_png'
require_relative '../core/font'
require_relative '../core/render_app'
require_relative '../../../../core/ruby/download/download_utils'

class CavalcadeOfGraphics
  def initialize(path)
    @png = ChunkyPNG::Image.from_file(path)
    @pixel_data = @png.to_rgb_stream.each_byte.to_a.pack("C*")
  end

  def render
    # render a triangle
    glBegin(GL_TRIANGLES)
    glVertex2d(0, -0.5)
    glVertex2d(0.5, -0.5)
    glVertex2d(0.5, -0.75)
    glEnd()

    # set the paint to red
    glColor3f(1.0, 0.0, 0.0)

    # render a rectangle
    glBegin(GL_QUADS)
    glVertex2d(-0.25, -0.75)
    glVertex2d(-0.25, -0.5)
    glVertex2d(-0.75, -0.5)
    glVertex2d(-0.75, -0.75)
    glEnd()

    # set the paint to purple
    glColor3f(0.25, 0.0, 0.5)

    # preserve the current model view transform
    glPushMatrix()
    # translate
    glTranslated(0.5, 0.0, 0)

    # render an ellipse
    # NOTE: it hurts the author to not optimize this :)
    x_radius = 0.6
    y_radius = 0.3
    slice_count = 32
    delta_theta = (2 * Math::PI) / slice_count
    theta = 0
    glBegin(GL_POLYGON)
    slice_count.times do
      glVertex2f(x_radius * Math.cos(theta), y_radius * Math.sin(theta))
      theta += delta_theta
    end
    glEnd()

    # restore the model view transform
    glPopMatrix()

    # set the color to yellow
    glColor3f(1.0, 1.0, 0.0)

    # blt image to screen
    # NOTE: the image can disappear if the origin is offscreen
    # NOTE: it is often faster to texture a quad
    glRasterPos2f(-0.75, 0.75)


    OpenGLUtils.preserve_previous_and_set_pixel_zoom(1,-1)
    glDrawPixels(@png.width, @png.height, GL_RGB, GL_UNSIGNED_BYTE, @pixel_data)
    OpenGLUtils.restore_previous_pixel_zoom

    # draw text
    text = "SML, Racket, and Ruby"
    bitmap_font = OpenGLUtils.to_bitmap_font(Font::TIMES_ROMAN_24)
    glRasterPos2i(0, 0)
    text.each_byte do |c|
      glutBitmapCharacter(bitmap_font, c)
    end

    # preserve the current model view transform
    glPushMatrix()
    # translate
    glTranslated(0.4, 0.3, 0)

    # draw bezier curve
    # https://en.wikipedia.org/wiki/B%C3%A9zier_curve#Quadratic_B%C3%A9zier_curves
    is_cubic_desired = true
    if is_cubic_desired
      # cubic
      control_xys = [[-0.5, -0.5], [-0.25, 0.25], [0.25, -0.5], [0.5, 0.5]]
    else
      # quadratic
      control_xys = [[-0.5, -0.5], [0.0, +0.5], [0.5, -0.5]]
    end


    flat_xyzs = []
    control_xys.each do |x, y|
      flat_xyzs.push(x)
      flat_xyzs.push(y)
      flat_xyzs.push(0.0)
    end

    control_data = flat_xyzs.pack("f*")


    # set the color to white
    glColor3f(1.0, 1.0, 1.0)
    glMap1f(GL_MAP1_VERTEX_3, 0.0, 1.0, 3, control_xys.length, control_data)
    glEnable(GL_MAP1_VERTEX_3)
    glBegin(GL_LINE_STRIP)
    resolution_of_curve = 48
    resolution_of_curve.times do |i|
      glEvalCoord1f(i.to_f / resolution_of_curve)
    end
    glEvalCoord1d(1.0)
    glEnd()


    # set the color to magenta
    glColor3f(1.0, 0.0, 1.0)
    #draw the control points
    glPointSize(8.0)
    glBegin(GL_POINTS)
    control_xys.each do |x, y|
      glVertex2f(x, y);
    end
    glEnd()

    # restore the model view transform
    glPopMatrix()

  end
end


path = DownloadUtils.download_if_necessary('https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png')
app = RenderApp.new(CavalcadeOfGraphics.new(path))
app.main_loop
