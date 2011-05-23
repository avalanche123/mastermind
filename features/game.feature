Feature: game

  As a user
  I want to play the game
  So that I could win and become a leader

  Scenario: user starts a game
    Given I am logged in as "user@example.com"
    When I am on the game page
    Then I should see "Enter your guess:"

  Scenario: user submits an incorrect guess
    Given I am logged in as "user@example.com"
    And I am on the game page
    And current code is "0-1-1-0"
    When I submit code "0-0-0-0"
    Then I should see "You guessed 2 pegs"
    And I should see "Enter your guess:"

  Scenario: user submits an correct guess
    Given I am logged in as "user@example.com"
    And I am on the game page
    And current code is "0-1-1-0"
    When I submit code "0-1-1-0"
    Then I should see "Congratulations, you won!"
    And I should see "Play again?"

  Scenario: user loses a game
    Given I am logged in as "user@example.com"
    And I am on the game page
    And current code is "0-1-1-0"
    When I submit code "0-0-0-0" 8 times
    Then I should see "You lost, the code was 0110"
    And I should see "Play again?"
