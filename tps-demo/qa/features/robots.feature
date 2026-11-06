Feature: Robots

  # Robot 1 stands at 71.6, 46.3 and notices a player within 20 m.
  Scenario: A robot starts after a player who comes close
    Given the player is at 69.5, -5, 58
    Then "robot_1" should be "approach" within 5 seconds
    And no script errors should be logged

  # Upstream's laser doesn't hurt the player yet, so the robot's shot is the end of the chain: notice, turn to face,
  # see the player, aim, shoot.
  Scenario: A robot that sees the player shoots at them
    Given the player is at 69.5, -5, 58
    When the player waits 20 seconds
    Then "robot_1" should be "shooting"
    And no script errors should be logged
