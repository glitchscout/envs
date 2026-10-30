# Kenney Starter Kit 3D Platformer

The per-PR smoke environment: a small, stable 3D game (character controller, double jump, coins, falling
platforms, camera) that builds in seconds and behaves almost deterministically.

- **Upstream:** [KenneyNL/Starter-Kit-3D-Platformer](https://github.com/KenneyNL/Starter-Kit-3D-Platformer),
  pinned in `env.yaml`. Code © 2023 Kenney, MIT License; assets (sprites, models, sounds) CC0. This
  directory holds only our patches, tests and metadata; the game itself is fetched from upstream.
- **Integration (`patches/0001-glitchscout-qa.patch`):** enables the Glitchscout SDK, declares the movement
  axis and the game's events (`coin_collected`, `player_fell`), sends them from the player, and makes coins
  observable interactables.
- **Seeded bugs:** synthetic, ours, not upstream defects.
  - `bugs/crash-on-coin`: the game crashes right after a coin is picked up; the coin test must end `crashed`.
  - `bugs/coin-script-error`: picking up a coin calls a method the player does not have, so a script error is
    logged on every pickup; the coin test must end `failed` at "no script errors should be logged".
  - `bugs/crash-on-double-jump`: the game crashes when the player jumps a second time in the air; the jump test must
    end `crashed`.
  - `bugs/landing-script-error`: landing after a jump calls a method the player does not have, so a script error is
    logged on every landing; the jump test must end `failed`.

```bash
gscout env run kenney-3d-platformer
gscout env run kenney-3d-platformer --bug crash-on-coin
gscout env run kenney-3d-platformer --bug coin-script-error
gscout env run kenney-3d-platformer --bug crash-on-double-jump
gscout env run kenney-3d-platformer --bug landing-script-error
```

`qa/steps/game.yaml` adds "the player taps {action}", a press that releases itself: the built-in "presses" holds the
button down, so a second press of a held button is not a new press.

Godot (the version in `env.yaml`) must be on `PATH` as `godot`.
