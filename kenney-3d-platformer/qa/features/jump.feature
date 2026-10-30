Feature: Jumping

  Scenario: Jumping twice and landing is clean
    When the player taps "jump"
    And the player waits 0.2 seconds
    And the player taps "jump"
    And the player waits 1.5 seconds
    Then no script errors should be logged
