Feature: registration

  As a user
  I want to register
  So that I can track my game stats

  Scenario: user sees a registration form
    Given I am not logged in
    When I go to registration page
    Then I should see "Registration"
    And I should see "Username:"
    And I should see "Password:"
