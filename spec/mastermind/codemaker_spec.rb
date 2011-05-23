describe Codemaker do
  let(:length) { [2, rand(10)].max }
  let(:max) { [2, rand(10)].max }
  let(:codemaker) { Codemaker.new(length, max) }

  it "makes code of a pre-defind length" do
    codemaker.make.size.should eq(length)
  end

  it "makes code with each number less than the max" do
    codemaker.make.split('').each {|number| number.to_i.should be < max}
  end
end