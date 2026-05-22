# Keyboards

Telebot provides builders for all Telegram keyboard types: reply keyboards, inline keyboards, force reply, and keyboard removal.

## Reply Keyboards

Reply keyboards appear below the text input. They send a text message when tapped.

### Creating a Reply Keyboard

```nim
import telebot

let button1 = newKeyBoardButton("Option 1")
let button2 = newKeyBoardButton("Option 2")
let button3 = newKeyBoardButton("Option 3")

let keyboard = newReplyKeyboardMarkup(
  @[button1, button2],  # Row 1
  @[button3]            # Row 2
)
```

### Reply Keyboard Options

```nim
let keyboard = newReplyKeyboardMarkup(
  @[button1],
  isPersistent = false,          # Keep keyboard open after selection
  resizeKeyboard = true,         # Shrink to fit content
  oneTimeKeyboard = true,        # Hide after one use
  inputFieldPlaceholder = "Pick one...",
  selective = false              # Show only to specific users
)
```

### Sending with a Reply Keyboard

```nim
discard await bot.sendMessage(chatId, "Choose:", replyMarkup = keyboard)
```

### Special Button Types

**Request Contact:**

```nim
let btn = newKeyBoardButton("Share Phone", requestContact = true)
```

**Request Location:**

```nim
let btn = newKeyBoardButton("Share Location", requestLocation = true)
```

**Request Chat:**

```nim
let btn = newKeyBoardButton("Pick a Chat", requestChat = chatRequest)
```

**Web App:**

```nim
let btn = newKeyBoardButton("Open App", webApp = WebAppInfo(url: "https://example.com"))
```

### Removing Reply Keyboard

```nim
let remove = newReplyKeyboardRemove()
discard await bot.sendMessage(chatId, "Keyboard removed", replyMarkup = remove)
```

## Inline Keyboards

Inline keyboards appear below messages. They trigger callbacks, open URLs, or switch to inline queries.

### URL Buttons

```nim
let btn = newInlineKeyBoardButton("Visit Google", url = "https://google.com")
let keyboard = newInlineKeyboardMarkup(@[btn])
discard await bot.sendMessage(chatId, "Click below:", replyMarkup = keyboard)
```

### Callback Buttons

```nim
let btn = newInlineKeyBoardButton("Click Me", callbackData = "btn_clicked")
let keyboard = newInlineKeyboardMarkup(@[btn])
discard await bot.sendMessage(chatId, "Press the button:", replyMarkup = keyboard)
```

### Multi-Row Inline Keyboard

```nim
let row1 = @[
  newInlineKeyBoardButton("Google", url = "https://google.com"),
  newInlineKeyBoardButton("Bing", url = "https://bing.com")
]
let row2 = @[
  newInlineKeyBoardButton("DuckDuckGo", url = "https://duckduckgo.com")
]
let keyboard = newInlineKeyboardMarkup(row1, row2)
```

### Inline Button Options

| Parameter | Type | Description |
|-----------|------|-------------|
| `text` | `string` | Button label |
| `url` | `string` | URL to open |
| `callbackData` | `string` | Data sent on click |
| `loginUrl` | `LoginUrl` | Login URL for seamless auth |
| `webApp` | `WebAppInfo` | Web App to open |
| `switchInlineQuery` | `string` | Switch to inline query |
| `switchInlineQueryCurrentChat` | `string` | Inline query in current chat |
| `pay` | `bool` | Payment button |

### Login URL Buttons

For seamless website authentication:

```nim
let loginUrl = newLoginUrl("https://your-site.com/auth")
let btn = newInlineKeyBoardButton("Login", loginUrl = loginUrl)
let keyboard = newInlineKeyboardMarkup(@[btn])
```

## Handling Callback Queries

When users click inline buttons, you receive callback queries:

```nim
proc callbackHandler(bot: TeleBot, callbackQuery: CallbackQuery): Future[bool] {.async.} =
  if callbackQuery.data == "btn_clicked":
    discard await bot.answerCallbackQuery(callbackQuery.id, text = "You clicked!")
    discard await bot.sendMessage(callbackQuery.message.chat.id, "Button was pressed!")
  return true

let bot = newTeleBot(API_KEY)
bot.onCallbackQuery(callbackHandler)
```

## Force Reply

Force the user to reply to a specific message:

```nim
let forceReply = newForceReply(forceReply = true, inputFieldPlaceholder = "Type your answer...")
discard await bot.sendMessage(chatId, "What is your name?", replyMarkup = forceReply)
```

## Command Scopes

Register commands with different scopes:

```nim
import telebot

let commands = @[BotCommand(command: "start", description: "Start the bot")]

# Global scope (default)
discard await bot.setMyCommands(commands)

# Per-chat scope
discard await bot.setMyCommands(commands, COMMAND_SCOPE_CHAT, chatId = chatId)

# Per-user scope
discard await bot.setMyCommands(commands, COMMAND_SCOPE_CHAT_MEMBER, chatId = chatId, userId = userId)
```
