# Sending Media

Telebot supports sending all Telegram media types: text, photos, audio, video, documents, stickers, locations, contacts, polls, and media groups.

## Text Messages

```nim
discard await bot.sendMessage(chatId, "Hello World!")

# With Markdown formatting
discard await bot.sendMessage(chatId, "*Bold* and _italic_", parseMode = "markdown")

# Reply to a message
discard await bot.sendMessage(chatId, "Reply!", replyParameters = ReplyParameters(messageId: msgId))

# Silent message
discard await bot.sendMessage(chatId, "Shh...", disableNotification = true)
```

### `sendMessage` Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `chatId` | `ChatId` | *required* | Target chat |
| `text` | `string` | *required* | Message text (max 4096 chars) |
| `parseMode` | `string` | `""` | `markdown` or `html` |
| `entities` | `seq[MessageEntity]` | `@[]` | Message entities |
| `linkPreviewOptions` | `LinkPreviewOptions` | `nil` | Link preview settings |
| `disableNotification` | `bool` | `false` | Send silently |
| `protectContent` | `bool` | `false` | Prevent forwarding |
| `replyParameters` | `ReplyParameters` | `nil` | Reply to message |
| `replyMarkup` | `KeyboardMarkup` | `nil` | Keyboard markup |

## Photos

```nim
# From URL
discard await bot.sendPhoto(chatId, "https://example.com/photo.jpg", caption = "A photo")

# From local file
discard await bot.sendPhoto(chatId, "file://" & getAppDir() & "/photo.jpg")
```

## Audio

```nim
discard await bot.sendAudio(chatId, "file://" & path,
  caption = "My song",
  duration = 180,
  performer = "Artist",
  title = "Song Title"
)
```

## Video

```nim
discard await bot.sendVideo(chatId, "file://" & path,
  caption = "My video",
  duration = 60,
  width = 1920,
  height = 1080,
  supportsStreaming = true
)
```

## Documents

```nim
discard await bot.sendDocument(chatId, "file://" & path, caption = "Here's the file")
```

## Stickers

```nim
discard await bot.sendSticker(chatId, stickerFileId)
```

## Animations (GIFs)

```nim
discard await bot.sendAnimation(chatId, "https://example.com/animation.gif", caption = "Funny!")
```

## Voice Messages

```nim
discard await bot.sendVoice(chatId, "file://" & path, caption = "Voice note")
```

## Video Notes (Circular Videos)

```nim
discard await bot.sendVideoNote(chatId, "file://" & path, length = 240)
```

## Locations

```nim
# Static location
discard await bot.sendLocation(chatId, latitude = 40.7128, longitude = -74.0060)

# Live location (with heading and accuracy)
discard await bot.sendLocation(chatId, lat, lon, livePeriod = 3600, heading = 90)
```

## Venues

```nim
discard await bot.sendVenue(chatId,
  latitude = 40.7128, longitude = -74.0060,
  address = "Central Park",
  foursquareId = "412d2800f964a520df0c1fe3"
)
```

## Contacts

```nim
discard await bot.sendContact(chatId, phoneNumber = "+1234567890", firstName = "John")
```

## Polls

```nim
let options = @[
  InputPollOption(text: "Option A"),
  InputPollOption(text: "Option B")
]
discard await bot.sendPoll(chatId, "What do you prefer?", options, isAnonymous = false)
```

## Dice

```nim
# Default dice (1-6)
discard await bot.sendDice(chatId)

# Dart
discard await bot.sendDice(chatId, emoji = "🎯")

# Basketball
discard await bot.sendDice(chatId, emoji = "🏀")
```

## Chat Actions

Show a "typing..." or "uploading..." indicator:

```nim
discard await bot.sendChatAction(chatId, TYPING)
discard await bot.sendChatAction(chatId, UPLOAD_PHOTO)
```

## Media Groups

Send multiple photos or videos as an album:

```nim
let media = @[
  newInputMediaPhoto("https://example.com/photo1.jpg", caption = "Photo 1"),
  newInputMediaPhoto("https://example.com/photo2.jpg"),
  newInputMediaPhoto("https://example.com/photo3.jpg")
]
discard await bot.sendMediaGroup(chatId, media)
```

### Available InputMedia constructors

- `newInputMediaPhoto(media, caption, parseMode)`
- `newInputMediaVideo(media, caption, parseMode)`
- `newInputMediaAnimation(media, caption, parseMode)`
- `newInputMediaAudio(media, caption, parseMode)`
- `newInputMediaDocument(media, caption, parseMode)`

## Editing Messages

```nim
# Edit text
discard await bot.editMessageText("Updated text", chatId = chatId, messageId = msgId)

# Edit caption
discard await bot.editMessageCaption(caption = "New caption", chatId = chatId, messageId = msgId)

# Edit keyboard
discard await bot.editMessageReplyMarkup(chatId = chatId, messageId = msgId, replyMarkup = newKeyboard)

# Edit live location
discard await bot.editMessageLiveLocation(lat, lon, chatId = chatId, messageId = msgId)

# Stop live location
discard await bot.stopMessageLiveLocation(chatId = chatId, messageId = msgId)
```

## Deleting Messages

```nim
# Delete one message
discard await bot.deleteMessage(chatId, messageId)

# Delete multiple messages
discard await bot.deleteMessages(chatId, @[msgId1, msgId2, msgId3])
```

## Forwarding & Copying

```nim
# Forward (preserves original sender)
discard await bot.forwardMessage(toChatId, fromChatId, messageId)

# Copy (sends as new message)
discard await bot.copyMessage(toChatId, fromChatId, messageId, caption = "My caption")
```

## Reactions

```nim
# Set emoji reaction
discard await bot.setMessageReaction(chatId, messageId, @[ReactionTypeEmoji("👍")], isBig = false)
```

## InputFileOrString

Most media parameters accept `InputFileOrString`:

- **URL**: `"https://example.com/file.jpg"` — Telegram downloads from URL
- **Local file**: `"file:///path/to/file.jpg"` — Uploaded as multipart
- **File ID**: `"AgACAgIAAxkBAAI..."` — Reference to previously uploaded file
