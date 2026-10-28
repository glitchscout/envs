# envs

Reproducible end-to-end test environments for Glitchscout: pinned open-source games, integration patches and
planted test bugs used to evaluate the agent.

## Layout

Each environment is a directory named after it:

```
<env>/
  env.yaml          what to build, from which commit, and how to launch it
  patches/*.patch   the integration patches (add the SDK's hooks, tag observables, emit events), in order
  bugs/<id>.patch   seeded bugs, each described by bugs/<id>.yaml
  qa/               the env's tests, laid out as in a game repository (features/, steps/, game.yaml, config)
  baseline.json     the expected status of every test on the clean build
```

## env.yaml

```yaml
name: kenney-3d-platformer          # the directory's name
upstream: https://github.com/<owner>/<repo>
mirror: https://github.com/<org>/<repo>-qa   # optional: cloned instead of upstream
pin: <full commit SHA>              # gating builds never follow a branch
canary: main                        # the branch a weekly, non-gating run tracks
engine: { name: godot, version: "4.7.2", image: <optional pinned container image> }
sdk: { repo: https://github.com/glitchscout/godot-sdk, ref: <tag, branch or SHA>, path: addons/glitchscout }
license_notes: "MIT code, CC0 assets"
patches: [patches/0001-observables.patch]
build:                              # run with sh in the checkout, per OS
  linux: godot --headless --export-release Linux build/game.x86_64
output: build                       # the directory the build leaves (default build)
launch: "{build}/game.x86_64 --fixed-fps 60 -- --glitchscout-endpoint={endpoint} --glitchscout-token={token}"
```

`{build}` is the kept build directory, and `{endpoint}` and `{token}` are filled in for each run. The SDK is
copied into the checkout (to `sdk.into`, default `sdk.path`) before the patches are applied, so the patches
only touch the game.

A build is cached by the hash of its inputs: the source and pin, every patch's content, the seeded bug, the
engine, the SDK's resolved commit, the build command and the platform. When none of them change, the cached
build is reused and nothing is cloned or rebuilt.

## Seeded bugs

`bugs/<id>.yaml` describes `bugs/<id>.patch`:

```yaml
category: crash                     # crash, hang, softlock, logic, navigation, traversal, UI, ...
synthetic: true                     # required: every seeded bug is ours, never a defect of the upstream game
description: the game crashes when the coin is picked up
expect:                             # tests whose status differs from baseline.json with the bug in
  - test: qa/features/coins.feature:4
    status: crashed
```

Seeded bugs are artificial. They are labelled synthetic in their file names, metadata and any published
results, so they can't be mistaken for real bugs in the upstream games.

## Licenses

This repository holds our patches, tests and metadata (Apache-2.0). It never redistributes a game's own
code or assets: those are fetched from the upstream project at the pinned commit, under the upstream
license, which each `env.yaml` notes.
