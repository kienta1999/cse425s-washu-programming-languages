require_relative '../point2d/cartesian_point2d'
require_relative '../point2d/polar_point2d'

def output(pt)
  puts pt.class
  puts "=" * 20
  puts "               to_s: #{pt}"
  puts "            inspect: #{pt.inspect}"
  puts "             (x, y): (#{pt.x}, #{pt.y})"
  puts "distance from (0,0): #{pt.distance_from_origin}"
  puts
end

cartesian = CartesianPoint2d.new(3.0, 4.0)
output(cartesian)

polar = PolarPoint2d.new(10.0, Math::PI/3.0)
output(polar)
