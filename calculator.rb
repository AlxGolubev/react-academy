class Calculator
  attr_reader :last_result
  def initialize(left, right)
    @left = left
    @right = right
    @last_result = 0
  end

  def sum
    @last_result = @left + @right
  end

  def minus
    @last_result = @left - @right
  end

  def divide
    @last_result = @left / @right
  end

  def multuply
    @last_result = @left * @right
  end

  def power
    @last_result = @left ** @right
  end
end
