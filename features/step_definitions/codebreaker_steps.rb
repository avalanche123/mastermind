Given /^the secret code is "([^"]*)"$/ do |code|
  @codebreaker = Codebreaker.new(code)
end

When /^I guess "([^"]*)"$/ do |guess|
  @matches = @codebreaker.guess guess
end

Then /^the number of matches should be "([^"]*)"$/ do |matches|
  @matches.should eq(matches.to_i)
end

