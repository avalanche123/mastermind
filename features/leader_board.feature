Feature: leader board

  As a user
  I want to see the leader board
  So I know my skill level

  Scenario: user sees a leader board
    Given the following users are in the database:
      | email              | games_won | games_lost | guesses_count |
      | user1@example.com  | 10        | 5          | 90            |
      | user2@example.com  | 20        | 8          | 148           |
      | user3@example.com  | 50        | 19         | 402           |
      | user4@example.com  | 15        | 3          | 99            |
      | user5@example.com  | 8         | 5          | 80            |
      | user6@example.com  | 2         | 29         | 242           |
      | user7@example.com  | 19        | 12         | 191           |
      | user8@example.com  | 13        | 3          | 89            |
      | user9@example.com  | 16        | 8          | 128           |
      | user10@example.com | 15        | 9          | 147           |
      | user11@example.com | 45        | 23         | 409           |
      | user12@example.com | 24        | 45         | 480           |
      | user13@example.com | 9         | 64         | 557           |
      | user14@example.com | 16        | 34         | 352           |
      | user15@example.com | 3         | 12         | 111           |
    And I am on the leader board page
    Then I should see the leader board
    And I should see the following table rows:
      | user3@example.com  | 50 | 19 | 5.83 |
      | user11@example.com | 45 | 23 | 6.0  |
      | user12@example.com | 24 | 45 | 6.96 |
      | user2@example.com  | 20 | 8  | 5.29 |
      | user7@example.com  | 19 | 12 | 6.16 |
      | user9@example.com  | 16 | 8  | 5.33 |
      | user14@example.com | 16 | 34 | 7.04 |
      | user4@example.com  | 15 | 3  | 5.5  |
      | user10@example.com | 15 | 9  | 6.13 |
      | user8@example.com  | 13 | 3  | 5.56 |
