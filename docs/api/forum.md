# Forum Topics

### `createForumTopic`

```nim
proc createForumTopic*(b: TeleBot, chatId: ChatId, name: string,
    iconColor = 0, iconCustomEmojiId = ""): Future[ForumTopic]
```

### `editForumTopic`

```nim
proc editForumTopic*(b: TeleBot, chatId: ChatId, messageThreadId: int,
    name = "", iconCustomEmojiId = ""): Future[bool]
```

### `closeForumTopic` / `reopenForumTopic`

```nim
proc closeForumTopic*(b: TeleBot, chatId: ChatId, messageThreadId: int): Future[bool]
proc reopenForumTopic*(b: TeleBot, chatId: ChatId, messageThreadId: int): Future[bool]
```

### `deleteForumTopic`

```nim
proc deleteForumTopic*(b: TeleBot, chatId: ChatId, messageThreadId: int): Future[bool]
```

### `unpinAllForumTopicMessages`

```nim
proc unpinAllForumTopicMessages*(b: TeleBot, chatId: ChatId, messageThreadId: int): Future[bool]
```

### General Forum Topic

```nim
proc editGeneralForumTopic*(b: TeleBot, chatId: ChatId, name: string): Future[bool]
proc closeGeneralForumTopic*(b: TeleBot, chatId: ChatId): Future[bool]
proc reopenGeneralForumTopic*(b: TeleBot, chatId: ChatId): Future[bool]
proc hideGeneralForumTopic*(b: TeleBot, chatId: ChatId): Future[bool]
proc unhideGeneralForumTopic*(b: TeleBot, chatId: ChatId): Future[bool]
proc unpinAllGeneralForumTopicMessages*(b: TeleBot, chatId: ChatId): Future[bool]
```
