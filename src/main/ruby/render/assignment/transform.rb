# Kien Ta
require_relative 'bounds'
class Transform
  attr_accessor :x, :y, :bound
  def initialize(x, y)
    @x = x
    @y = y
  end

  def render
    # preserve the current model view transform
    glPushMatrix()
    # translate
    glTranslated(x, y, 0)
    self.render_transformed
    # restore the model view transform
    glPopMatrix()
  end

  def move(direction,amount)
    case direction
      when :up
        @y = @y + amount
        if !@bound.nil?
          @bound.min.y  += amount
          @bound.max.y  += amount
        end
      when :down
        @y = @y - amount
        if !@bound.nil?
          @bound.min.y  -= amount
          @bound.max.y  -= amount
        end
      when :left
        @x = @x - amount
        if !@bound.nil?
          @bound.min.x  -= amount
          @bound.max.x  -= amount
        end
      when :right
        @x = @x + amount
        if !@bound.nil?
          @bound.min.x  += amount
          @bound.max.x  += amount
        end
      else
        raise ArgumentError.new "direction should be :up, :down, :left, or :right"
    end
  end

  def calculate_bounds
    bound = self.calculate_local_bounds
    bound.min.x += x
    bound.min.y += y
    bound.max.x += x
    bound.max.y += y
    bound
  end

  private
  def render_transformed
  end
end