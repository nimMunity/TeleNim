# Sticker Management

### `getStickerSet`

```nim
proc getStickerSet*(b: TeleBot, name: string): Future[StickerSet]
```

### `getCustomEmojiStickers`

```nim
proc getCustomEmojiStickers*(b: TeleBot, customEmojiIds: seq[string]): Future[seq[Sticker]]
```

### `getForumTopicIconStickers`

```nim
proc getForumTopicIconStickers*(b: TeleBot): Future[seq[Sticker]]
```

### `uploadStickerFile`

```nim
proc uploadStickerFile*(b: TeleBot, userId: int, sticker: InputFileOrString,
    stickerFormat: string): Future[FileObj]
```

### `createNewStickerSet`

```nim
proc createNewStickerSet*(b: TeleBot, userId: int, name, title: string,
    stickers: seq[InputSticker],
    stickerType = "", needsRepainting = false): Future[bool]
```

### `addStickerToSet`

```nim
proc addStickerToSet*(b: TeleBot, userId: int, name: string,
    sticker: InputSticker): Future[bool]
```

### `setStickerPositionInSet`

```nim
proc setStickerPositionInSet*(b: TeleBot, sticker: string, position: int): Future[bool]
```

### `deleteStickerFromSet`

```nim
proc deleteStickerFromSet*(b: TeleBot, sticker: string): Future[bool]
```

### `replaceStickerInSet`

```nim
proc replaceStickerInSet*(b: TeleBot, userId: int, name: string,
    oldSticker: string, sticker: InputSticker): Future[bool]
```

### `setStickerSetThumbnail`

```nim
proc setStickerSetThumbnail*(b: TeleBot, name: string, userId: int,
    thumbnail: InputFileOrString = "", format = ""): Future[bool]
```

### `setStickerEmojiList`

```nim
proc setStickerEmojiList*(b: TeleBot, sticker: string, emojiList: seq[string]): Future[bool]
```

### `setStickerKeywords`

```nim
proc setStickerKeywords*(b: TeleBot, sticker: string, keywords: seq[string]): Future[bool]
```

### `setStickerMaskPosition`

```nim
proc setStickerMaskPosition*(b: TeleBot, sticker: string,
    maskPosition: MaskPosition = nil): Future[bool]
```

### `setStickerSetTitle`

```nim
proc setStickerSetTitle*(b: TeleBot, name, title: string): Future[bool]
```

### `setCustomEmojiStickerSetThumbnail`

```nim
proc setCustomEmojiStickerSetThumbnail*(b: TeleBot, name: string,
    customEmojiId = ""): Future[bool]
```

### `deleteStickerSet`

```nim
proc deleteStickerSet*(b: TeleBot, name: string): Future[bool]
```
