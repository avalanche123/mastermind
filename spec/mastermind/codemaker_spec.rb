describe Codemaker do
  let(:length) { rand(10) }
  let(:max) { rand(10) }
  let(:codemaker) { Codemaker.new(length, max) }

  it "makes code of a pre-defind length" do
    codemaker.make.size.should eq(length)
  end

  it "makes code with each number less than the max" do
    codemaker.make.all? {|number| number < max }.should be_true
  end
end