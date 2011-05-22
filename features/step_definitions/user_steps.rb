Given /^I am not logged in$/ do
  visit('/users/sign_out')
end

Then /^I should be logged in$/ do
  pending
end

Given /^there is a user with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  User.new(:email => email,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am logged in as "([^"]*)"$/ do |email|
  password = 'Pa55W0rd'

  Given %{there is a user with email "#{email}" and password "#{password}"}
  And %{I go to the log in page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

Given /^the following users are in the database:$/ do |table|
  table.hashes.each do |data|
    data[:password] = 'Pa55W0rd'
    data[:password_confirmation] = 'Pa55W0rd'
    User.create! data
  end
end
