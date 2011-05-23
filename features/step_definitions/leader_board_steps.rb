Then /^I should see the leader board$/ do
  Then %{I should see "Email"}
  And %{I should see "Wins"}
  And %{I should see "Loses"}
  And %{I should see "ANG"}
end

Given /^the following users are in the database:$/ do |table|
  table.hashes.each do |data|
    data[:password] = 'Pa55W0rd'
    data[:password_confirmation] = 'Pa55W0rd'
    data[:games_count] = data[:games_won] + data[:games_lost]
    User.create! data
  end
end
