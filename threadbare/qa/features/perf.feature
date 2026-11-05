Feature: Performance

  Scenario: The first village stays responsive
    Given the player is in scene "tutorial_ruined_village"
    When the player waits 6 seconds
    Then the event "too_many_nodes" should not occur
    And no script errors should be logged
