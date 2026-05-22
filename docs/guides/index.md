# Guides

Step-by-step guides for building Telegram bots with telebot.nim.

## Available Guides

- [Polling & Webhooks](polling.md) — Choose your update delivery method and configure timeouts
- [Sending Media](media.md) — Send text, photos, videos, audio, documents, locations, contacts, and more
- [Keyboards](keyboards.md) — Build reply keyboards, inline keyboards, force reply, and special button types
- [Inline Queries](inline-queries.md) — Create inline bots that respond to `@yourbot query` from any chat
- [Web Apps](webapp.md) — Build Telegram Web Apps with client-side Nim JS bindings

## Common Patterns

### Handler Signatures

All handlers follow these signatures:

```nim
# Update handler — receives every update
proc handler(bot: TeleBot, update: Update): Future[bool] {.gcsafe, async.}

# Command handler — receives only matching /command
proc handler(bot: TeleBot, cmd: Command): Future[bool] {.gcsafe, async.}

# Inline query handler
proc handler(bot: TeleBot, inlineQuery: InlineQuery): Future[bool] {.gcsafe, async.}
```

All handlers must return `true` to continue processing, or `false` to stop.

### Error Handling

Wrap API calls in try/except for robust bots:

```nim
try:
  discard await bot.sendMessage(chatId, "Hello!")
except TelegramError as e:
  error "API error: ", e.msg
except Exception as e:
  error "Unexpected: ", e.msg
```
