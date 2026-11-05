Feature: Walking

  Scenario: Walking left logs no errors
    Given the player is in scene "tutorial_ruined_village"
    When the player dismisses the dialogue
    And the player steps "move_left"
    And the player steps "move_right"
    Then no script errors should be logged
