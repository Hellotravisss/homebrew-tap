# Hellotravisss Homebrew Tap

Homebrew formulae for [Agentic Sandbox Sentry](https://github.com/Hellotravisss/agentic-sandbox-sentry) — a lightweight macOS runtime safety guard for local AI coding agents.

## Install

```bash
brew install hellotravisss/tap/agentic-sandbox-sentry
```

Then activate the monitor and agent integrations:

```bash
"$(brew --prefix agentic-sandbox-sentry)/libexec/install.sh"
```

Manage it with `sentryctl` (try `sentryctl` with no arguments for the dashboard).

## Upgrade

```bash
brew update && brew upgrade agentic-sandbox-sentry
```

## Uninstall

```bash
brew uninstall agentic-sandbox-sentry
brew untap hellotravisss/tap
```

Config and logs live in `~/.agentsentry`. See the [main project README](https://github.com/Hellotravisss/agentic-sandbox-sentry) for full documentation.
