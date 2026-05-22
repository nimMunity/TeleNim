# Telebot.nim

A powerful, asynchronous Telegram Bot API client for Nim. Build feature-rich Telegram bots with type safety and modern async/await.

## Features

- **Full Telegram Bot API** — All methods and types covered
- **Async by Default** — Built on Nim's `asyncdispatch` for non-blocking I/O
- **Type-Safe** — Strong typing catches errors at compile time
- **Webhook & Polling** — Choose long-polling or webhook mode
- **Inline Queries** — Full inline bot support
- **Media Support** — Photos, videos, audio, documents, media groups, stickers
- **Telegram Web Apps** — Client-side WebApp bindings for JS backend
- **Proxy Support** — Route traffic through HTTP proxies

## Quick Example

```nim
import telebot, asyncdispatch

const API_KEY = "YOUR_BOT_TOKEN"

proc handler(bot: TeleBot, cmd: Command): Future[bool] {.async.} =
  discard await bot.sendMessage(cmd.message.chat.id, "Hello!")
  return true

let bot = newTeleBot(API_KEY)
bot.onCommand("start", handler)
bot.poll()
```

## Requirements

- Nim >= 2.2.10
- A Telegram Bot API token from [@BotFather](https://t.me/botfather)

## Installation

```bash
nimble install telebot
```

## License

Apache 2.0
