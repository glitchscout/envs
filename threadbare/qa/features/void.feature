Feature: The Void

  Scenario: The Void catches a player who stands still
    Given the player is in scene "tutorial_void_runner"
    And the player is at 735, 1121, 0
    When the player dismisses the dialogue
    Then the event "player_defeated" should occur within 40 seconds
    And no script errors should be logged
