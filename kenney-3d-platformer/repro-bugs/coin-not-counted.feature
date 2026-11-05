Feature: Counting coins

  Scenario: A coin is counted
    Given the player is at -3, 0.5, 0
    Then the event "coin_collected" should occur within 3 seconds
