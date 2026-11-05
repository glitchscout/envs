Feature: Pickups

  Scenario: Picking up the repel powerup grants the ability
    Given the player is in scene "tutorial_ink_combat"
    And the player is at 130, 295, 0
    When the player dismisses the dialogue
    And the player steps "move_right"
    And the player taps "interact"
    And the player waits 2 seconds
    And the player dismisses the dialogue
    And the player waits 1 second
    Then the event "abilities_changed" should occur within 20 seconds
    And no script errors should be logged
