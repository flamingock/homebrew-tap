# Flamingock Homebrew Tap

Official Homebrew tap for [Flamingock CLI](https://flamingock.io).

## Install

```bash
brew tap flamingock/tap
brew install flamingock
```

## Upgrade

```bash
brew upgrade flamingock
```

## What is Flamingock CLI?

Flamingock CLI is a command-line tool for executing Flamingock change operations outside the normal application lifecycle. It allows DevOps, Platform Engineers, and Administrators to:

- Apply changes before deployment (not during startup)
- Validate that all changes are applied
- Dry-run to preview what changes would be applied
- Audit and fix change states

```bash
flamingock execute apply    --jar ./my-app.jar
flamingock execute validate --jar ./my-app.jar
flamingock execute dry-run  --jar ./my-app.jar
flamingock audit list       --jar ./my-app.jar
flamingock issue list       --jar ./my-app.jar
```

## Supported Platforms

Flamingock CLI is available as a **native binary** (no JVM required) for the most common platforms, and as a **platform-independent JAR** for everything else.

### Native binaries (via Homebrew)

| Platform | Architecture | Native binary |
|----------|-------------|---------------|
| macOS    | Apple Silicon (arm64) | ✅ |
| Linux    | x86_64 | ✅ |

> **Note:** The Homebrew formula only covers native binaries. If your platform isn't listed above, use alternatives listed in releases.

## Documentation

- [CLI Reference](https://docs.flamingock.io/cli)
- [GitHub Releases](https://github.com/flamingock/flamingock-cli/releases)
