# Getting Started

## Installation

Install via Nimble:

```bash
nimble install telebot
```

Or add to your `.nimble` file:

```
requires "telebot"
```

## Getting a Bot Token

1. Open Telegram and search for [@BotFather](https://t.me/botfather)
2. Send `/newbot` and follow the prompts
3. Copy the API token you receive

## Your First Bot

Create a file `mybot.nim`:

```nim
import telebot, asyncdispatch, logging, strutils

var L = newConsoleLogger(fmtStr="$levelname, [$time] ")
addHandler(L)

const API_KEY = "YOUR_BOT_TOKEN"

proc updateHandler(bot: TeleBot, update: Update): Future[bool] {.gcsafe, async.} =
  if not update.message.isNil:
    let text = update.message.text
    if text.len > 0:
      discard await bot.sendMessage(
        update.message.chat.id,
        "Echo: " & text,
        parseMode = "markdown",
        disableNotification = true,
        replyParameters = ReplyParameters(messageId: update.message.messageId)
      )
  return true

proc startHandler(bot: TeleBot, cmd: Command): Future[bool] {.gcsafe, async.} =
  if not cmd.message.fromUser.isNil:
    let name = cmd.message.fromUser.firstName
    discard await bot.sendMessage(
      cmd.message.chat.id,
      "Hello " & name & "! Send me any text.",
      replyParameters = ReplyParameters(messageId: cmd.message.messageId)
    )
  return true

when isMainModule:
  let bot = newTeleBot(API_KEY)
  bot.onUpdate(updateHandler)
  bot.onCommand("start", startHandler)
  echo "Bot started. Polling..."
  bot.poll(timeout = 300)
```

Compile and run:

```bash
nim c -r mybot.nim
```

## Using a Secret Key File

For security, store your token in a file instead of hardcoding it:

```bash
echo "YOUR_BOT_TOKEN" > secret.key
```

```nim
const API_KEY = strip(slurp("secret.key"))
```

> Add `secret.key` to your `.gitignore` to avoid committing it.

## Local API Server

For testing with a local Telegram API server:

```nim
let bot = newTeleBot(API_KEY, "http://127.0.0.1:8081")
```

## Proxy Configuration

Route bot traffic through an HTTP proxy:

```nim
let bot = newTeleBot(API_KEY)
bot.setProxy("http://localhost:8080")
```

## What's Next

- [Polling & Webhooks](guides/polling.md) — Choose your update delivery method
- [Sending Messages](guides/media.md) — Text, photos, videos, and more
- [Keyboards](guides/keyboards.md) — Reply and inline keyboards
- [API Reference](api/overview.md) — Full method and type reference
