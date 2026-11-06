Feature: Shooting

  Scenario: Aiming and pulling the trigger fires a shot
    When the player presses "aim"
    And the player waits 0.5 seconds
    And the player taps "shoot"
    Then the event "player_shot" should occur within 2 seconds
    And no script errors should be logged
