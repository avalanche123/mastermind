Given /^current code is "([^"]*)"$/ do |code|
  game = Game.find_by_finished(false)
  game.code = code.split("-").join
  game.save!
end

When /^I submit code "([^"]*)"( (\d+) times)?$/ do |code, text, times|
  if not times.nil?
    times.to_i.times do
      When %{I submit code "#{code}"}
    end
  else
    code.split("-").each_with_index do |number, n|
      When %{I select "#{number}" from "guess[#{n}]"}
    end
    And %{I press "Guess"}
  end
end

class StubCodemaker
  attr_accessor :make

  def initialize(code)
    @make = code
  end
end
