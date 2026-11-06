Feature: Robots

  # Robot 1 stands at 71.6, 46.3 and notices a player within 20 m.
  Scenario: A robot starts after a player who comes close
    Given the player is at 69.5, -5, 58
    Then "robot_1" should be "approach" within 5 seconds
    And no script errors should be logged

  # Upstream's laser doesn't hurt the player yet, so the shot ends the chain: notice, turn to face, see, aim, shoot.
  # A robot fires about 7 s after it faces the player, is "shooting" for 3 s, then approaches again.
  Scenario: A robot that sees the player shoots at them
    Given the player is at 69.5, -5, 58
    Then "robot_1" should be "shooting" within 15 seconds
    And no script errors should be logged
