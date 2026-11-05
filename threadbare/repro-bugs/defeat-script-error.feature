Feature: Defeat

  Scenario: Being caught by the Void logs no errors
    Given the player is in scene "tutorial_void_runner"
    And the player is at 735, 1121, 0
    When the player dismisses the dialogue
    Then the event "player_defeated" should occur within 40 seconds
    And the event "scene_changed" should occur within 40 seconds
    And no script errors should be logged
