Feature: Main menu

  Scenario: The main menu stays on screen
    When the player waits 1 second
    And the player taps "dialogue_next"
    And the player waits 6 seconds
    Then no script errors should be logged
