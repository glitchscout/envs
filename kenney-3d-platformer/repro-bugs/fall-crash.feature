Feature: Falling

  Scenario: Falling off the level puts the player back
    Given the player is at 40, 2, 40
    Then the event "player_fell" should occur within 5 seconds
