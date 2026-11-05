Feature: Traversal

  Scenario: A jump clears a height
    When the player taps "jump"
    Then the player should rise above 1.2 within 2 seconds

  Scenario: The player stays on the level
    When the player waits 3 seconds
    Then the event "player_fell" should not occur
