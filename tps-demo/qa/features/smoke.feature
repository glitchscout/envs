@smoke
Feature: Smoke

  Scenario: The level starts and runs cleanly
    Then the event "level_ready" should occur within 5 seconds
    When the player waits 3 seconds
    Then no script errors should be logged
