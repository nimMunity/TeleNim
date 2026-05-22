# Chat Management

## Members & Permissions

### `banChatMember`

```nim
proc banChatMember*(b: TeleBot, chatId: ChatId, userId: int,
    untilDate = 0, revokeMessages = false): Future[bool]
```

### `unbanChatMember`

```nim
proc unbanChatMember*(b: TeleBot, chatId: ChatId, userId: int,
    onlyIfBanned = false): Future[bool]
```

### `restrictChatMember`

```nim
proc restrictChatMember*(b: TeleBot, chatId: ChatId, userId: int,
    permissions: ChatPermissions,
    useIndependentChatPermissions = false, untilDate = 0): Future[bool]
```

### `promoteChatMember`

```nim
proc promoteChatMember*(b: TeleBot, chatId: ChatId, userId: int,
    isAnonymous = false, canManageChat = false, canChangeInfo = false,
    canPostMessages = false, canEditMessages = false, canDeleteMessages = false,
    canPostStories = false, canEditStories = false, canDeleteStories = false,
    canManageVideoChats = false, canInviteUsers = false,
    canRestrictMembers = false, canPinMessages = false,
    canPromoteMembers = false, canManageTopics = false): Future[bool]
```

### `setChatPermissions`

```nim
proc setChatPermissions*(b: TeleBot, chatId: ChatId,
    permissions: ChatPermissions,
    useIndependentChatPermissions = false): Future[bool]
```

### `setChatAdministratorCustomTitle`

```nim
proc setChatAdministratorCustomTitle*(b: TeleBot, chatId: ChatId,
    userId: int, customTitle: string): Future[bool]
```

### `banChatSenderChat` / `unbanChatSenderChat`

```nim
proc banChatSenderChat*(b: TeleBot, chatId: ChatId, senderChatId: int, untilDate = 0): Future[bool]
proc unbanChatSenderChat*(b: TeleBot, chatId: ChatId, senderChatId: int): Future[bool]
```

## Chat Settings

### `getChat`

```nim
proc getChat*(b: TeleBot, chatId: ChatId): Future[ChatFullInfo]
```

### `getChatAdministrators`

```nim
proc getChatAdministrators*(b: TeleBot, chatId: ChatId): Future[seq[ChatMember]]
```

### `getChatMemberCount`

```nim
proc getChatMemberCount*(b: TeleBot, chatId: ChatId): Future[int]
```

### `getChatMember`

```nim
proc getChatMember*(b: TeleBot, chatId: ChatId, userId: int): Future[ChatMember]
```

### `setChatTitle` / `setChatDescription`

```nim
proc setChatTitle*(b: TeleBot, chatId: ChatId, title: string): Future[bool]
proc setChatDescription*(b: TeleBot, chatId: ChatId, description = ""): Future[bool]
```

### `setChatPhoto` / `deleteChatPhoto`

```nim
proc setChatPhoto*(b: TeleBot, chatId: ChatId, photo: string): Future[bool]
proc deleteChatPhoto*(b: TeleBot, chatId: ChatId): Future[bool]
```

### `pinChatMessage` / `unpinChatMessage` / `unpinAllChatMessages`

```nim
proc pinChatMessage*(b: TeleBot, chatId: ChatId, messageId: int,
    disableNotification = false): Future[bool]
proc unpinChatMessage*(b: TeleBot, chatId: ChatId, messageId = 0): Future[bool]
proc unpinAllChatMessages*(b: TeleBot, chatId: ChatId): Future[bool]
```

### `leaveChat`

```nim
proc leaveChat*(b: TeleBot, chatId: ChatId): Future[bool]
```

### `exportChatInviteLink`

```nim
proc exportChatInviteLink*(b: TeleBot, chatId: ChatId): Future[string]
```

### Sticker Sets

```nim
proc setChatStickerSet*(b: TeleBot, chatId: ChatId, stickerSetname: string): Future[bool]
proc deleteChatStickerSet*(b: TeleBot, chatId: ChatId): Future[bool]
```

## Invite Links

### `createChatInviteLink`

```nim
proc createChatInviteLink*(b: Telebot, chatId: ChatId, name = "",
    expireDate = 0, memberLimit = 0,
    createsJoinRequest = false): Future[ChatInviteLink]
```

### `editChatInviteLink`

```nim
proc editChatInviteLink*(b: Telebot, chatId: ChatId, inviteLink: string,
    name = "", expireDate = 0, memberLimit = 0,
    createsJoinRequest = false): Future[ChatInviteLink]
```

### `createChatSubscriptionInviteLink`

```nim
proc createChatSubscriptionInviteLink*(b: Telebot, chatId: ChatId,
    subscriptionPeriod: int, subscriptionPrice: int,
    name = ""): Future[ChatInviteLink]
```

### `revokeChatInviteLink`

```nim
proc revokeChatInviteLink*(b: Telebot, chatId: ChatId,
    inviteLink: string): Future[ChatInviteLink]
```

### `approveChatJoinRequest` / `declineChatJoinRequest`

```nim
proc approveChatJoinRequest*(b: Telebot, chatId: ChatId, userId: int): Future[bool]
proc declineChatJoinRequest*(b: Telebot, chatId: ChatId, userId: int): Future[bool]
```

## User Queries

### `getUserProfilePhotos`

```nim
proc getUserProfilePhotos*(b: TeleBot, userId: int,
    offset = 0, limit = 100): Future[UserProfilePhotos]
```

### `getFile`

```nim
proc getFile*(b: TeleBot, fileId: string): Future[FileObj]
```

### `setUserEmojiStatus`

```nim
proc setUserEmojiStatus*(b: TeleBot, userId: int,
    emojiStatusCustomEmojiId = "",
    emojiStatusExpirationDate = 0): Future[bool]
```

### `getUserChatBoosts`

```nim
proc getUserChatBoosts*(b: TeleBot, chatId: ChatId, userId: int): Future[UserChatBoosts]
```

### `getBusinessConnection`

```nim
proc getBusinessConnection*(b: TeleBot, businessConnectionId: string): Future[BusinessConnection]
```
