# Hellotravisss Homebrew Tap

Homebrew formulae for [Agentic Sentry](https://github.com/Hellotravisss/agentic-sentry) — a lightweight macOS runtime safety guard for local AI coding agents.

## Install

```bash
brew install hellotravisss/tap/agentic-sentry
```

Then activate the monitor and agent integrations:

```bash
"$(brew --prefix agentic-sentry)/libexec/install.sh"
```

Manage it with `sentryctl` (try `sentryctl` with no arguments for the dashboard).

## Upgrade

```bash
brew update && brew upgrade agentic-sentry
```

## Uninstall

```bash
brew uninstall agentic-sentry
brew untap hellotravisss/tap
```

Config and logs live in `~/.agentsentry`. See the [main project README](https://github.com/Hellotravisss/agentic-sentry) for full documentation.
