require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the GamesHelper. For example:
#
# describe GamesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe MastermindHelper do
  include MastermindHelper
  let(:tags) { [] }

  describe '#guess_input_tag' do
    it 'calls #select_tag with a specified name' do
      guess_input_tag 'guess', 1
      tags.first[:name].should eq('guess[0]')
    end

    it 'calls #select_tag n number of times' do
      guess_input_tag 'guess', 2
      tags.size.should eq(2)
    end

    it 'calls #options_for_select with array of numbers up to the given max' do
      guess_input_tag 'guess', 2, 4
      tags.all? { |tag| tag[:option_tags].all? { |option| option < 4 } }
    end

    it 'passes any options to #select_tag' do
      guess_input_tag 'guess', 1, 2, :passed => true
      tags.all? { |tag| tag[:options][:passed].should be_true }
    end
  end

  def select_tag(name, option_tags = nil, options = {})
    tags.push :name => name, :option_tags => option_tags, :options => options
  end

  def options_for_select(options)
    options
  end
end
