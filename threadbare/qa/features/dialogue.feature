Feature: Dialogue

  Scenario: The opening dialogue plays and ends
    When the player waits 1 second
    And the player taps "dialogue_next"
    And the player waits 3 seconds
    And the player chooses "menu_start"
    And the player waits 6 seconds
    And the player taps "dialogue_next"
    And the player waits 1 second
    And the player taps "dialogue_next"
    And the player waits 1 second
    And the player taps "dialogue_next"
    And the player waits 1 second
    And the player taps "dialogue_next"
    Then the event "dialogue_started" should occur within 10 seconds
    And the event "dialogue_ended" should occur within 15 seconds
    And no script errors should be logged
