Feature: Pausing

  Scenario: The game can be paused
    Given the player is in scene "tutorial_ruined_village"
    When the player dismisses the dialogue
    And the player taps "pause"
    And the player waits 1 second
    Then no script errors should be logged
