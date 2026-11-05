Feature: Falling platforms

  Scenario: Standing on a falling platform logs no errors
    Given the player is at -9, 1.5, 4
    When the player waits 2 seconds
    Then no script errors should be logged
