Feature: Coins

  Scenario: Touching a coin collects it
    Given the player is at -3, 0.5, 0
    Then the event "coin_collected" should occur within 3 seconds
    And no script errors should be logged
