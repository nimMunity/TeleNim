# Bot Setup & Configuration

## Constructor

### `newTeleBot`

```nim
proc newTeleBot*(token: string, serverUrl = "https://api.telegram.org"): TeleBot
```

Creates a new TeleBot instance.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `token` | `string` | *required* | Telegram Bot API token |
| `serverUrl` | `string` | `"https://api.telegram.org"` | API server URL (use for local API server) |

**Example:**

```nim
let bot = newTeleBot("YOUR_TOKEN")

# With local API server
let bot = newTeleBot("YOUR_TOKEN", "http://127.0.0.1:8081")
```

## Proxy

### `setProxy`

```nim
proc setProxy*(b: TeleBot, url: string, auth = "") {.inline.}
```

Configure HTTP proxy for all API requests.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `url` | `string` | *required* | Proxy URL |
| `auth` | `string` | `""` | Authentication string |

## Bot Info

### `getMe`

```nim
proc getMe*(b: TeleBot): Future[User]
```

Returns basic information about the bot.

### `logOut`

```nim
proc logOut*(b: TeleBot): Future[bool]
```

Log out from the cloud Bot API server. Useful for switching between local and cloud servers.

### `close`

```nim
proc close*(b: TeleBot): Future[bool]
```

Close the bot instance from the cloud Bot API server.

## Event Handlers

### `onUpdate`

```nim
proc onUpdate*(b: TeleBot, cb: UpdateCallback)
```

Register a callback for all incoming updates.

**Callback signature:**

```nim
proc handler(bot: TeleBot, update: Update): Future[bool] {.gcsafe, async.}
```

### `onCommand`

```nim
proc onCommand*(b: TeleBot, command: string, cb: CommandCallback)
```

Register a callback for a specific bot command (without leading `/`).

**Callback signature:**

```nim
proc handler(bot: TeleBot, cmd: Command): Future[bool] {.gcsafe, async.}
```

### `onUnknownCommand`

```nim
proc onUnknownCommand*(b: TeleBot, cb: CatchallCommandCallback)
```

Register a catch-all callback for commands without a specific handler.

### `onInlineQuery`

```nim
proc onInlineQuery*(b: TeleBot, cb: InlineQueryCallback)
```

Register a callback for inline queries.

**Callback signature:**

```nim
proc handler(bot: TeleBot, inlineQuery: InlineQuery): Future[bool] {.gcsafe, async.}
```
