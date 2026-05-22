# Message Management

## Editing

### `editMessageText`

```nim
proc editMessageText*(b: TeleBot, text: string,
    chatId: ChatId = DefaultChatId, messageId = 0, inlineMessageId = "",
    parseMode = "", entities: seq[MessageEntity] = @[],
    replyMarkup: KeyboardMarkup = nil,
    linkPreviewOptions: LinkPreviewOptions = nil): Future[Message]
```

### `editMessageCaption`

```nim
proc editMessageCaption*(b: TeleBot, caption = "",
    chatId = "", messageId = 0, inlineMessageId = "",
    parseMode = "", showCaptionAboveMedia = false,
    captionEntities: seq[MessageEntity] = @[],
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

### `editMessageMedia`

```nim
proc editMessageMedia*(b: TeleBot, media: InputMediaSet,
    chatId = "", messageId = 0, inlineMessageId = "",
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

### `editMessageReplyMarkup`

```nim
proc editMessageReplyMarkup*(b: TeleBot,
    chatId = "", messageId = 0, inlineMessageId = "",
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

### `editMessageLiveLocation`

```nim
proc editMessageLiveLocation*(b: TeleBot, latitude: float, longitude: float,
    chatId = "", messageId = 0, inlineMessageId = "",
    livePeriod = 0, horizontalAccuracy = 0.0,
    heading = 0, proximityAlertRadius = 0,
    replyMarkup: KeyboardMarkup = nil): Future[bool]
```

### `stopMessageLiveLocation`

```nim
proc stopMessageLiveLocation*(b: TeleBot,
    chatId = "", messageId = 0, inlineMessageId = "",
    replyMarkup: KeyboardMarkup = nil): Future[bool]
```

## Deleting

### `deleteMessage`

```nim
proc deleteMessage*(b: TeleBot, chatId: ChatId, messageId: int): Future[bool]
```

### `deleteMessages`

```nim
proc deleteMessages*(b: TeleBot, chatId: ChatId, messageIds: seq[int]): Future[bool]
```

## Forwarding & Copying

### `forwardMessage`

```nim
proc forwardMessage*(b: TeleBot, chatId, fromChatId: string, messageId: int,
    disableNotification = false, protectContent = false): Future[Message]
```

### `forwardMessages`

```nim
proc forwardMessages*(b: TeleBot, chatId, fromChatId: string, messageIds: seq[int],
    disableNotification = false, protectContent = false): Future[Message]
```

### `copyMessage`

```nim
proc copyMessage*(b: TeleBot, chatId, fromChatId: string, messageId: int,
    caption = "", parseMode = "",
    captionEntities: seq[MessageEntity] = @[],
    showCaptionAboveMedia = false,
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[MessageId]
```

### `copyMessages`

```nim
proc copyMessages*(b: TeleBot, chatId, fromChatId: string, messageIds: seq[int],
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[MessageId]
```

## Reactions

### `setMessageReaction`

```nim
proc setMessageReaction*(b: TeleBot, chatId: ChatId, messageId: int,
    reaction: seq[ReactionType] = @[], isBig = false): Future[bool]
```

**Reaction helpers:**

```nim
func ReactionTypeEmoji*(emoji: string): ReactionType
func ReactionTypeCustomEmoji*(emoji: string): ReactionType
```
