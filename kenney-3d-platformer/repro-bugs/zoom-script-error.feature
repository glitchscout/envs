Feature: Camera

  Scenario: Zooming in logs no errors
    When the player taps "zoom_in"
    And the player waits 1 second
    Then no script errors should be logged
