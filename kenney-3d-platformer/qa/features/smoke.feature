@smoke
Feature: Smoke

  Scenario: The level starts and runs cleanly
    When the player waits 2 seconds
    Then no script errors should be logged
