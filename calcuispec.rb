require "./calculator"
require "./calcui"

RSpec.describe CalcUI do
  context "with a mock calculator" do
    let(:calcmock) { double('calculator', :number => 0) }
    subject { CalcUI.new(calcmock) }

    it "should display 0 in the beginning and clear the screen" do
      allow(STDIN).to receive(:getch).and_return('x')
      expect(Kernel).to receive(:system)
      expect(subject).to receive(:puts)

      subject.run
    end

    it "should forward numeric key presses to the calculator" do
      allow(STDIN).to receive(:getch).and_return('1', '2', 'x')
      expect(Kernel).to receive(:system).at_least(:once)
      expect(subject).to receive(:puts).exactly(3)
      expect(calcmock).to receive(:enternum).with('1').ordered
      expect(calcmock).to receive(:enternum).with('2').ordered

      subject.run
    end

    it "should forward operators to the calculator" do
      allow(STDIN).to receive(:getch).and_return('+', '-', 'x')
      expect(Kernel).to receive(:system).with('clear').at_least(:once)
      expect(subject).to receive(:puts).exactly(3)
      expect(calcmock).to receive(:enterop).with('+').ordered
      expect(calcmock).to receive(:enterop).with('-').ordered

      subject.run
    end

    it "should forward the = key to the result method" do
      allow(STDIN).to receive(:getch).and_return('=', 'x')
      expect(Kernel).to receive(:system).at_least(:once)
      expect(subject).to receive(:puts).exactly(:twice)
      expect(calcmock).to receive(:result).once

      subject.run
    end
  end

  context "with a real calculator" do
    let(:calculator) { Calculator.new }
    subject { CalcUI.new(calculator) }

    it "should desplay the result of the calculation 1+1" do
      allow(STDIN).to receive(:getch).and_return('1', '+', '1', '=', 'x')
      expect(Kernel).to receive(:system).at_least(:once)

      expect(subject).to receive(:puts).with(0).ordered
      expect(subject).to receive(:puts).with(1).exactly(3).ordered
      expect(subject).to receive(:puts).with(2).ordered

      expect(calculator).to receive(:enternum).with('1').and_call_original
      expect(calculator).to receive(:enterop).with('+').and_call_original
      expect(calculator).to receive(:enternum).with('1').and_call_original
      expect(calculator).to receive(:result).and_return(2).and_call_original

      subject.run
    end
  end
end

