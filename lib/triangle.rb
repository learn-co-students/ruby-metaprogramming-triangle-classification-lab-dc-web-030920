class Triangle

  attr_reader :left, :right, :top

  def initialize(left, right, top)
    @left = left
    @right = right
    @top = top
  end

  def kind
    validate_triangle
    if left == right && right == top
      :equilateral
    elsif left == right || right == top || left == top
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    real_triangle = [(left + right > top), (left + top > right), (right + top > left)]
    [left, right, top].each do |side|
      real_triangle << false if side <= 0 
    raise TriangleError if real_triangle.include?(false)
    end
  end

  class TriangleError < StandardError
  end

end
