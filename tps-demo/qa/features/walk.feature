Feature: Walking

  # The player starts at 64.8, 78.8 (the first spawn point) and walks where the camera faces.
  Scenario: Holding forward walks the player away from the spawn point
    When the player presses "move_forward"
    Then the player should be more than 3 m from 64.8, 78.8 within 4 seconds
    And no script errors should be logged
