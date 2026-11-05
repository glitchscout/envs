Feature: Talking

  Scenario: Talking to Arun starts the conversation that opens the bridge
    Given the player is in scene "tutorial_ruined_village"
    And the player is at 2490, 164, 0
    When the player dismisses the dialogue
    And the player steps "move_right"
    And the player taps "interact"
    And the player waits 1 second
    And the player dismisses the dialogue
    And the player dismisses the dialogue
    And the player dismisses the dialogue
    And the player waits 3 seconds
    And the player walks "move_right"
    Then the player should be in scene "tutorial_stealth" within 35 seconds
    And no script errors should be logged
