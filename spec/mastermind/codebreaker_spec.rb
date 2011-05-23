require 'spec_helper'

describe Codebreaker do
  code ||= '1010'

  let(:codebreaker) { Codebreaker.new(code) }

  it "returns number of correct pegs in a guess" do
    codebreaker.guess('0000').should eq(2)
    codebreaker.guess('0110').should eq(2)
    codebreaker.guess('1110').should eq(3)
    codebreaker.guess('0111').should eq(1)
    codebreaker.guess('1010').should eq(4)
  end
end