Feature: registration

  As a user
  I want to register
  So that I can track my game stats

  Scenario: user sees a registration form
    Given I am not logged in
    When I go to the registration page
    Then I should see "Mastermind"
    And I should see "Email"
    And I should see "Password"
    And I should see "Password confirmation"

  Scenario: user submits a registration form
    Given I am not logged in
    And I am on the registration page
    When I fill in the following:
      | Email                 | user@example.com |
      | Password              | Pa55W0rd             |
      | Password confirmation | Pa55W0rd             |
    And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."
