Feature: codebreaker

  The code breaker is initialized with a code and gets submitted a guess

  Each number in the guess that matches the number and position of a number
  in the secret code is considered a match

  Result of a guess is a count of matches

  Scenario Outline: submit guess
    Given the secret code is "<code>"
    When I guess "<guess>"
    Then the number of matches should be "<matches>"

  Scenarios: games
    | code | guess | matches |
    | 1010 | 0000  | 2       |
    | 1010 | 0110  | 2       |
    | 1010 | 1110  | 3       |
    | 1010 | 0111  | 1       |
    | 1010 | 1010  | 4       |
