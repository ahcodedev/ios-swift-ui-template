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

`just setup` installs the tools in the `Brewfile` and the git pre-commit hooks. `just rename` replaces the placeholder project name in file names and contents.

## Commands

| Command | Description |
| --- | --- |
| `just setup` | Install tools and git pre-commit hooks |
| `just rename "My App"` | Rename the project everywhere |
| `just build` | Build the app for the iOS simulator |
| `just test` | Run the unit and UI tests on the iOS simulator |
| `just lint` | Check Swift sources against the lint and formatting rules |
| `just format` | Format Swift sources in place |
| `just gitleaks` | Scan the repo and its git history for secrets |
| `just zizmor` | Audit the GitHub Actions workflows |

## Checks

Each runs on pushes to `main` and on pull requests.

| Workflow | Description |
| --- | --- |
| Build and Test | Builds the app and runs its tests on an iOS simulator |
| Lint | Checks Swift formatting and lint rules |
| Gitleaks | Scans for committed secrets |
| Zizmor | Audits the GitHub Actions workflows |
