Feature: Main menu

  Scenario: Start begins the opening quest
    When the player waits 1 second
    And the player taps "dialogue_next"
    And the player waits 3 seconds
    And the player chooses "menu_start"
    Then the event "quest_changed" should occur within 5 seconds
