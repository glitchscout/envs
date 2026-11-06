# Godot TPS demo

The 3D stress environment: a high-fidelity third-person shooter with enemy robots that notice, aim and shoot, physics
debris and heavy lighting. It runs nightly only. It is here to put rendering, frame capture and the vision checks under
load, not to gate pull requests: its repository is large and a rendered run is slow on a machine without a GPU.

- **Upstream:** [godotengine/tps-demo](https://github.com/godotengine/tps-demo), maintained by the Godot project, pinned
  in `env.yaml`. Code © 2018-2021 Juan Linietsky and Godot Engine contributors, MIT License. Assets © 2018 Juan
  Linietsky and Fernando Miguel Calabró, and music © 2018 Christian Fernando Perucchi, both under
  [CC-BY 3.0](https://creativecommons.org/licenses/by/3.0/legalcode); see the upstream `LICENSE.md`. This directory
  holds only our patches, tests and metadata: the game and its assets are fetched from upstream and never
  redistributed here. No endorsement by the project is implied.
- **Integration (`patches/0001-glitchscout-qa.patch`, MIT like the files it changes):** enables the Glitchscout SDK,
  declares the movement axis and the game's events (`level_ready`, `player_shot`, `robot_hit`, `robot_exploded`,
  `too_many_nodes`), starts a test session straight in the level, offline and from the first spawn point (the game
  otherwise opens the menu, hosts a server when headless, and picks a random spawn point), names each robot after its
  spawn point (`robot_1` to `robot_4`) and makes it an observable threat with its health and AI state, and keeps test
  settings in their own user directory, in a window rather than exclusive fullscreen.

```bash
gscout env run tps-demo
gscout env run tps-demo --bug robot-blind
```

Godot (the version in `env.yaml`) must be on `PATH` as `godot`. Runs are rendered with the Compatibility renderer, so
on a machine without a display (CI) they need one: `xvfb-run -a -s "-screen 0 1280x720x24" gscout env run tps-demo`,
with Mesa's software GL installed. The game's own renderer, Forward+, needs Vulkan, which software rendering draws too
slowly for a nightly run; the Compatibility renderer logs a few warnings about the effects it leaves out.

## Tests

| Test | Checks |
|---|---|
| `smoke.feature` | the level starts and runs without script errors |
| `walk.feature` | holding forward walks the player away from the spawn point |
| `robots.feature` | a robot starts after a player who comes within 20 m, and goes on to aim and shoot |
| `shoot.feature` | aiming and pulling the trigger fires a shot |
| `perf.feature` | the level stays within its node budget for 10 seconds |

The upstream laser doesn't hurt the player yet, so a robot's shot ends the combat chain the tests can see. The bot's
`fights` goal can't play this game yet: the player turns to face where it walks, so both stick axes move it along the
same line and the bot's control calibration refuses it.

## Seeded bugs

All synthetic: ours, not upstream defects. Each is described in `bugs/<id>.yaml` with the test it should fail.

| Bug | Category | Shows as |
|---|---|---|
| `crash-on-shoot` | crash | the shooting test ends `crashed` |
| `walk-script-error` | script_error | the walking test ends `failed` |
| `robot-blind` | combat | both robot tests end `failed` |
| `robot-never-fires` | combat | the robot-shoots test ends `failed`; the robot still notices the player |
| `debris-storm` | perf | the performance test ends `failed` |
| `missing-texture` | visual | a `missing_texture` finding on the smoke test, which still passes |

`missing-texture` is a magenta HUD panel rather than a magenta model: the level's tonemapping and bloom wash a flat
magenta material out to pale pink, which the visual check doesn't take for a missing texture. The clean build raises no
visual findings.
