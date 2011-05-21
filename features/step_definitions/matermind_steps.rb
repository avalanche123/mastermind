Given /^I am not logged in$/ do
  visit('/users/sign_out')
end

Then /^I should be logged in$/ do
  pending
end
