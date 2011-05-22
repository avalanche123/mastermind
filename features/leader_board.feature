Feature: leader board

  As a user
  I want to see the leader board
  So I know my skill level

  Scenario: user sees a leader board
    Given the following users are in the database:
      | email              | games_won | games_lost | average_guess_count |
      | user1@example.com  | 10        | 5          | 7                   |
      | user2@example.com  | 20        | 8          | 6                   |
      | user3@example.com  | 50        | 19         | 5                   |
      | user4@example.com  | 15        | 3          | 4                   |
      | user5@example.com  | 8         | 5          | 4                   |
      | user6@example.com  | 2         | 29         | 7                   |
      | user7@example.com  | 19        | 12         | 7                   |
      | user8@example.com  | 13        | 3          | 4                   |
      | user9@example.com  | 16        | 8          | 5                   |
      | user10@example.com | 15        | 9          | 7                   |
      | user11@example.com | 45        | 23         | 6                   |
      | user12@example.com | 24        | 45         | 7                   |
      | user13@example.com | 9         | 64         | 7                   |
      | user14@example.com | 16        | 34         | 7                   |
      | user15@example.com | 3         | 12         | 7                   |
    And I am on the leader board page
    Then I should see the leader board
    And I should see the following table rows:
      | user3@example.com  | 50 | 19 | 5.0 |
      | user11@example.com | 45 | 23 | 6.0 |
      | user12@example.com | 24 | 45 | 7.0 |
      | user2@example.com  | 20 | 8  | 6.0 |
      | user7@example.com  | 19 | 12 | 7.0 |
      | user9@example.com  | 16 | 8  | 5.0 |
      | user14@example.com | 16 | 34 | 7.0 |
      | user4@example.com  | 15 | 3  | 4.0 |
      | user10@example.com | 15 | 9  | 7.0 |
      | user8@example.com  | 13 | 3  | 4.0 |
