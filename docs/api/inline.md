# Inline Queries & Callbacks

## Inline Queries

### `answerInlineQuery`

```nim
proc answerInlineQuery*[T: InlineQueryResult](b: TeleBot, inlineQueryId: string,
    results: seq[T], cacheTime = 0, isPersonal = false,
    nextOffset = "", button: InlineQueryResultsButton = nil): Future[bool]
```

### InlineQueryResult Types

Results are typed as `InlineQueryResultArticle` and similar types from `types.nim`.

### InputMessageContent Helpers

```nim
func InputTextMessageContent*(messageText: string): InputMessageContent
func InputLocationMessageContent*(latitude, longitude: float): InputMessageContent
func InputVenueMessageContent*(latitude, longitude: float, title, address: string): InputMessageContent
func InputContactMessageContent*(phoneNumber, firstName: string): InputMessageContent
func InputInvoiceMessageContent*(title, description, payload, providerToken, currency: string,
    prices: seq[LabeledPrice]): InputMessageContent
```

## Callback Queries

### `answerCallbackQuery`

```nim
proc answerCallbackQuery*(b: TeleBot, callbackQueryId: string,
    text = "", showAlert = false, url = "", cacheTime = 0): Future[bool]
```

## Polls

### `stopPoll`

```nim
proc stopPoll*(b: TeleBot, chatId = "", messageId = 0,
    inlineMessageId = "", replyMarkup: KeyboardMarkup = nil): Future[Poll]
```

## Bot Commands

### `setMyCommands`

```nim
proc setMyCommands*(b: TeleBot, commands: seq[BotCommand],
    scope = COMMAND_SCOPE_DEFAULT, chatId = "", userId = 0,
    languageCode = ""): Future[bool]
```

### `getMyCommands`

```nim
proc getMyCommands*(b: TeleBot, scope = COMMAND_SCOPE_DEFAULT,
    chatId = "", userId = 0, languageCode = ""): Future[seq[BotCommand]]
```

### `deleteMyCommands`

```nim
proc deleteMyCommands*(b: TeleBot, scope = COMMAND_SCOPE_DEFAULT,
    chatId = "", userId = 0, languageCode = ""): Future[bool]
```

### `setMyName` / `getMyName`

```nim
proc setMyName*(b: TeleBot, name = "", languageCode = ""): Future[bool]
proc getMyName*(b: TeleBot, languageCode = ""): Future[BotName]
```

### `setMyDescription` / `getMyDescription`

```nim
proc setMyDescription*(b: TeleBot, description = "", languageCode = ""): Future[bool]
proc getMyDescription*(b: TeleBot, languageCode = ""): Future[BotDescription]
```

### `setMyShortDescription` / `getMyShortDescription`

```nim
proc setMyShortDescription*(b: TeleBot, shortDescription = "", languageCode = ""): Future[bool]
proc getMyShortDescription*(b: TeleBot, languageCode = ""): Future[BotShortDescription]
```

## Web App Queries

### `answerWebAppQuery`

```nim
proc answerWebAppQuery*(b: Telebot, webAppQueryId: string,
    res: InlineQueryResult): Future[SentWebAppMessage]
```

### `savePreparedInlineMessage`

```nim
proc savePreparedInlineMessage*(b: TeleBot, userId: int, res: InlineQueryResult,
    allowUserChats = false, allowBotChats = false,
    allowGroupChats = false, allowChannelChats = false): Future[PreparedInlineMessage]
```

### Menu Button & Rights

```nim
proc setChatMenuButon*(b: TeleBot, chatId: ChatId, menuButton: MenuButton): Future[bool]
proc getChatMenuButon*(b: TeleBot, chatId: ChatId): Future[MenuButton]
proc setMyDefaultAdministratorRights*(b: TeleBot, rights: ChatAdministratorRights, forChannels = false): Future[bool]
proc getMyDefaultAdministratorRights*(b: TeleBot, forChannels = false): Future[ChatAdministratorRights]
```

## Verification

```nim
proc verifyUser*(b: TeleBot, userId: int, customDescription = ""): Future[bool]
proc verifyChat*(b: TeleBot, userId: int, customDescription = ""): Future[bool]
proc removeUserVerification*(b: TeleBot, userId: int): Future[bool]
proc removeChatVerification*(b: TeleBot, chatId: ChatId): Future[bool]
```

## Gifts

```nim
proc getAvailableGifts*(b: TeleBot): Future[Gifts]
```
