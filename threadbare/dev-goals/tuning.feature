Feature: Tuning goals' references
  # References for the dev goals in expectations.yaml. They aren't in qa/features, so the suite a generator sees doesn't
  # grow with them. None links a seeded bug: these goals tune validity and false failures, not recall.

  Scenario: Stepping up and down in the ink combat tutorial
    Given the player is in scene "tutorial_ink_combat"
    When the player dismisses the dialogue
    And the player steps "move_up"
    And the player steps "move_down"
    Then no script errors should be logged

  Scenario: The void runner tutorial loads cleanly
    Given the player is in scene "tutorial_void_runner"
    When the player waits 2 seconds
    Then no script errors should be logged

  Scenario: Interacting with nothing nearby in the void runner tutorial
    Given the player is in scene "tutorial_void_runner"
    When the player dismisses the dialogue
    And the player taps "interact"
    And the player waits 1 second
    Then no script errors should be logged

  Scenario: The village stays put during the opening line
    Given the player is in scene "tutorial_ruined_village"
    When the player waits 3 seconds
    Then the player should stay in scene "tutorial_ruined_village"

  Scenario: Walking right in the ink combat tutorial
    Given the player is in scene "tutorial_ink_combat"
    When the player dismisses the dialogue
    And the player walks "move_right"
    Then no script errors should be logged

  Scenario: Standing still in the ink combat tutorial is safe
    Given the player is in scene "tutorial_ink_combat"
    When the player waits 5 seconds
    Then the event "player_defeated" should not occur

  Scenario: Running right in the void runner tutorial
    Given the player is in scene "tutorial_void_runner"
    When the player dismisses the dialogue
    And the player presses "running"
    And the player walks "move_right"
    Then no script errors should be logged

  Scenario: The void runner tutorial puts the player there
    Given the player is in scene "tutorial_void_runner"
    When the player waits 1 second
    Then the player should be in scene "tutorial_void_runner"

  Scenario: The ink combat tutorial puts the player there
    Given the player is in scene "tutorial_ink_combat"
    When the player waits 1 second
    Then the player should be in scene "tutorial_ink_combat"

  Scenario: The ink combat tutorial doesn't flood the scene with nodes
    Given the player is in scene "tutorial_ink_combat"
    When the player waits 3 seconds
    Then the event "too_many_nodes" should not occur
