# Sending Messages

## Text

### `sendMessage`

```nim
proc sendMessage*(b: TeleBot, chatId: ChatId, text: string,
    messageEffectId = 0, businessConnectionId = 0, messageThreadId = 0,
    parseMode = "", entities: seq[MessageEntity] = @[],
    linkPreviewOptions: LinkPreviewOptions = nil,
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    allowPaidBroadcast = false,
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

## Media

### `sendPhoto`

```nim
proc sendPhoto*(b: TeleBot, chatId: ChatId, photo: InputFileOrString,
    caption = "", parseMode = "",
    captionEntities: seq[MessageEntity] = @[],
    showCaptionAboveMedia = false, hasSpoiler = false,
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

### `sendAudio`

```nim
proc sendAudio*(b: TeleBot, chatId: ChatId, audio: InputFileOrString,
    caption = "", parseMode = "",
    captionEntities: seq[MessageEntity] = @[],
    duration = 0, performer = "", title = "",
    thumbnail: InputFileOrString = "",
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

### `sendDocument`

```nim
proc sendDocument*(b: TeleBot, chatId: ChatId, document: InputFileOrString,
    thumbnail: InputFileOrString = "", caption = "",
    disableContentTypeDetection = false, parseMode = "",
    captionEntities: seq[MessageEntity] = @[],
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

### `sendVideo`

```nim
proc sendVideo*(b: TeleBot, chatId: ChatId, video: InputFileOrString,
    duration = 0, width = 0, height = 0,
    thumbnail: InputFileOrString = "",
    cover: InputFileOrString = "", startTimestamp = 0,
    caption = "", parseMode = "",
    captionEntities: seq[MessageEntity] = @[],
    showCaptionAboveMedia = false, hasSpoiler = false,
    supportsStreaming = false,
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

### `sendVoice`

```nim
proc sendVoice*(b: TeleBot, chatId: ChatId, voice: InputFileOrString,
    caption = "", parseMode = "",
    captionEntities: seq[MessageEntity] = @[],
    duration = 0,
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

### `sendVideoNote`

```nim
proc sendVideoNote*(b: TeleBot, chatId: ChatId, videoNote: InputFileOrString,
    duration = 0, length = 0,
    thumbnail: InputFileOrString = "",
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

### `sendAnimation`

```nim
proc sendAnimation*(b: TeleBot, chatId: ChatId, animation: InputFileOrString,
    duration = 0, width = 0, height = 0,
    thumbnail: InputFileOrString = "",
    caption = "", parseMode = "",
    captionEntities: seq[MessageEntity] = @[],
    showCaptionAboveMedia = false, hasSpoiler = false,
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

### `sendSticker`

```nim
proc sendSticker*(b: TeleBot, chatId: ChatId, sticker: InputFileOrString,
    emoji = "",
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

## Locations & Contacts

### `sendLocation`

```nim
proc sendLocation*(b: TeleBot, chatId: ChatId, latitude: float, longitude: float,
    livePeriod = 0, heading = 0, proximityAlertRadius = 0,
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

### `sendVenue`

```nim
proc sendVenue*(b: TeleBot, chatId: ChatId, latitude: float, longitude: float,
    address: string, foursquareId = "", foursquareType = "",
    googlePlaceId = "", googlePlaceType = "",
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

### `sendContact`

```nim
proc sendContact*(b: TeleBot, chatId: ChatId, phoneNumber: string,
    firstName: string, lastName = "", vcard = "",
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

## Polls & Dice

### `sendPoll`

```nim
proc sendPoll*(b: TeleBot, chatId: ChatId, question: string,
    options: seq[InputPollOption],
    questionParseMode = "", questionEntities: seq[MessageEntity] = @[],
    isAnonymous = false, kind = "", allowsMultipleAnswers = false,
    correctOptionId = 0, explanation = "", explanationParseMode = "",
    explanationEntities: seq[MessageEntity] = @[],
    openPeriod = 0, closeDate = 0, isClosed = false,
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

### `sendDice`

```nim
proc sendDice*(b: TeleBot, chatId: ChatId, emoji = "",
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

## Chat Actions

### `sendChatAction`

```nim
proc sendChatAction*(b: TeleBot, chatId: ChatId, action: ChatAction): Future[void]
```

Available actions: `TYPING`, `UPLOAD_PHOTO`, `RECORD_VIDEO`, `UPLOAD_VIDEO`, `RECORD_VOICE`, `UPLOAD_VOICE`, `UPLOAD_DOCUMENT`, `CHOOSE_STICKER`, `FIND_LOCATION`, `RECORD_VIDEO_NOTE`, `UPLOAD_VIDEO_NOTE`.

## Media Groups

### `sendMediaGroup`

```nim
proc sendMediaGroup*(b: TeleBot, chatId: ChatId,
    media: seq[InputMediaSet],
    disableNotification = false,
    replyParameters: ReplyParameters = nil): Future[seq[Message]]
```

## InputMedia Constructors

```nim
proc newInputMediaPhoto*(media: string, caption = "", parseMode = ""): InputMediaPhoto
proc newInputMediaVideo*(media: string, caption = "", parseMode = ""): InputMediaVideo
proc newInputMediaAnimation*(media: string, caption = "", parseMode = ""): InputMediaAnimation
proc newInputMediaAudio*(media: string, caption = "", parseMode = ""): InputMediaAudio
proc newInputMediaDocument*(media: string, caption = "", parseMode = ""): InputMediaDocument
```

## Payments

### `sendInvoice`

```nim
proc sendInvoice*(b: TeleBot, chatId: ChatId,
    title, description, payload, providerToken, currency: string,
    prices: seq[LabeledPrice],
    maxTipAmount = 0, suggestedTipAmounts: seq[int] = @[],
    startParameter = "", providerData = "",
    photoUrl = "", photoSize = 0, photoWidth = 0, photoHeight = 0,
    needName = false, needPhoneNumber = false, needEmail = false,
    needShippingAddress = false,
    sendPhoneNumberToProvider = false, sendEmailToProvider = false,
    isFlexible = false,
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

### `sendPaidMedia`

```nim
proc sendPaidMedia*(b: TeleBot, chatId: ChatId, starCount: int,
    media: seq[InputPaidMedia],
    payload = "", caption = "", parseMode = "",
    captionEntities: seq[MessageEntity] = @[],
    showCaptionAboveMedia = false,
    disableNotification = false, protectContent = false,
    replyParameters: ReplyParameters = nil,
    replyMarkup: KeyboardMarkup = nil): Future[Message]
```

### `sendGift`

```nim
proc sendGift*(b: TeleBot, giftId: int, userId = 0, chatId: ChatId = 0,
    payForUpgrade = false, text = "", textParseMode = "",
    textEntities: seq[MessageEntity] = @[]): Future[bool]
```

### `createInvoiceLink`

```nim
proc createInvoiceLink*(b: TeleBot, title, description, payload, providerToken, currency: string,
    prices: seq[LabeledPrice],
    subscriptionPeriod = 0, maxTipAmount = 0,
    suggestedTipAmounts: seq[int] = @[],
    providerData = "", photoUrl = "", photoSize = 0,
    photoWidth = 0, photoHeight = 0,
    needName = false, needPhoneNumber = false, needEmail = false,
    needShippingAddress = false,
    sendPhoneNumberToProvider = false, sendEmailToProvider = false,
    isFlexible = false): Future[string]
```

### `answerPreCheckoutQuery`

```nim
proc answerPreCheckoutQuery*(b: TeleBot, preCheckoutQueryId: string,
    ok: bool, errorMessage = ""): Future[bool]
```

### Stars

```nim
proc getStarTransactions*(b: TeleBot, offset = 0, limit = 0): Future[StarTransactions]
proc refundStarPayment*(b: TeleBot, userId: int, telegramPaymentChargeId: int): Future[bool]
proc editUserStarSubscription*(b: TeleBot, userId: int, telegramPaymentChargeId: int, isCanceled = true): Future[bool]
```

## Games

### `sendGame`

```nim
proc sendGame*(b: TeleBot, chatId: ChatId, gameShortName: string,
    disableNotification = false, replyParameters: ReplyParameters = nil,
    replyMarkup: InlineKeyboardMarkup): Future[Message]
```

### `setGameScore`

```nim
proc setGameScore*(b: TeleBot, userId: int, score: int,
    force = false, disableEditMessage = false,
    chatId = 0, inlineMessageId = 0): Future[Message]
```

### `getGameHighScores`

```nim
proc getGameHighScores*(b: TeleBot, userId: int,
    chatId = 0, messageId = 0, inlineMessageId = 0): Future[seq[GameHighScore]]
```
