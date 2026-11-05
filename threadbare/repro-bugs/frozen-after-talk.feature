Feature: After talking

  Scenario: The player can walk away after talking to Arun
    Given the player is in scene "tutorial_ruined_village"
    And the player is at 2490, 164, 0
    When the player dismisses the dialogue
    And the player steps "move_right"
    And the player taps "interact"
    And the player waits 1 second
    And the player dismisses the dialogue
    And the player dismisses the dialogue
    And the player dismisses the dialogue
    And the player walks "move_right"
    Then the player should be in scene "tutorial_stealth" within 35 seconds
