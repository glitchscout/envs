Feature: Options

  Scenario: The options menu opens from the main menu
    When the player waits 1 second
    And the player taps "dialogue_next"
    And the player waits 3 seconds
    And the player chooses "menu_options"
    And the player waits 1 second
    Then no script errors should be logged
