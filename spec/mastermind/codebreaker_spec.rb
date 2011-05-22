require 'spec_helper'

describe Codebreaker do
  let(:code) { [1, 0, 1, 0] }
  let(:codebreaker) { Codebreaker.new(code) }

  it "returns number of correct pegs in a guess" do
    codebreaker.guess([0, 0, 0, 0]).should eq(2)
    codebreaker.guess([0, 1, 1, 0]).should eq(2)
    codebreaker.guess([1, 1, 1, 0]).should eq(3)
    codebreaker.guess([0, 1, 1, 1]).should eq(1)
    codebreaker.guess([1, 0, 1, 0]).should eq(4)
  end
end