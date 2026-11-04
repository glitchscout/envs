@smoke
Feature: Main menu

  Scenario: Start begins the tutorial
    When the player waits 1 second
    And the player taps "dialogue_next"
    And the player waits 3 seconds
    And the player chooses "menu_start"
    Then the event "quest_changed" should occur within 5 seconds
    And the player should be in scene "tutorial_ruined_village" within 10 seconds
    And no script errors should be logged
