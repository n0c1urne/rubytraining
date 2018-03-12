class Calculator
  attr_accessor :number
  attr_accessor :memory
  attr_accessor :operation

  def initialize
    @number = 0
    @memory = 0
    @operation = nil
    @clear_on_input = false
  end

  def enternum(n)
    if @clear_on_input
      @number = n.to_i
      @clear_on_input = false
    else
      @number = 10*@number + n.to_i
    end
  end

  def enterop(op)
    perform_operation
    @operation = op
    @clear_on_input = true
  end

  def result
    perform_operation
    @number = @memory
    @memory = 0
    @operation = nil
  end

  private

  def perform_operation
    case @operation
    when '+'
      @memory = @memory + @number
    when '-'
      @memory = @memory - @number
    when nil
      @memory = @number
    end
  end
end