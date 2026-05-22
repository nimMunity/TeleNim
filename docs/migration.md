# Migration Guide

## From Pre-1.0 to 1.0+

### Breaking Changes

The message constructor pattern was deprecated:

```nim
# OLD (deprecated)
var msg = newMessage(chatId, "Hello")
discard bot.send(msg)

# NEW
discard await bot.sendMessage(chatId, "Hello")
```

Same applies to all media types:

| Old (deprecated) | New |
|-------------------|-----|
| `newMessage()` + `bot.send()` | `bot.sendMessage()` |
| `newPhoto()` + `bot.send()` | `bot.sendPhoto()` |
| `newDocument()` + `bot.send()` | `bot.sendDocument()` |
| `newLocation()` + `bot.send()` | `bot.sendLocation()` |

### Backward Compatibility

For backward compatibility, import the compat module:

```nim
import telebot/compat
```

This provides the old `newMessage`, `newPhoto`, etc. constructors.

## Handler Signature Changes

Old handler signatures used `Telebot` (lowercase 'b'):

```nim
# Old
proc handler(b: Telebot, u: Update): Future[bool] {.async.} =
```

Both `Telebot` and `TeleBot` work, but `TeleBot` is the canonical form.

## Common Migration Patterns

### Command Handlers

```nim
# Old pattern (still works)
proc handler(bot: TeleBot, cmd: Command): Future[bool] {.gcsafe, async.} =
  var msg = newMessage(cmd.message.chat.id, "Hello")
  msg.disableNotification = true
  discard bot.send(msg)
  return true

# New pattern
proc handler(bot: TeleBot, cmd: Command): Future[bool] {.gcsafe, async.} =
  discard await bot.sendMessage(cmd.message.chat.id, "Hello",
    disableNotification = true)
  return true
```

### Callback Query Handlers

```nim
# Old
proc cb(e: Command): Future[bool] {.async.} =
  var msg = newMessage(e.message.chat.id, "clicked")
  discard bot.send(msg)

# New
proc cb(bot: TeleBot, cb: CallbackQuery): Future[bool] {.async.} =
  discard await bot.answerCallbackQuery(cb.id, text = "Clicked!")
  discard await bot.sendMessage(cb.message.chat.id, "Clicked!")
  return true
```

## Version History

- **v8.3.0** — Current version
- **v1.0.0** — Deprecated `newMessage`/`newPhoto` constructors in favor of direct API methods
