Feature: Double jump

  Scenario: A double jump goes higher than a single jump
    When the player taps "jump"
    And the player waits 0.3 seconds
    And the player taps "jump"
    Then the player should rise above 1.6 within 2 seconds
