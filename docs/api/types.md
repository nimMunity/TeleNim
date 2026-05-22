# Types Reference

All types are exported from `telebot/private/types` via `telebot`.

## Core Types

### `TeleBot`

```nim
TeleBot* = ref object of TelegramObject
```

The main bot instance. Created via `newTeleBot()`.

### `ChatId`

```nim
ChatId* = int64 | string
```

Chat identifier — can be numeric ID or `@channelusername`.

### `InputFileOrString`

```nim
InputFileOrString* = string
```

Accepts: URL, `"file:///path"`, or Telegram file ID.

### `ChatAction`

```nim
ChatAction* = enum
  TYPING, UPLOAD_PHOTO, RECORD_VIDEO, UPLOAD_VIDEO,
  RECORD_VOICE, UPLOAD_VOICE, UPLOAD_DOCUMENT,
  CHOOSE_STICKER, FIND_LOCATION, RECORD_VIDEO_NOTE,
  UPLOAD_VIDEO_NOTE
```

## Update Types

### `Update`

```nim
Update* = object of TelegramObject
  updateId*: int
  message*: Message
  editedMessage*: Message
  channelPost*: Message
  editedChannelPost*: Message
  inlineQuery*: InlineQuery
  chosenInlineResult*: ChosenInlineResult
  callbackQuery*: CallbackQuery
  shippingQuery*: ShippingQuery
  preCheckoutQuery*: PreCheckoutQuery
  poll*: Poll
  pollAnswer*: PollAnswer
  myChatMember*: ChatMemberUpdated
  chatMember*: ChatMemberUpdated
  chatJoinRequest*: ChatJoinRequest
  messageReaction*: MessageReactionUpdated
  messageReactionCount*: MessageReactionCountUpdated
  chatBoost*: ChatBoostUpdated
  removedChatBoost*: ChatBoostRemoved
  businessConnection*: BusinessConnection
  businessMessage*: Message
  editedBusinessMessage*: Message
  deletedBusinessMessages*: BusinessMessagesDeleted
  purchasedPaidMedia*: PaidMediaPurchased
```

### `Command`

```nim
Command* = object
  message*: Message
  command*: string
  params*: string
```

## Message Types

### `Message`

Key fields (partial list):

```nim
Message* = object of TelegramObject
  messageId*: int
  messageThreadId*: int
  from*: User
  date*: int
  chat*: Chat
  text*: string
  entities*: seq[MessageEntity]
  captionEntities*: seq[MessageEntity]
  photo*: seq[PhotoSize]
  sticker*: Sticker
  video*: Video
  voice*: Voice
  audio*: Audio
  document*: Document
  animation*: Animation
  contact*: Contact
  location*: Location
  venue*: Venue
  poll*: Poll
  dice*: Dice
  replyToMessage*: Message
  viaBot*: User
  editDate*: int
  webAppData*: WebAppData
  replyMarkup*: InlineKeyboardMarkup
```

### `MessageEntity`

```nim
MessageEntity* = object of TelegramObject
  kind*: string        # "mention", "hashtag", "bot_command", etc.
  offset*: int
  length*: int
  url*: string
  user*: User
  language*: string
```

## Chat Types

### `Chat`

```nim
Chat* = object of TelegramObject
  id*: int64
  kind*: string       # "private", "group", "supergroup", "channel"
  title*: string
  username*: string
  firstName*: string
  lastName*: string
```

### `ChatFullInfo`

Extended chat information with all settings.

### `User`

```nim
User* = object of TelegramObject
  id*: int
  isBot*: bool
  firstName*: string
  lastName*: string
  username*: string
  languageCode*: string
  isPremium*: bool
  addedToAttachmentMenu*: bool
```

### `ChatMember`

Represents a chat member with their status and permissions.

### `ChatPermissions`

```nim
ChatPermissions* = object of TelegramObject
  canSendMessages*: bool
  canSendAudios*: bool
  canSendDocuments*: bool
  canSendPhotos*: bool
  canSendVideos*: bool
  canSendVideoNotes*: bool
  canSendVoiceNotes*: bool
  canSendPolls*: bool
  canSendOtherMessages*: bool
  canAddWebPagePreviews*: bool
  canChangeInfo*: bool
  canInviteUsers*: bool
  canPinMessages*: bool
  canManageTopics*: bool
```

### `ChatInviteLink`

```nim
ChatInviteLink* = object of TelegramObject
  inviteLink*: string
  creator*: User
  createsJoinRequest*: bool
  isPrimary*: bool
  isRevoked*: bool
  name*: string
  expireDate*: int
  memberLimit*: int
  pendingJoinRequestCount*: int
```

## Media Types

### `PhotoSize`, `Video`, `Audio`, `Voice`, `Document`, `Animation`, `Sticker`

All contain common fields: `fileId`, `fileUniqueId`, `fileSize`, plus type-specific fields.

### `InputMediaPhoto`, `InputMediaVideo`, etc.

Used with `sendMediaGroup` and `editMessageMedia`. Created via `newInputMedia*` constructors.

### `InputPaidMedia`

For `sendPaidMedia` — includes `InputPaidMediaPhoto`, `InputPaidMediaVideo`.

## Keyboard Types

### `KeyboardButton`

```nim
KeyboardButton* = object of TelegramObject
  text*: string
  requestContact*: bool
  requestLocation*: bool
  requestChat*: KeyboardButtonRequestChat
  requestPoll*: KeyboardButtonPollType
  webApp*: WebAppInfo
```

### `InlineKeyboardButton`

```nim
InlineKeyboardButton* = object of TelegramObject
  text*: string
  url*: string
  callbackData*: string
  webApp*: WebAppInfo
  loginUrl*: LoginUrl
  switchInlineQuery*: string
  switchInlineQueryCurrentChat*: string
  pay*: bool
```

### `ReplyKeyboardMarkup`, `InlineKeyboardMarkup`, `ForceReply`, `ReplyKeyboardRemove`

Markup types accepted by `replyMarkup` parameter.

## Payment Types

### `LabeledPrice`

```nim
LabeledPrice* = object of TelegramObject
  label*: string
  amount*: int
```

### `Invoice`, `SuccessfulPayment`, `PreCheckoutQuery`, `ShippingQuery`

Payment flow types.

### `StarTransaction`, `StarTransactions`

Telegram Stars transaction types.

## Reaction Types

### `ReactionType`

Use helpers to create:

```nim
func ReactionTypeEmoji*(emoji: string): ReactionType
func ReactionTypeCustomEmoji*(emoji: string): ReactionType
```

## Inline Types

### `InlineQuery`

```nim
InlineQuery* = object of TelegramObject
  id*: string
  from*: User
  query*: string
  offset*: string
  chatType*: string
  location*: Location
```

### `InlineQueryResultArticle`

```nim
InlineQueryResultArticle* = object of TelegramInlineQueryResult
  title*: string
  inputMessageContent*: InputMessageContent
  url*: string
  description*: string
  thumbnailUrl*: string
  thumbnailWidth*: int
  thumbnailHeight*: int
```

### `CallbackQuery`

```nim
CallbackQuery* = object of TelegramObject
  id*: string
  from*: User
  message*: Message
  inlineMessageId*: string
  chatInstance*: string
  data*: string
  gameShortName*: string
```

## Other Types

### `ForumTopic`

```nim
ForumTopic* = object of TelegramObject
  messageThreadId*: int
  name*: string
  iconColor*: int
  iconCustomEmojiId*: string
```

### `FileObj`

```nim
FileObj* = object of TelegramObject
  fileId*: string
  fileUniqueId*: string
  fileSize*: int
  filePath*: string
```

### `ReplyParameters`

```nim
ReplyParameters* = object of TelegramObject
  messageId*: int
  chatId*: ChatId
  allowSendingWithoutReply*: bool
  quote*: string
```

### `LinkPreviewOptions`

```nim
LinkPreviewOptions* = object of TelegramObject
  isDisabled*: bool
  url*: string
  preferSmallMedia*: bool
  preferLargeMedia*: bool
  showAboveText*: bool
```

### `BotCommand`

```nim
BotCommand* = object of TelegramObject
  command*: string
  description*: string
```

## Command Scope Constants

```nim
COMMAND_SCOPE_DEFAULT* = "default"
COMMAND_SCOPE_ALL_PRIVATE_CHATS* = "all_private_chats"
COMMAND_SCOPE_ALL_GROUP_CHATS* = "all_group_chats"
COMMAND_SCOPE_ALL_CHAT_ADMINISTRATORS* = "all_chat_administrators"
COMMAND_SCOPE_CHAT* = "chat"
COMMAND_SCOPE_CHAT_ADMINISTRATORS* = "chat_administrators"
COMMAND_SCOPE_CHAT_MEMBER* = "chat_member"
```
