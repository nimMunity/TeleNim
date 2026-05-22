# Webhook Management

### `setWebhook`

```nim
proc setWebhook*(b: TeleBot, url: string,
    certificate: InputFileOrString = "", ipAddress = "",
    maxConnections = -1, allowedUpdates: seq[string] = @[],
    dropPendingUpdates = false, secretToken = "") {.async.}
```

### `deleteWebhook`

```nim
proc deleteWebhook*(b: TeleBot, dropPendingUpdates = false): Future[bool]
```

### `getWebhookInfo`

```nim
proc getWebhookInfo*(b: TeleBot): Future[WebhookInfo]
```

### `startWebhook`

```nim
proc startWebhook*(b: Telebot, secret, url: string,
    port = Port(8080), dropPendingUpdates = false)
```

## WebhookInfo Type

```nim
WebhookInfo* = object
  url*: string
  hasCustomCertificate*: bool
  pendingUpdateCount*: int
  ipAddress*: string
  lastErrorDate*: int
  lastErrorMessage*: string
  lastSynchronizationErrorDate*: int
  maxConnections*: int
  allowedUpdates*: seq[string]
```
