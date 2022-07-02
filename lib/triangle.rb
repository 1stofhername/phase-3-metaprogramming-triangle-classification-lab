class Triangle
  attr_accessor :side1, :side2, :side3, :sides

  def initialize (side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    validate([side1, side2, side3])
  end

  def kind
    if self.side1 == self.side2 && self.side1 == self.side3
      :equilateral
    elsif self.side1 == self.side2 || self.side1 == self.side3 || self.side2 == self.side3
      :isosceles
    elsif self.side1 != self.side2 || self.side1 != self.side3 || self.side2 != self.side3
      :scalene
    elsif self.side1 == 0 && self.side2 == 0 && self.side3 == 0
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end

  

  private

  def validate array
    if array.include?(0)
      raise TriangleError
    elsif array.all?(&:positive?) == false
      raise TriangleError
    elsif array[0] + array[1] <= array[2] || array[0] + array[2] <= array[1] || array[1] + array[2] <= array[0]
      raise TriangleError
    end
  end

end


