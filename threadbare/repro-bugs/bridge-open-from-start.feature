Feature: The bridge

  Scenario: The bridge stays blocked until the player has talked to Arun
    Given the player is in scene "tutorial_ruined_village"
    And the player is at 2490, 164, 0
    When the player dismisses the dialogue
    And the player walks "move_right"
    And the player walks "move_right"
    And the player waits 5 seconds
    Then the player should stay in scene "tutorial_ruined_village"
    And no script errors should be logged
