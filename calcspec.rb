# call with rspec calcspec.rb --format documentation

require "./calculator"

RSpec.describe Calculator do
  it "should display zero at begin" do
    expect(subject.number).to be(0)
  end

  it "should display zero when multile zeros are entered" do
    subject.enternum("0")
    subject.enternum("0")
    subject.enternum("0")
    expect(subject.number).to be(0)
  end

  it "should display a number which was entered" do
    subject.enternum("1")
    subject.enternum("2")
    subject.enternum("3")
    expect(subject.number).to be(123)
  end

  it "should not display leading zeros" do
    subject.enternum("0")
    subject.enternum("0")
    subject.enternum("1")
    subject.enternum("2")
    subject.enternum("3")
    expect(subject.number).to be(123)
  end

  it "should display zero again, after pressing +" do
    subject.enternum("1")
    subject.enternum("2")
    subject.enternum("3")
    subject.enterop("+")
    expect(subject.number).to be(123)
  end

  it "should still display the last number after pressing -" do
    subject.enternum("1")
    subject.enternum("2")
    subject.enternum("3")
    subject.enterop("-")
    expect(subject.number).to be(123)
  end

  it "should allow new number entry after operator symbol" do
    subject.enternum("1")
    subject.enternum("2")
    subject.enternum("3")
    subject.enterop("-")
    subject.enternum("1")
    expect(subject.number).to be(1)
  end

  it "should allow new number entry after operator symbol" do
    subject.enternum("1")
    subject.enternum("2")
    subject.enternum("3")
    subject.enterop("+")
    subject.enternum("1")
    expect(subject.number).to be(1)
  end

  it "should calculate addition" do
    subject.enternum("1")
    subject.enterop("+")
    subject.enternum("2")
    subject.result
    expect(subject.number).to be(3)
  end

  it "should calculate subtraction" do
    subject.enternum("3")
    subject.enterop("-")
    subject.enternum("1")
    subject.result
    expect(subject.number).to be(2)
  end

  it "should calculate 5-2+3" do
    subject.enternum("5")
    subject.enterop("-")
    subject.enternum("2")
    subject.enterop("+")
    subject.enternum("3")
    subject.result
    expect(subject.number).to be(6)
  end

  it "should not change the result after pressing = multiple times" do
    subject.enternum("5")
    subject.enterop("-")
    subject.enternum("2")
    subject.result
    subject.result
    subject.result
    expect(subject.number).to be(3)
  end
end

