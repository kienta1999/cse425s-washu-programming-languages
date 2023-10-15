require 'opengl'
require 'glu'
require 'glut'
require 'glfw'
require 'os'

class OpenGLUtils
  @@glut_is_initialized = false
  @@pixel_zoom_stack = []

  def self.setup
    # https://github.com/vaiorabbit/ruby-opengl
    OpenGL.load_lib()
    GLU.load_lib()
    if OS.windows?
      require_relative '../../../../core/ruby/download/download_utils'
      require_relative '../../../../core/ruby/zip/zip_utils'

      course_downloads_directory = DownloadUtils.downloads_directory
      FileUtils.mkdir_p course_downloads_directory
      download_glut_lib_path = File.join(course_downloads_directory, "freeglut", "bin", "x64", "freeglut.dll")
      unless File.exist?(download_glut_lib_path)
        uri = 'https://www.transmissionzero.co.uk/files/software/development/GLUT/freeglut-MinGW.zip'
        zip_file_path = File.join(course_downloads_directory, File.basename(uri))
        DownloadUtils.download_to_file(uri, zip_file_path)

        ZipUtils.unzip(zip_file_path, course_downloads_directory)

        unless File.exist?(download_glut_lib_path)
          raise download_glut_lib_path
        end
      end

      GLUT.load_lib(download_glut_lib_path)
    else
      GLUT.load_lib()
    end

    if OS.windows?
      download_glfw_lib_path = File.join(course_downloads_directory, 'glfw-3.3.2.bin.WIN64/lib-mingw-w64/glfw3.dll')
      unless File.exist?(download_glfw_lib_path)
        uri = 'https://github.com/glfw/glfw/releases/download/3.3.2/glfw-3.3.2.bin.WIN64.zip'
        zip_file_path = File.join(course_downloads_directory, File.basename(uri))
        DownloadUtils.download_to_file(uri, zip_file_path)

        ZipUtils.unzip(zip_file_path, course_downloads_directory)

        unless File.exist?(download_glfw_lib_path)
          raise download_glfw_lib_path
        end
      end

      GLFW.load_lib(download_glfw_lib_path)
    elsif OS.mac?
      pattern = "{/usr/local,/opt/homebrew}/Cellar/glfw/3.*.*/lib/libglfw.dylib"
      files = Dir.glob(pattern)
      if files.length == 0
        # brew libglfw not found. Fall back to system library search path.
        GLFW.load_lib()
      else
        homebrew_lib_path = files[0]
        if files.length > 1
          puts "found multiple glfws, selecting: #{homebrew_lib_path}"
        end
        GLFW.load_lib(homebrew_lib_path)
      end
    else
      GLFW.load_lib()
    end

    GLFW.glfwInit()

    unless OS.mac?
      unless @@glut_is_initialized
        argcp = [1].pack('I')
        argv = [""].pack('p')
        GLUT.glutInit(argcp, argv)
        @@glut_is_initialized = true
      end
    end

    if OS.mac?
      GLFW.glfwWindowHint(GLFW::GLFW_COCOA_RETINA_FRAMEBUFFER, GLFW::GLFW_FALSE)
    end

  end

  def self.teardown
    GLFW.glfwTerminate()
  end

  def self.preserve_previous_and_set_pixel_zoom(x, y)
    prev_zoom_x = gl_get_float(GL_ZOOM_X)
    prev_zoom_y = gl_get_float(GL_ZOOM_Y)
    @@pixel_zoom_stack.push([prev_zoom_x, prev_zoom_y])
    glPixelZoom(x, y)
  end

  def self.restore_previous_pixel_zoom
    prev_zoom_x, prev_zoom_y = @@pixel_zoom_stack.pop
    glPixelZoom(prev_zoom_x, prev_zoom_y)
  end

  def self.to_bitmap_font(font)
    if font == Font::TIMES_ROMAN_10
      GLUT_BITMAP_TIMES_ROMAN_10
    elsif font == Font::TIMES_ROMAN_24
      GLUT_BITMAP_TIMES_ROMAN_24
    elsif font == Font::HELVETICA_10
      GLUT_BITMAP_HELVETICA_10
    elsif font == Font::HELVETICA_12
      GLUT_BITMAP_HELVETICA_12
    elsif font == Font::HELVETICA_18
      GLUT_BITMAP_HELVETICA_18
    else
      raise "#{font.class}"
    end
  end

  private

  def self.gl_get_float(p)
    data = packFloat(0.0)
    glGetFloatv(p, data)
    unpackFloat(data)
  end

  def self.packFloat(f)
    array = [f]
    array.pack('f')
  end

  def self.unpackFloat(data)
    array = data.unpack('f')
    array[0]
  end
end
