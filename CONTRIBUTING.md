# Contributing to Telebot.nim

Thanks for your interest in contributing! This guide covers setup, workflow, and conventions.

## Prerequisites

- Nim >= 2.2.10
- Nimble (comes with Nim)
- A Telegram Bot API token for testing (get one from [@BotFather](https://t.me/botfather))

## Getting Started

```bash
git clone https://github.com/nim-munity/telebot.git
cd telebot
nimble install
```

Create `secret.key` in the project root with your bot token for running examples:

```bash
echo "YOUR_BOT_TOKEN" > secret.key
```

> **Never commit your token.** `secret.key` is in `.gitignore`.

## Project Structure

```
src/
  telebot.nim              # Main entry point, re-exports public API
  telebot/
    webapp.nim             # WebApp support
    private/
      api.nim              # Telegram Bot API method implementations
      types.nim            # All Telegram API types
      events.nim           # Event handler registration (onCommand, onUpdate, etc.)
      helpers.nim          # Internal helper utilities
      keyboard.nim         # Keyboard markup builders
      inputmedia.nim       # InputMedia type handling
      utils.nim            # General utilities
      webhook.nim          # Webhook server implementation
tests/                     # Test files
examples/                  # Usage examples
```

## Development Workflow

### Branching

- Fork the repo and create a feature branch from `master`
- Use descriptive branch names: `fix/polling-timeout`, `feat/forum-topic-support`

### Code Style

- **Indentation**: 2 spaces (Nim convention)
- **Naming**: camelCase for procs/vars, PascalCase for types/objects
- **Pragmas**: Use `{.async.}` for async procs, `{.api.}` for Telegram API methods
- **Imports**: Group standard library imports, then project imports. Use explicit `from X import Y` when importing specific symbols
- **Line length**: No hard limit, but break long proc signatures at parameters

Example pattern for adding a new API method:

```nim
proc sendFoo*(b: TeleBot, chatId: ChatId, foo: string,
              disableNotification = false): Future[Message] {.api, async.}
```

### Adding a New API Method

1. Add the type definitions in `src/telebot/private/types.nim` if needed
2. Add the proc signature in `src/telebot/private/api.nim` with `{.api, async.}` pragma
3. Add callback registration in `src/telebot/private/events.nim` if it's an update handler
4. Export from `src/telebot.nim` if it should be part of the public API
5. Add an example in `examples/` if the feature is significant

### Testing

Run tests:

```bash
nimble test
```

Test files live in `tests/`. Use Nim's `unittest` module:

```nim
import unittest
import telebot

suite "MyFeature":
  test "does the thing":
    check true
```

When adding new features, add corresponding test coverage. For API methods that require network access, mock the HTTP client or mark tests as requiring a live token.

### Building & Checking

```bash
# Compile check
nim c src/telebot.nim

# Run a specific example
nim c -r examples/echo_bot.nim
```

The project uses `nim.cfg` with `-d:ssl -d:nimOldCaseObjects` by default.

## Submitting Changes

1. Ensure your code compiles without warnings
2. Run existing tests — don't break them
3. Add tests for new functionality
4. Update README.md if adding public API features or changing usage
5. Keep commits focused — one logical change per commit
6. Write clear commit messages: what changed and why

## Reporting Issues

- Search existing issues first
- Include Nim version (`nim --version`), OS, and a minimal reproducible example
- For API-related bugs, include the Telegram Bot API method and error message

## License

By contributing, you agree that your contributions will be licensed under the Apache 2.0 License.
