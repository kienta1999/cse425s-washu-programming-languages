require 'chunky_png'

class ImageDiff
  def self.create_diff_image(a, b)
    raise "width: #{a.width} != #{b.width}" unless a.width == b.width
    raise "height: #{a.height} != #{b.height}" unless a.height == b.height
    bg_color = ChunkyPNG::Color::WHITE
    diff = ChunkyPNG::Image.new(a.width, a.height, bg_color)
    pass_color = ChunkyPNG::Color::BLACK
    fail_color = ChunkyPNG::Color::rgb(255, 0, 0)
    each_pixel(a) do |x, y, a_pixel|
      b_pixel = b[x, y]
      diff[x, y] = if self.is_pixel_close_enough?(a_pixel, b_pixel)
                     pass_color
                   else
                     fail_color
                   end
    end
    diff
  end

  def self.diff_pixel_count_exact(a, b)
    diff_pixel_count(a, b, false)
  end

  def self.diff_pixel_count_allow_neighbors(a, b)
    diff_pixel_count(a, b, true)
  end

  private

  def self.diff_pixel_count(a, b, is_allow_neighbors)
    raise "width: #{a.width} != #{b.width}" unless a.width == b.width
    raise "height: #{a.height} != #{b.height}" unless a.height == b.height
    count = 0
    each_pixel(a) do |x, y, a_pixel|
      count += if pixel_pass?(a_pixel, b, x, y, is_allow_neighbors)
                 0
               else
                 1
               end
    end
    count
  end

  def self.pixel_pass?(a_pixel, b, x, y, is_allow_neighbors)
    pixels_to_check(b, x, y, is_allow_neighbors).each do |b_pixel|
      if a_pixel == b_pixel
        return true
      else
        if is_pixel_close_enough?(a_pixel, b_pixel)
          return true
        end
      end
    end
    false
  end

  def self.is_pixel_close_enough?(a_pixel, b_pixel)
    a_red = ChunkyPNG::Color.r(a_pixel)
    b_red = ChunkyPNG::Color.r(b_pixel)
    a_green = ChunkyPNG::Color.g(a_pixel)
    b_green = ChunkyPNG::Color.g(b_pixel)
    a_blue = ChunkyPNG::Color.b(a_pixel)
    b_blue = ChunkyPNG::Color.b(b_pixel)
    is_pixel_component_close_enough?(a_red, b_red) and is_pixel_component_close_enough?(a_green, b_green) and is_pixel_component_close_enough?(a_blue, b_blue)
  end

  def self.is_pixel_component_close_enough?(a_component, b_component)
    (a_component-b_component).abs<=1
  end

  def self.pixels_to_check(b, x, y, is_allow_neighbors)
    array = [b[x,y]]
    if is_allow_neighbors
      (-1..1).each do |dy|
        (-1..1).each do |dx|
          if dx != 0 or dy != 0
            if b.include_xy?(x + dx, y + dy)
              array.push(b[x + dx, y + dy])
            end
          end
        end
      end
    end
    array
  end

  def self.each_pixel(a)
    a.height.times do |y|
      a.row(y).each_with_index do |pixel, x|
        yield x, y, pixel
      end
    end
  end
end


