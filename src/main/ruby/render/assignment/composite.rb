# Kien Ta

module Composite
  include Enumerable

  def push_component(component)
    @components.push(component)
  end

  def each_component
    if block_given?
      @components.each { |component|
        yield component
    }
    else
      to_enum(:each_component)
    end
  end
  alias_method :each , :each_component

  private
  def initialize_components
    @components = []
  end

  def calculate_local_bounds
    @bound = Bounds.new(Point2.new(9999, 9999), Point2.new(-9999, -9999))
    @components.each { |component|
      candidate_bound = component.calculate_bounds
      @bound.min.x = [@bound.min.x, candidate_bound.min.x].min
      @bound.min.y = [@bound.min.y, candidate_bound.min.y].min
      @bound.max.x = [@bound.max.x, candidate_bound.max.x].max
      @bound.max.y = [@bound.max.y, candidate_bound.max.y].max
    }
    @bound
  end
end
