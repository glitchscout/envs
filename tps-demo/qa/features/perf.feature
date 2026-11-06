Feature: Performance

  Scenario: The level stays within its node budget
    When the player waits 10 seconds
    Then the event "too_many_nodes" should not occur
    And no script errors should be logged
