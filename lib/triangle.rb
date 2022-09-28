class Triangle
  attr_reader :s1, :s2, :s3

  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
  end

  def kind
    triangle_error
    if s1 == s2 && s2 == s3
      :equilateral
    elsif s1 == s2 || s2 == s3 || s1 == s3
      :isosceles
    else
      :scalene
    end
  end

  def sides_size_positive
    [s1, s2, s3].all?(&:positive?)
  end

  def triangle_inequality
    s1 + s2 > s3 && s1 + s3 > s2 && s2 + s3 > s1
  end

  def triangle_error
    raise TriangleError unless sides_size_positive && triangle_inequality
  end

  class TriangleError < StandardError
  end

end
