
require 'io/console'
require './calculator.rb'


class CalcUI
  def initialize(calc)
    @calc = calc
  end

  def run
    begin
      Kernel.system "clear"
      puts @calc.number
      input = STDIN.getch

      case input
      when "0".."9"
        @calc.enternum(input)
      when "+", "-", "*", "/"
        @calc.enterop(input)
      when "="
        @calc.result
      end
    end until input == 'x'
  end
end

if __FILE__ == $0
  calc = Calculator.new
  ui = CalcUI.new(calc)
  ui.run
end