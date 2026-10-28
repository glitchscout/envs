# Kenney Starter Kit 3D Platformer

The per-PR smoke environment: a small, stable 3D game (character controller, double jump, coins, falling
platforms, camera) that builds in seconds and behaves almost deterministically.

- **Upstream:** [KenneyNL/Starter-Kit-3D-Platformer](https://github.com/KenneyNL/Starter-Kit-3D-Platformer),
  pinned in `env.yaml`. Code © 2023 Kenney, MIT License; assets (sprites, models, sounds) CC0. This
  directory holds only our patches, tests and metadata; the game itself is fetched from upstream.
- **Integration (`patches/0001-glitchscout-qa.patch`):** enables the Glitchscout SDK, declares the movement
  axis and the game's events (`coin_collected`, `player_fell`), sends them from the player, and makes coins
  observable interactables.
- **Seeded bug (`bugs/crash-on-coin`):** synthetic, ours, not an upstream defect. The game crashes right
  after a coin is picked up; the coin test must end `crashed`.

```bash
gscout env run kenney-3d-platformer
gscout env run kenney-3d-platformer --bug crash-on-coin
```

Godot (the version in `env.yaml`) must be on `PATH` as `godot`.
