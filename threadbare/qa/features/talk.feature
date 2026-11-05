Feature: Talking

  Scenario: Arun can be talked to
    Given the player is in scene "tutorial_ruined_village"
    And the player is at 2490, 164, 0
    When the player dismisses the dialogue
    And the player steps "move_right"
    And the player taps "interact"
    And the player waits 2 seconds
    Then the event "interaction_started" should occur within 15 seconds
    And no script errors should be logged
