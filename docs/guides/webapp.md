# Telegram Web Apps

Telebot provides Nim bindings for the Telegram Web App JavaScript API. Web Apps let you create rich, interactive experiences inside Telegram chats.

> Web Apps use Nim's JS backend. The client-side code compiles to JavaScript.

## Overview

A Telegram Web App consists of:

1. **Bot-side**: The bot sends a button that opens the Web App
2. **Client-side**: HTML/JS (or Nim JS) that runs inside Telegram's WebView
3. **Communication**: The Web App sends data back to the bot via `sendData()`

## Bot Side — Sending a Web App Button

```nim
import telebot, asyncdispatch

proc handler(bot: TeleBot, cmd: Command): Future[bool] {.async.} =
  let button = newKeyBoardButton("Open WebApp", webApp = WebAppInfo(url: "https://your-app.com"))
  let keyboard = newReplyKeyboardMarkup(@[button])
  discard await bot.sendMessage(cmd.message.chat.id, "Press to open:", replyMarkup = keyboard)
  return true

let bot = newTeleBot(API_KEY)
bot.onCommand("start", handler)
bot.poll()
```

## Client Side — Nim JS Bindings

The `telebot/webapp` module provides typed access to the Telegram WebApp API.

### Accessing the WebApp Object

```nim
import telebot/webapp

# The global Telegram object
var app = Telegram.WebApp
```

### Basic Setup

```nim
import dom, telebot/webapp

# Expand to full height
Telegram.WebApp.expand()

# Ready signal
discard Telegram.WebApp.ready()

# Close the Web App
# Telegram.WebApp.close()
```

### Sending Data to Bot

```nim
# Send data back to the bot
Telegram.WebApp.sendData("user_selection=option_a")
```

### Theme & Appearance

```nim
import telebot/webapp

# Check version
if Telegram.WebApp.isVersionAtLeast("6.1"):
  echo "Supports latest features"

# Colors (set programmatically)
Telegram.WebApp.setHeaderColor("#ffffff")
Telegram.WebApp.setBackgroundColor("#f0f0f0")
Telegram.WebApp.setBottomBarColor("#ffffff")
```

### UI Controls

```nim
# Alerts and popups
Telegram.WebApp.showAlert("Hello!")
Telegram.WebApp.showConfirm("Are you sure?")

# QR Scanner
Telegram.WebApp.showScanQrPopup(ScanQrPopupParams(text: "Scan a QR code"))

# Clipboard
Telegram.WebApp.readTextFromClipboard()

# Haptic feedback
Telegram.WebApp.HapticFeedback.impactOccurred("medium")
Telegram.WebApp.HapticFeedback.notificationOccurred("success")
Telegram.WebApp.HapticFeedback.selectionChanged()
```

### Bottom Button (Main Button)

```nim
import telebot/webapp

let mainButton = Telegram.WebApp.MainButton
mainButton.setText("Submit")
mainButton.show()
mainButton.enable()

mainButton.onClick(proc() =
  Telegram.WebApp.sendData("submitted")
)
```

### Back Button

```nim
let backBtn = Telegram.WebApp.BackButton
backBtn.show()
backBtn.onClick(proc() =
  Telegram.WebApp.close()
)
```

### Cloud Storage

```nim
let storage = Telegram.WebApp.CloudStorage

# Save data
storage.setItem("key", "value", proc() = echo "Saved!")

# Read data
storage.getItem("key", proc() = echo "Got value")

# Get all keys
storage.getKeys(proc() = echo "Keys retrieved")
```

### Biometric Authentication

```nim
let bio = Telegram.WebApp.BiometricManager
bio.init(proc() =
  if bio.isAccessGranted:
    bio.authenticate(BiometricAuthenticateParams(reason: "Verify identity"),
      proc() = echo "Authenticated")
)
```

### Event Handling

```nim
Telegram.WebApp.onEvent("viewportChanged", proc() =
  echo "Viewport changed"
)

Telegram.WebApp.onEvent("themeChanged", proc() =
  echo "Theme changed"
)
```

## WebApp Types

| Type | Description |
|------|-------------|
| `WebApp` | Main WebApp object |
| `BackButton` | Back navigation button |
| `BottomButton` | Main/Secondary button |
| `SettingsButton` | Settings gear button |
| `HapticFeedback` | Haptic vibration control |
| `CloudStorage` | Key-value cloud storage |
| `BiometricManager` | Biometric auth |
| `ThemeParams` | Current theme colors |
| `WebAppInitData` | Init data from bot |
| `WebAppUser` | User info |
| `WebAppChat` | Chat info |

## Receiving Web App Data on Bot Side

When the Web App calls `sendData()`, the bot receives a `WebAppData` message:

```nim
proc updateHandler(bot: TeleBot, update: Update): Future[bool] {.async.} =
  if not update.message.isNil and not update.message.webAppData.isNil:
    let data = update.message.webAppData.data
    echo "Received from WebApp: ", data
    discard await bot.sendMessage(update.message.chat.id, "Got: " & data)
  return true
```

## Answering Web App Queries

```nim
# For inline-mode Web Apps
discard await bot.answerWebAppQuery(webAppQueryId, result)
```
