# Threadbare

The primary Godot environment: a 2D action-adventure in active development, with dialogue, puzzles, quests and a
scene switcher, so it exercises real churn where Kenney covers stability.

- **Upstream:** [endlessm/threadbare](https://github.com/endlessm/threadbare), a project of Endless Access, pinned in
  `env.yaml` to v0.2.4. Code MPL-2.0, assets CC BY-SA 4.0. This directory holds only our patches, tests and metadata:
  the game and its assets are never redistributed here. No endorsement by the project is implied.
- **Integration (`patches/0001-glitchscout-qa.patch`, MPL-2.0 like the files it changes):** enables the Glitchscout SDK,
  declares the movement axis and the game's events, adds `addons/glitchscout_qa` to turn the game's signals into events,
  registers `load_scene`, `save_game` and `load_save`, makes `InteractArea` observable, gives the menu's buttons stable ids, keeps test data in its own user directory (so a
  real copy of the game on the machine is left alone), and removes that saved game at the start of a test session so
  each test starts from a new game.

```bash
gscout env run threadbare
```

Godot (the version in `env.yaml`) must be on `PATH` as `godot`, and `git-lfs` must be installed.

## Seeded bugs

All synthetic: ours, not upstream defects. Each is described in `bugs/<id>.yaml` with the test it should fail.

| Bug | Category | Shows as |
|---|---|---|
| `crash-on-pickup` | crash | the pickup test ends `crashed` |
| `pickup-script-error` | script_error | the pickup test ends `failed` |
| `hang-on-talk` | hang | the talk and bridge tests end `hung` |
| `bridge-stays-blocked` | softlock | the bridge test ends `failed` |
| `powerup-not-granted` | logic | the pickup test ends `failed` |
| `enemy-navmesh-hole` | navigation | the Void test ends `failed` |
| `save-loses-abilities` | save_load | a `save_load_mismatch` finding, with no assertion written for it |
| `node-storm` | perf | the performance test ends `failed` |
| `dead-start-button` | UI | the menu and dialogue tests end `failed` |
| `options-traps-focus` | UI | a `ui_focus_trap` finding, with no assertion written for it |
| `menu-missing-texture` | visual | a `missing_texture` finding; launches with a real renderer |
| `void-never-catches` | combat | the Void test ends `failed` |

Out-of-bounds and traversal bugs are in `kenney-3d-platformer`, which has jumps and a level to fall out of.

## The mirror

Upstream keeps its assets in Git LFS, and repeated CI clones would spend its bandwidth quota. Builds therefore clone
`mirror` from `env.yaml`, a private copy holding the history and the LFS objects of the pinned commit, and `gscout` refuses
to build a game that uses LFS without one. Building this env needs read access to the mirror.

Moving the pin means copying the new commit's objects once, from a machine with access to the mirror:

```bash
git clone --bare https://github.com/endlessm/threadbare threadbare.git && cd threadbare.git
git remote add mirror https://github.com/glitchscout/threadbare-qa.git
git push mirror refs/heads/main:refs/heads/main 'refs/tags/*:refs/tags/*'
git lfs fetch origin <pin>
git lfs ls-files -l <pin> | awk '{print $1}' | xargs git lfs push mirror --object-id
```

## Notes for tests

Runs are headless, so Godot logs `Not supported by this display server` from the game's key-hint textures. That comes
from the headless display server, not a game bug, so tests use "no script errors should be logged" rather than "no errors".

Performance is checked by node count, through the `too_many_nodes` event: frame times here include waiting for the
test's next step, and a count doesn't depend on how fast the machine is.

A scene step compares the file name without its extension (`tutorial_ruined_village`).
