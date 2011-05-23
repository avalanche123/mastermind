Given /^I am not logged in$/ do
  visit('/users/sign_out')
end

Given /^there is a user with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  User.create! :email => email,
               :password => password,
               :password_confirmation => password
end

Given /^I am logged in as "([^"]*)"$/ do |email|
  password = 'Pa55W0rd'

  Given %{there is a user with email "#{email}" and password "#{password}"}
  And %{I go to the log in page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end
