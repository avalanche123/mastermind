Feature: game

  As a user
  I want to play the game
  So that I could win and become a leader

  @wip
  Scenario: user starts a game
    Given I am logged in as "user@example.com"
    When I press "Start a new game"
    Then I should see "Enter your guess:"