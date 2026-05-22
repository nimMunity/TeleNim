# Polling & Webhooks

Telebot supports two modes for receiving updates from Telegram: long polling and webhooks.

## Long Polling

Long polling is the simplest approach. The bot repeatedly calls `getUpdates` to fetch new updates.

```nim
let bot = newTeleBot(API_KEY)
bot.onUpdate(handler)
bot.poll(timeout = 300)
```

### `poll` Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `timeout` | `int` | `50` | Timeout in seconds for long polling |
| `offset` | `int` | `0` | Update offset to start from |
| `limit` | `int` | `0` | Max updates per request (1-100) |
| `clean` | `bool` | `false` | Discard pending updates before starting |

### Async Polling

For integration into existing async event loops:

```nim
await bot.pollAsync(timeout = 300)
```

### Cleaning Updates

Discard all pending updates without processing:

```nim
await bot.cleanUpdates()
```

## Webhooks

Webhooks let Telegram push updates to your server. Recommended for production.

### Setup

```nim
await bot.setWebhook(
  url = "https://your-domain.com/webhook",
  certificate = "path/to/cert.pem",
  secretToken = "your-secret"
)
```

### `setWebhook` Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `url` | `string` | *required* | HTTPS URL for receiving updates |
| `certificate` | `string` | `""` | Path to public key certificate |
| `ipAddress` | `string` | `""` | Fixed IP address to use |
| `maxConnections` | `int` | `-1` | Max simultaneous connections (1-100) |
| `allowedUpdates` | `seq[string]` | `@[]` | Update types to receive |
| `dropPendingUpdates` | `bool` | `false` | Drop unprocessed updates |
| `secretToken` | `string` | `""` | Secret for validation |

### Simple Webhook Server

```nim
import telebot, asyncdispatch, strutils

const
  API_KEY = "YOUR_BOT_TOKEN"
  SECRET = "your-webhook-secret"
  URL = "https://your-domain.com/webhook"

proc handler(bot: TeleBot, update: Update): Future[bool] {.gcsafe, async.} =
  if not update.message.isNil:
    discard await bot.sendMessage(update.message.chat.id, "Got it!")
  return true

let bot = newTeleBot(API_KEY)
bot.onUpdate(handler)
bot.startWebhook(SECRET, URL)
```

### `startWebhook` Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `secret` | `string` | *required* | Webhook secret token |
| `url` | `string` | *required* | Public webhook URL |
| `port` | `Port` | `8080` | Port to listen on |
| `dropPendingUpdates` | `bool` | `false` | Drop pending updates |

### Managing Webhooks

```nim
# Get current webhook info
let info = await bot.getWebhookInfo()
echo info.url, info.pendingUpdateCount

# Delete webhook (switch back to polling)
discard await bot.deleteWebhook(dropPendingUpdates = true)
```

## Polling vs Webhooks

| | Polling | Webhooks |
|---|---------|----------|
| **Setup** | Simple | Requires HTTPS server |
| **Latency** | Slight delay | Near-instant |
| **Resources** | Constant connections | On-demand |
| **Firewall** | Outbound only | Inbound required |
| **Best for** | Development, small bots | Production |

## When to Use Each

- **Development**: Use polling — no server setup needed
- **Production with few users**: Either works
- **Production at scale**: Use webhooks — more efficient
- **Behind NAT/firewall**: Use polling — no incoming connections needed
