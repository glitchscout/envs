Feature: Ink combat

  Scenario: The ink combat tutorial starts cleanly
    Given the player is in scene "tutorial_ink_combat"
    When the player waits 2 seconds
    Then no script errors should be logged
