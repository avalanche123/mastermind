Feature: home page

  As a user
  I want the homepage to become my dashboard after I'm logged in
  So that I can view my old games and start a new one

  Scenario: user is not logged in
    Given I am not logged in
    When I go to the home page
    Then I should see "Welcome to Mastermind"
    And I should see "log in"
    And I should see "register"

  Scenario: user is logged in
    Given I am logged in as "user@example.com"
    When I go to the home page
    Then I should see "Logout"
    And I should see "Games"
    And I should see "Start a new game"
