# ios-swift-ui-template

[![Build and Test](https://github.com/ahcodedev/ios-swift-ui-template/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/ahcodedev/ios-swift-ui-template/actions/workflows/build-and-test.yml)
[![Gitleaks](https://github.com/ahcodedev/ios-swift-ui-template/actions/workflows/gitleaks.yml/badge.svg)](https://github.com/ahcodedev/ios-swift-ui-template/actions/workflows/gitleaks.yml)
[![Lint](https://github.com/ahcodedev/ios-swift-ui-template/actions/workflows/lint.yml/badge.svg)](https://github.com/ahcodedev/ios-swift-ui-template/actions/workflows/lint.yml)
[![Zizmor](https://github.com/ahcodedev/ios-swift-ui-template/actions/workflows/zizmor.yml/badge.svg)](https://github.com/ahcodedev/ios-swift-ui-template/actions/workflows/zizmor.yml)

iOS Swift UI Template

## Setup

```sh
brew install just
just setup
just rename "My App"
```

`just setup` installs the tools in the `Brewfile` and the git pre-commit hooks. `just rename` replaces the placeholder project name in file names and contents, including `.project_name`, which the tooling reads the project name from.

## Commands

| Command | Description |
| --- | --- |
| `just setup` | Install tools and git pre-commit hooks |
| `just rename "My App"` | Rename the project everywhere |
| `just build` | Build the app for the iOS simulator |
| `just test` | Run the unit and UI tests on the iOS simulator |
| `just coverage` | Run the tests and fail if app line coverage is below the minimum |
| `just lint` | Check Swift sources against the lint and formatting rules |
| `just format` | Format Swift sources in place |
| `just gitleaks` | Scan the repo and its git history for secrets |
| `just zizmor` | Audit the GitHub Actions workflows |

## Checks

Each runs on pushes to `main` and on pull requests.

| Workflow | Description |
| --- | --- |
| Build and Test | Builds the app, runs its tests on an iOS simulator and checks coverage |
| Lint | Checks Swift formatting and lint rules |
| Gitleaks | Scans for committed secrets |
| Zizmor | Audits the GitHub Actions workflows |

## Coverage

Coverage is measured for the app target only. The minimum line coverage percentage is in `.minimum_coverage`; `just coverage` and the Build and Test workflow both read it. Pass a value to try a different minimum locally, e.g. `just coverage 90`.

## Tooling updates

[Copier](https://copier.readthedocs.io) keeps a project's tooling (justfile, workflows, lint configs, Brewfile, hooks) in sync with this template. It doesn't touch the Xcode project, `README.md` or `LICENSE`, and never overwrites `.project_name` or `.minimum_coverage`.

Adopt it once in a project created from this template, then commit `.copier-answers.yml`:

```sh
copier copy https://github.com/ahcodedev/ios-swift-ui-template.git .
```

Pull in later template changes:

```sh
copier update
```

Updates move to the latest tagged template release. Conflicts with local edits appear as merge conflict markers.
