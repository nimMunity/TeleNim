# Keyboard Builders

## Reply Keyboards

### `newKeyBoardButton`

```nim
proc newKeyBoardButton*(text: string,
    requestChat: KeyboardButtonRequestChat = nil,
    requestContact = false, requestLocation = false,
    requestPoll: KeyboardButtonPollType = nil,
    webApp: WebAppInfo = nil): KeyboardButton
```

### `newReplyKeyboardMarkup`

```nim
proc newReplyKeyboardMarkup*(keyboards: varargs[seq[KeyboardButton]],
    isPersistent = false, resizeKeyboard = false,
    oneTimeKeyboard = false, inputFieldPlaceholder = "",
    selective = false): ReplyKeyboardMarkup
```

### `newReplyKeyboardRemove`

```nim
proc newReplyKeyboardRemove*(selective = false): ReplyKeyboardRemove
```

## Inline Keyboards

### `newInlineKeyBoardButton`

```nim
proc newInlineKeyBoardButton*(text: string, url = "",
    loginUrl: LoginUrl = nil, callbackData = "",
    webApp: WebAppInfo = nil, switchInlineQuery = "",
    switchInlineQueryCurrentChat = "",
    callbackGame: CallbackGame = nil, pay = false): InlineKeyboardButton
```

### `newInlineKeyboardMarkup`

```nim
proc newInlineKeyboardMarkup*(keyboards: varargs[seq[InlineKeyBoardButton]]): InlineKeyboardMarkup
```

## Special Markups

### `newForceReply`

```nim
proc newForceReply*(selective = false, inputFieldPlaceholder = ""): ForceReply
```

### `newLoginUrl`

```nim
proc newLoginUrl*(url: string, forwardText = "", botUsername = "",
    requestWriteAccess = false): LoginUrl
```

## Common `replyMarkup` Parameters

All `sendMessage`, `sendPhoto`, etc. methods accept a `replyMarkup` parameter:

| Type | Usage |
|------|-------|
| `ReplyKeyboardMarkup` | Shows persistent keyboard below input |
| `InlineKeyboardMarkup` | Shows buttons below message |
| `ReplyKeyboardRemove` | Removes the reply keyboard |
| `ForceReply` | Forces user to reply |
