# ios-swift-ui-template

[![Build and Test](https://github.com/ahcodedev/ios-swift-ui-template/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/ahcodedev/ios-swift-ui-template/actions/workflows/build-and-test.yml)
[![Gitleaks](https://github.com/ahcodedev/ios-swift-ui-template/actions/workflows/gitleaks.yml/badge.svg)](https://github.com/ahcodedev/ios-swift-ui-template/actions/workflows/gitleaks.yml)
[![Zizmor](https://github.com/ahcodedev/ios-swift-ui-template/actions/workflows/zizmor.yml/badge.svg)](https://github.com/ahcodedev/ios-swift-ui-template/actions/workflows/zizmor.yml)

iOS Swift UI Template

## Setup

```sh
brew bundle
```

## Commands

| Command | Description |
| --- | --- |
| `just gitleaks` | Scan the repo and its git history for secrets |
| `just zizmor` | Audit the GitHub Actions workflows |

## Checks

Each runs on pushes to `main` and on pull requests.

| Workflow | Description |
| --- | --- |
| Build and Test | Builds the app and runs its tests on an iOS simulator |
| Gitleaks | Scans for committed secrets |
| Zizmor | Audits the GitHub Actions workflows |
