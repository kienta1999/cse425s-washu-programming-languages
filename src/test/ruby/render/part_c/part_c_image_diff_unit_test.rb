require "test/unit"

require_relative '../core/image_diff_unit_test_mixin'
require_relative 'part_c_info'

class PartCImageDiffUnitTest < Test::Unit::TestCase
  # generated begin

  def test_picture_diff_ConvexPolygon0
    picture_diff("ConvexPolygon.new([Point2.new(-0.5, -0.5),
       Point2.new(-0.25, 0.25),
       Point2.new(0.25, 0.5),
       Point2.new(0.4, -0.35)
     ],   )",
                 "ConvexPolygon0")
  end

  def test_picture_diff_ConvexPolygon1
    picture_diff("ConvexPolygon.new([Point2.new(-0.5, -0.5),
       Point2.new(-0.25, 0.25),
       Point2.new(0.25, 0.5),
       Point2.new(0.4, -0.35)
     ], x: -0.5,  )",
                 "ConvexPolygon1")
  end

  def test_picture_diff_ConvexPolygon2
    picture_diff("ConvexPolygon.new([Point2.new(-0.5, -0.5),
       Point2.new(-0.25, 0.25),
       Point2.new(0.25, 0.5),
       Point2.new(0.4, -0.35)
     ],  y: -0.2, )",
                 "ConvexPolygon2")
  end

  def test_picture_diff_ConvexPolygon3
    picture_diff("ConvexPolygon.new([Point2.new(-0.5, -0.5),
       Point2.new(-0.25, 0.25),
       Point2.new(0.25, 0.5),
       Point2.new(0.4, -0.35)
     ],   color: Color::YELLOW,)",
                 "ConvexPolygon3")
  end

  def test_picture_diff_ConvexPolygon4
    picture_diff("ConvexPolygon.new([Point2.new(-0.5, -0.5),
       Point2.new(-0.25, 0.25),
       Point2.new(0.25, 0.5),
       Point2.new(0.4, -0.35)
     ], x: -0.5, y: -0.2, color: Color::RED,)",
                 "ConvexPolygon4")
  end

  def test_picture_diff_ConvexPolygon5
    picture_diff("ConvexPolygon.new([Point2.new(0.0, 0.5),
      Point2.new(0.5, 0.0),
      Point2.new(0.0, -0.5),
      Point2.new(-0.6, -0.4),
      Point2.new(-0.7, 0.2),
     ],   )",
                 "ConvexPolygon5")
  end

  def test_picture_diff_ConvexPolygon6
    picture_diff("ConvexPolygon.new([Point2.new(0.0, 0.5),
      Point2.new(0.5, 0.0),
      Point2.new(0.0, -0.5),
      Point2.new(-0.6, -0.4),
      Point2.new(-0.7, 0.2),
     ], x: -0.5,  )",
                 "ConvexPolygon6")
  end

  def test_picture_diff_ConvexPolygon7
    picture_diff("ConvexPolygon.new([Point2.new(0.0, 0.5),
      Point2.new(0.5, 0.0),
      Point2.new(0.0, -0.5),
      Point2.new(-0.6, -0.4),
      Point2.new(-0.7, 0.2),
     ],  y: -0.2, )",
                 "ConvexPolygon7")
  end

  def test_picture_diff_ConvexPolygon8
    picture_diff("ConvexPolygon.new([Point2.new(0.0, 0.5),
      Point2.new(0.5, 0.0),
      Point2.new(0.0, -0.5),
      Point2.new(-0.6, -0.4),
      Point2.new(-0.7, 0.2),
     ],   color: Color::YELLOW,)",
                 "ConvexPolygon8")
  end

  def test_picture_diff_ConvexPolygon9
    picture_diff("ConvexPolygon.new([Point2.new(0.0, 0.5),
      Point2.new(0.5, 0.0),
      Point2.new(0.0, -0.5),
      Point2.new(-0.6, -0.4),
      Point2.new(-0.7, 0.2),
     ], x: -0.5, y: -0.2, color: Color::RED,)",
                 "ConvexPolygon9")
  end

  def test_picture_diff_ConvexPolygon10
    picture_diff("ConvexPolygon.new([Point2.new(0.85, 0.0),
       Point2.new(0.1, 0.25),
       Point2.new(0.0, 0.45),
       Point2.new(0.15, 0.7),
       Point2.new(0.65, 1.0),
       Point2.new(0.95, 0.95),
       Point2.new(1.1, 0.75)
     ],   )",
                 "ConvexPolygon10")
  end

  def test_picture_diff_ConvexPolygon11
    picture_diff("ConvexPolygon.new([Point2.new(0.85, 0.0),
       Point2.new(0.1, 0.25),
       Point2.new(0.0, 0.45),
       Point2.new(0.15, 0.7),
       Point2.new(0.65, 1.0),
       Point2.new(0.95, 0.95),
       Point2.new(1.1, 0.75)
     ], x: -0.5,  )",
                 "ConvexPolygon11")
  end

  def test_picture_diff_ConvexPolygon12
    picture_diff("ConvexPolygon.new([Point2.new(0.85, 0.0),
       Point2.new(0.1, 0.25),
       Point2.new(0.0, 0.45),
       Point2.new(0.15, 0.7),
       Point2.new(0.65, 1.0),
       Point2.new(0.95, 0.95),
       Point2.new(1.1, 0.75)
     ],  y: -0.2, )",
                 "ConvexPolygon12")
  end

  def test_picture_diff_ConvexPolygon13
    picture_diff("ConvexPolygon.new([Point2.new(0.85, 0.0),
       Point2.new(0.1, 0.25),
       Point2.new(0.0, 0.45),
       Point2.new(0.15, 0.7),
       Point2.new(0.65, 1.0),
       Point2.new(0.95, 0.95),
       Point2.new(1.1, 0.75)
     ],   color: Color::YELLOW,)",
                 "ConvexPolygon13")
  end

  def test_picture_diff_ConvexPolygon14
    picture_diff("ConvexPolygon.new([Point2.new(0.85, 0.0),
       Point2.new(0.1, 0.25),
       Point2.new(0.0, 0.45),
       Point2.new(0.15, 0.7),
       Point2.new(0.65, 1.0),
       Point2.new(0.95, 0.95),
       Point2.new(1.1, 0.75)
     ], x: -0.5, y: -0.2, color: Color::RED,)",
                 "ConvexPolygon14")
  end

  def test_picture_diff_Rectangle_move0
    picture_diff("movable = Rectangle.new(0.5, 0.3,  color: Color::YELLOW);;movable",
                 "Rectangle_move0")
  end

  def test_picture_diff_Rectangle_move1
    picture_diff("movable = Rectangle.new(0.5, 0.3,  color: Color::YELLOW);movable.move(:left, 0.5);movable",
                 "Rectangle_move1")
  end

  def test_picture_diff_Rectangle_move2
    picture_diff("movable = Rectangle.new(0.5, 0.3,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "Rectangle_move2")
  end

  def test_picture_diff_Rectangle_move3
    picture_diff("movable = Rectangle.new(0.5, 0.3,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "Rectangle_move3")
  end

  def test_picture_diff_Rectangle_move4
    picture_diff("movable = Rectangle.new(0.5, 0.3,  color: Color::YELLOW);movable.move(:down, 0.5);movable",
                 "Rectangle_move4")
  end

  def test_picture_diff_Rectangle_move5
    picture_diff("movable = Rectangle.new(0.5, 0.3,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "Rectangle_move5")
  end

  def test_picture_diff_Rectangle_move6
    picture_diff("movable = Rectangle.new(0.5, 0.3,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "Rectangle_move6")
  end

  def test_picture_diff_Rectangle_move7
    picture_diff("movable = Rectangle.new(0.5, 0.3,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "Rectangle_move7")
  end

  def test_picture_diff_Rectangle_move8
    picture_diff("movable = Rectangle.new(0.5, 0.3, x:0.4, y:0.5,  color: Color::YELLOW);;movable",
                 "Rectangle_move8")
  end

  def test_picture_diff_Rectangle_move9
    picture_diff("movable = Rectangle.new(0.5, 0.3, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable",
                 "Rectangle_move9")
  end

  def test_picture_diff_Rectangle_move10
    picture_diff("movable = Rectangle.new(0.5, 0.3, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "Rectangle_move10")
  end

  def test_picture_diff_Rectangle_move11
    picture_diff("movable = Rectangle.new(0.5, 0.3, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "Rectangle_move11")
  end

  def test_picture_diff_Rectangle_move12
    picture_diff("movable = Rectangle.new(0.5, 0.3, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable",
                 "Rectangle_move12")
  end

  def test_picture_diff_Rectangle_move13
    picture_diff("movable = Rectangle.new(0.5, 0.3, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "Rectangle_move13")
  end

  def test_picture_diff_Rectangle_move14
    picture_diff("movable = Rectangle.new(0.5, 0.3, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "Rectangle_move14")
  end

  def test_picture_diff_Rectangle_move15
    picture_diff("movable = Rectangle.new(0.5, 0.3, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "Rectangle_move15")
  end

  def test_picture_diff_Ellipse_move0
    picture_diff("movable = Ellipse.new(0.2, 0.4,  color: Color::YELLOW);;movable",
                 "Ellipse_move0")
  end

  def test_picture_diff_Ellipse_move1
    picture_diff("movable = Ellipse.new(0.2, 0.4,  color: Color::YELLOW);movable.move(:left, 0.5);movable",
                 "Ellipse_move1")
  end

  def test_picture_diff_Ellipse_move2
    picture_diff("movable = Ellipse.new(0.2, 0.4,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "Ellipse_move2")
  end

  def test_picture_diff_Ellipse_move3
    picture_diff("movable = Ellipse.new(0.2, 0.4,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "Ellipse_move3")
  end

  def test_picture_diff_Ellipse_move4
    picture_diff("movable = Ellipse.new(0.2, 0.4,  color: Color::YELLOW);movable.move(:down, 0.5);movable",
                 "Ellipse_move4")
  end

  def test_picture_diff_Ellipse_move5
    picture_diff("movable = Ellipse.new(0.2, 0.4,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "Ellipse_move5")
  end

  def test_picture_diff_Ellipse_move6
    picture_diff("movable = Ellipse.new(0.2, 0.4,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "Ellipse_move6")
  end

  def test_picture_diff_Ellipse_move7
    picture_diff("movable = Ellipse.new(0.2, 0.4,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "Ellipse_move7")
  end

  def test_picture_diff_Ellipse_move8
    picture_diff("movable = Ellipse.new(0.2, 0.4, x:0.4, y:0.5,  color: Color::YELLOW);;movable",
                 "Ellipse_move8")
  end

  def test_picture_diff_Ellipse_move9
    picture_diff("movable = Ellipse.new(0.2, 0.4, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable",
                 "Ellipse_move9")
  end

  def test_picture_diff_Ellipse_move10
    picture_diff("movable = Ellipse.new(0.2, 0.4, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "Ellipse_move10")
  end

  def test_picture_diff_Ellipse_move11
    picture_diff("movable = Ellipse.new(0.2, 0.4, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "Ellipse_move11")
  end

  def test_picture_diff_Ellipse_move12
    picture_diff("movable = Ellipse.new(0.2, 0.4, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable",
                 "Ellipse_move12")
  end

  def test_picture_diff_Ellipse_move13
    picture_diff("movable = Ellipse.new(0.2, 0.4, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "Ellipse_move13")
  end

  def test_picture_diff_Ellipse_move14
    picture_diff("movable = Ellipse.new(0.2, 0.4, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "Ellipse_move14")
  end

  def test_picture_diff_Ellipse_move15
    picture_diff("movable = Ellipse.new(0.2, 0.4, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "Ellipse_move15")
  end

  def test_picture_diff_EquilateralTriangle_move0
    picture_diff("movable = EquilateralTriangle.new(0.5,  color: Color::YELLOW);;movable",
                 "EquilateralTriangle_move0")
  end

  def test_picture_diff_EquilateralTriangle_move1
    picture_diff("movable = EquilateralTriangle.new(0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable",
                 "EquilateralTriangle_move1")
  end

  def test_picture_diff_EquilateralTriangle_move2
    picture_diff("movable = EquilateralTriangle.new(0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "EquilateralTriangle_move2")
  end

  def test_picture_diff_EquilateralTriangle_move3
    picture_diff("movable = EquilateralTriangle.new(0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "EquilateralTriangle_move3")
  end

  def test_picture_diff_EquilateralTriangle_move4
    picture_diff("movable = EquilateralTriangle.new(0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable",
                 "EquilateralTriangle_move4")
  end

  def test_picture_diff_EquilateralTriangle_move5
    picture_diff("movable = EquilateralTriangle.new(0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "EquilateralTriangle_move5")
  end

  def test_picture_diff_EquilateralTriangle_move6
    picture_diff("movable = EquilateralTriangle.new(0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "EquilateralTriangle_move6")
  end

  def test_picture_diff_EquilateralTriangle_move7
    picture_diff("movable = EquilateralTriangle.new(0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "EquilateralTriangle_move7")
  end

  def test_picture_diff_EquilateralTriangle_move8
    picture_diff("movable = EquilateralTriangle.new(0.5, x:0.4, y:0.5,  color: Color::YELLOW);;movable",
                 "EquilateralTriangle_move8")
  end

  def test_picture_diff_EquilateralTriangle_move9
    picture_diff("movable = EquilateralTriangle.new(0.5, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable",
                 "EquilateralTriangle_move9")
  end

  def test_picture_diff_EquilateralTriangle_move10
    picture_diff("movable = EquilateralTriangle.new(0.5, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "EquilateralTriangle_move10")
  end

  def test_picture_diff_EquilateralTriangle_move11
    picture_diff("movable = EquilateralTriangle.new(0.5, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "EquilateralTriangle_move11")
  end

  def test_picture_diff_EquilateralTriangle_move12
    picture_diff("movable = EquilateralTriangle.new(0.5, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable",
                 "EquilateralTriangle_move12")
  end

  def test_picture_diff_EquilateralTriangle_move13
    picture_diff("movable = EquilateralTriangle.new(0.5, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "EquilateralTriangle_move13")
  end

  def test_picture_diff_EquilateralTriangle_move14
    picture_diff("movable = EquilateralTriangle.new(0.5, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "EquilateralTriangle_move14")
  end

  def test_picture_diff_EquilateralTriangle_move15
    picture_diff("movable = EquilateralTriangle.new(0.5, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "EquilateralTriangle_move15")
  end

  def test_picture_diff_CircularSegment_move0
    picture_diff("movable = CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI,  color: Color::YELLOW);;movable",
                 "CircularSegment_move0")
  end

  def test_picture_diff_CircularSegment_move1
    picture_diff("movable = CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI,  color: Color::YELLOW);movable.move(:left, 0.5);movable",
                 "CircularSegment_move1")
  end

  def test_picture_diff_CircularSegment_move2
    picture_diff("movable = CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "CircularSegment_move2")
  end

  def test_picture_diff_CircularSegment_move3
    picture_diff("movable = CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "CircularSegment_move3")
  end

  def test_picture_diff_CircularSegment_move4
    picture_diff("movable = CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI,  color: Color::YELLOW);movable.move(:down, 0.5);movable",
                 "CircularSegment_move4")
  end

  def test_picture_diff_CircularSegment_move5
    picture_diff("movable = CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "CircularSegment_move5")
  end

  def test_picture_diff_CircularSegment_move6
    picture_diff("movable = CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "CircularSegment_move6")
  end

  def test_picture_diff_CircularSegment_move7
    picture_diff("movable = CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "CircularSegment_move7")
  end

  def test_picture_diff_CircularSegment_move8
    picture_diff("movable = CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI, x:0.4, y:0.5,  color: Color::YELLOW);;movable",
                 "CircularSegment_move8")
  end

  def test_picture_diff_CircularSegment_move9
    picture_diff("movable = CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable",
                 "CircularSegment_move9")
  end

  def test_picture_diff_CircularSegment_move10
    picture_diff("movable = CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "CircularSegment_move10")
  end

  def test_picture_diff_CircularSegment_move11
    picture_diff("movable = CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "CircularSegment_move11")
  end

  def test_picture_diff_CircularSegment_move12
    picture_diff("movable = CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable",
                 "CircularSegment_move12")
  end

  def test_picture_diff_CircularSegment_move13
    picture_diff("movable = CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "CircularSegment_move13")
  end

  def test_picture_diff_CircularSegment_move14
    picture_diff("movable = CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "CircularSegment_move14")
  end

  def test_picture_diff_CircularSegment_move15
    picture_diff("movable = CircularSegment.new(0.6, 0.8, Math::PI * 0.3, Math::PI, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "CircularSegment_move15")
  end

  def test_picture_diff_BezierCurve_move0
    picture_diff("movable = BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)],  color: Color::YELLOW);;movable",
                 "BezierCurve_move0")
  end

  def test_picture_diff_BezierCurve_move1
    picture_diff("movable = BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)],  color: Color::YELLOW);movable.move(:left, 0.5);movable",
                 "BezierCurve_move1")
  end

  def test_picture_diff_BezierCurve_move2
    picture_diff("movable = BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)],  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "BezierCurve_move2")
  end

  def test_picture_diff_BezierCurve_move3
    picture_diff("movable = BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)],  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "BezierCurve_move3")
  end

  def test_picture_diff_BezierCurve_move4
    picture_diff("movable = BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)],  color: Color::YELLOW);movable.move(:down, 0.5);movable",
                 "BezierCurve_move4")
  end

  def test_picture_diff_BezierCurve_move5
    picture_diff("movable = BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)],  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "BezierCurve_move5")
  end

  def test_picture_diff_BezierCurve_move6
    picture_diff("movable = BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)],  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "BezierCurve_move6")
  end

  def test_picture_diff_BezierCurve_move7
    picture_diff("movable = BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)],  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "BezierCurve_move7")
  end

  def test_picture_diff_BezierCurve_move8
    picture_diff("movable = BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)], x:0.4, y:0.5,  color: Color::YELLOW);;movable",
                 "BezierCurve_move8")
  end

  def test_picture_diff_BezierCurve_move9
    picture_diff("movable = BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)], x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable",
                 "BezierCurve_move9")
  end

  def test_picture_diff_BezierCurve_move10
    picture_diff("movable = BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)], x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "BezierCurve_move10")
  end

  def test_picture_diff_BezierCurve_move11
    picture_diff("movable = BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)], x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "BezierCurve_move11")
  end

  def test_picture_diff_BezierCurve_move12
    picture_diff("movable = BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)], x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable",
                 "BezierCurve_move12")
  end

  def test_picture_diff_BezierCurve_move13
    picture_diff("movable = BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)], x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "BezierCurve_move13")
  end

  def test_picture_diff_BezierCurve_move14
    picture_diff("movable = BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)], x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "BezierCurve_move14")
  end

  def test_picture_diff_BezierCurve_move15
    picture_diff("movable = BezierCurve.new([Point2.new(-0.5, -0.5), Point2.new(0.0, +0.5), Point2.new(0.5, -0.5)], x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "BezierCurve_move15")
  end

  def test_picture_diff_Text_move0
    picture_diff("movable = Text.new(\"Hello\", Font::TIMES_ROMAN_24,  color: Color::YELLOW);;movable",
                 "Text_move0")
  end

  def test_picture_diff_Text_move1
    picture_diff("movable = Text.new(\"Hello\", Font::TIMES_ROMAN_24,  color: Color::YELLOW);movable.move(:left, 0.5);movable",
                 "Text_move1")
  end

  def test_picture_diff_Text_move2
    picture_diff("movable = Text.new(\"Hello\", Font::TIMES_ROMAN_24,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "Text_move2")
  end

  def test_picture_diff_Text_move3
    picture_diff("movable = Text.new(\"Hello\", Font::TIMES_ROMAN_24,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "Text_move3")
  end

  def test_picture_diff_Text_move4
    picture_diff("movable = Text.new(\"Hello\", Font::TIMES_ROMAN_24,  color: Color::YELLOW);movable.move(:down, 0.5);movable",
                 "Text_move4")
  end

  def test_picture_diff_Text_move5
    picture_diff("movable = Text.new(\"Hello\", Font::TIMES_ROMAN_24,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "Text_move5")
  end

  def test_picture_diff_Text_move6
    picture_diff("movable = Text.new(\"Hello\", Font::TIMES_ROMAN_24,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "Text_move6")
  end

  def test_picture_diff_Text_move7
    picture_diff("movable = Text.new(\"Hello\", Font::TIMES_ROMAN_24,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "Text_move7")
  end

  def test_picture_diff_Text_move8
    picture_diff("movable = Text.new(\"Hello\", Font::TIMES_ROMAN_24, x:0.4, y:0.5,  color: Color::YELLOW);;movable",
                 "Text_move8")
  end

  def test_picture_diff_Text_move9
    picture_diff("movable = Text.new(\"Hello\", Font::TIMES_ROMAN_24, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable",
                 "Text_move9")
  end

  def test_picture_diff_Text_move10
    picture_diff("movable = Text.new(\"Hello\", Font::TIMES_ROMAN_24, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "Text_move10")
  end

  def test_picture_diff_Text_move11
    picture_diff("movable = Text.new(\"Hello\", Font::TIMES_ROMAN_24, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "Text_move11")
  end

  def test_picture_diff_Text_move12
    picture_diff("movable = Text.new(\"Hello\", Font::TIMES_ROMAN_24, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable",
                 "Text_move12")
  end

  def test_picture_diff_Text_move13
    picture_diff("movable = Text.new(\"Hello\", Font::TIMES_ROMAN_24, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "Text_move13")
  end

  def test_picture_diff_Text_move14
    picture_diff("movable = Text.new(\"Hello\", Font::TIMES_ROMAN_24, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "Text_move14")
  end

  def test_picture_diff_Text_move15
    picture_diff("movable = Text.new(\"Hello\", Font::TIMES_ROMAN_24, x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "Text_move15")
  end

  def test_picture_diff_ConvexPolygon_move0
    picture_diff("movable = ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)],  color: Color::YELLOW);;movable",
                 "ConvexPolygon_move0")
  end

  def test_picture_diff_ConvexPolygon_move1
    picture_diff("movable = ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)],  color: Color::YELLOW);movable.move(:left, 0.5);movable",
                 "ConvexPolygon_move1")
  end

  def test_picture_diff_ConvexPolygon_move2
    picture_diff("movable = ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)],  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "ConvexPolygon_move2")
  end

  def test_picture_diff_ConvexPolygon_move3
    picture_diff("movable = ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)],  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "ConvexPolygon_move3")
  end

  def test_picture_diff_ConvexPolygon_move4
    picture_diff("movable = ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)],  color: Color::YELLOW);movable.move(:down, 0.5);movable",
                 "ConvexPolygon_move4")
  end

  def test_picture_diff_ConvexPolygon_move5
    picture_diff("movable = ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)],  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "ConvexPolygon_move5")
  end

  def test_picture_diff_ConvexPolygon_move6
    picture_diff("movable = ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)],  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "ConvexPolygon_move6")
  end

  def test_picture_diff_ConvexPolygon_move7
    picture_diff("movable = ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)],  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "ConvexPolygon_move7")
  end

  def test_picture_diff_ConvexPolygon_move8
    picture_diff("movable = ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)], x:0.4, y:0.5,  color: Color::YELLOW);;movable",
                 "ConvexPolygon_move8")
  end

  def test_picture_diff_ConvexPolygon_move9
    picture_diff("movable = ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)], x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable",
                 "ConvexPolygon_move9")
  end

  def test_picture_diff_ConvexPolygon_move10
    picture_diff("movable = ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)], x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "ConvexPolygon_move10")
  end

  def test_picture_diff_ConvexPolygon_move11
    picture_diff("movable = ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)], x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "ConvexPolygon_move11")
  end

  def test_picture_diff_ConvexPolygon_move12
    picture_diff("movable = ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)], x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable",
                 "ConvexPolygon_move12")
  end

  def test_picture_diff_ConvexPolygon_move13
    picture_diff("movable = ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)], x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "ConvexPolygon_move13")
  end

  def test_picture_diff_ConvexPolygon_move14
    picture_diff("movable = ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)], x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "ConvexPolygon_move14")
  end

  def test_picture_diff_ConvexPolygon_move15
    picture_diff("movable = ConvexPolygon.new([Point2.new(-0.5, -0.5),Point2.new(-0.25, 0.25),Point2.new(0.25, 0.5),Point2.new(0.4, -0.35)], x:0.4, y:0.5,  color: Color::YELLOW);movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "ConvexPolygon_move15")
  end

  def test_picture_diff_Image_move0
    picture_diff("movable = Image.new(DownloadUtils.download_if_necessary(\"https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png\"), );;movable",
                 "Image_move0")
  end

  def test_picture_diff_Image_move1
    picture_diff("movable = Image.new(DownloadUtils.download_if_necessary(\"https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png\"), );movable.move(:left, 0.5);movable",
                 "Image_move1")
  end

  def test_picture_diff_Image_move2
    picture_diff("movable = Image.new(DownloadUtils.download_if_necessary(\"https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png\"), );movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "Image_move2")
  end

  def test_picture_diff_Image_move3
    picture_diff("movable = Image.new(DownloadUtils.download_if_necessary(\"https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png\"), );movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "Image_move3")
  end

  def test_picture_diff_Image_move4
    picture_diff("movable = Image.new(DownloadUtils.download_if_necessary(\"https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png\"), );movable.move(:down, 0.5);movable",
                 "Image_move4")
  end

  def test_picture_diff_Image_move5
    picture_diff("movable = Image.new(DownloadUtils.download_if_necessary(\"https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png\"), );movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "Image_move5")
  end

  def test_picture_diff_Image_move6
    picture_diff("movable = Image.new(DownloadUtils.download_if_necessary(\"https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png\"), );movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "Image_move6")
  end

  def test_picture_diff_Image_move7
    picture_diff("movable = Image.new(DownloadUtils.download_if_necessary(\"https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png\"), );movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "Image_move7")
  end

  def test_picture_diff_Image_move8
    picture_diff("movable = Image.new(DownloadUtils.download_if_necessary(\"https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png\"), x:0.4, y:0.5, );;movable",
                 "Image_move8")
  end

  def test_picture_diff_Image_move9
    picture_diff("movable = Image.new(DownloadUtils.download_if_necessary(\"https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png\"), x:0.4, y:0.5, );movable.move(:left, 0.5);movable",
                 "Image_move9")
  end

  def test_picture_diff_Image_move10
    picture_diff("movable = Image.new(DownloadUtils.download_if_necessary(\"https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png\"), x:0.4, y:0.5, );movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "Image_move10")
  end

  def test_picture_diff_Image_move11
    picture_diff("movable = Image.new(DownloadUtils.download_if_necessary(\"https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png\"), x:0.4, y:0.5, );movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "Image_move11")
  end

  def test_picture_diff_Image_move12
    picture_diff("movable = Image.new(DownloadUtils.download_if_necessary(\"https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png\"), x:0.4, y:0.5, );movable.move(:down, 0.5);movable",
                 "Image_move12")
  end

  def test_picture_diff_Image_move13
    picture_diff("movable = Image.new(DownloadUtils.download_if_necessary(\"https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png\"), x:0.4, y:0.5, );movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "Image_move13")
  end

  def test_picture_diff_Image_move14
    picture_diff("movable = Image.new(DownloadUtils.download_if_necessary(\"https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png\"), x:0.4, y:0.5, );movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "Image_move14")
  end

  def test_picture_diff_Image_move15
    picture_diff("movable = Image.new(DownloadUtils.download_if_necessary(\"https://www.cse.wustl.edu/~cosgroved/courses/cse425s/timeless/ruby/ruby/resources/dan128.png\"), x:0.4, y:0.5, );movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "Image_move15")
  end

  def test_picture_diff_CompositeTransform_move0
    picture_diff("movable = CompositeTransform.new();movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));;movable",
                 "CompositeTransform_move0")
  end

  def test_picture_diff_CompositeTransform_move1
    picture_diff("movable = CompositeTransform.new();movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));movable.move(:left, 0.5);movable",
                 "CompositeTransform_move1")
  end

  def test_picture_diff_CompositeTransform_move2
    picture_diff("movable = CompositeTransform.new();movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "CompositeTransform_move2")
  end

  def test_picture_diff_CompositeTransform_move3
    picture_diff("movable = CompositeTransform.new();movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "CompositeTransform_move3")
  end

  def test_picture_diff_CompositeTransform_move4
    picture_diff("movable = CompositeTransform.new();movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));movable.move(:down, 0.5);movable",
                 "CompositeTransform_move4")
  end

  def test_picture_diff_CompositeTransform_move5
    picture_diff("movable = CompositeTransform.new();movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "CompositeTransform_move5")
  end

  def test_picture_diff_CompositeTransform_move6
    picture_diff("movable = CompositeTransform.new();movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "CompositeTransform_move6")
  end

  def test_picture_diff_CompositeTransform_move7
    picture_diff("movable = CompositeTransform.new();movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "CompositeTransform_move7")
  end

  def test_picture_diff_CompositeTransform_move8
    picture_diff("movable = CompositeTransform.new(x:0.4, y:0.5, );movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));;movable",
                 "CompositeTransform_move8")
  end

  def test_picture_diff_CompositeTransform_move9
    picture_diff("movable = CompositeTransform.new(x:0.4, y:0.5, );movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));movable.move(:left, 0.5);movable",
                 "CompositeTransform_move9")
  end

  def test_picture_diff_CompositeTransform_move10
    picture_diff("movable = CompositeTransform.new(x:0.4, y:0.5, );movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));movable.move(:left, 0.5);movable.move(:right, 0.3);movable",
                 "CompositeTransform_move10")
  end

  def test_picture_diff_CompositeTransform_move11
    picture_diff("movable = CompositeTransform.new(x:0.4, y:0.5, );movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable",
                 "CompositeTransform_move11")
  end

  def test_picture_diff_CompositeTransform_move12
    picture_diff("movable = CompositeTransform.new(x:0.4, y:0.5, );movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));movable.move(:down, 0.5);movable",
                 "CompositeTransform_move12")
  end

  def test_picture_diff_CompositeTransform_move13
    picture_diff("movable = CompositeTransform.new(x:0.4, y:0.5, );movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));movable.move(:down, 0.5);movable.move(:up, 0.3);movable",
                 "CompositeTransform_move13")
  end

  def test_picture_diff_CompositeTransform_move14
    picture_diff("movable = CompositeTransform.new(x:0.4, y:0.5, );movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "CompositeTransform_move14")
  end

  def test_picture_diff_CompositeTransform_move15
    picture_diff("movable = CompositeTransform.new(x:0.4, y:0.5, );movable.push_component(Ellipse.new(0.5, 0.25, x: -0.5, y:-0.2, color: Color::RED));movable.push_component(EquilateralTriangle.new(0.4, x: 0.4, y: 0.6, color: Color::BLUE));movable.move(:left, 0.5);movable.move(:right, 0.3);movable.move(:left, 0.1);movable.move(:down, 0.5);movable.move(:up, 0.3);movable.move(:down, 0.1);movable",
                 "CompositeTransform_move15")
  end

  # generated end

  def self.startup
    @@pictures, @@exceptions = ImageDiffUnitTestSetup.setup_pictures_and_exceptions(PartCInfo.new, is_complete: true)
  end

  private

  include ImageDiffUnitTestMixin

  def expected_sub_path
    'part_c'
  end

  def setup_exception_hash
    @@exceptions
  end

  def setup_picture_hash
    @@pictures
  end
end