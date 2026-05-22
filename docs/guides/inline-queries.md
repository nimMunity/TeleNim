# Inline Queries

Inline bots let users interact with your bot from any chat by typing `@yourbot query`.

## Setup

Register an inline query handler:

```nim
proc inlineHandler(bot: TeleBot, inlineQuery: InlineQuery): Future[bool] {.async.} =
  # Process the query and return results
  return true

let bot = newTeleBot(API_KEY)
bot.onInlineQuery(inlineHandler)
bot.poll()
```

> Enable inline mode for your bot via [@BotFather](https://t.me/botfather) with `/setinline`.

## Responding to Inline Queries

```nim
import telebot, asyncdispatch

proc inlineHandler(bot: TeleBot, inlineQuery: InlineQuery): Future[bool] {.async.} =
  let query = inlineQuery.query

  var results: seq[InlineQueryResultArticle]

  if query.len > 0:
    results.add(InlineQueryResultArticle(
      kind: "article",
      id: "1",
      title: "Echo: " & query,
      inputMessageContent: InputTextMessageContent("You said: " & query)
    ))

  discard await bot.answerInlineQuery(inlineQuery.id, results)
  return true
```

## Inline Query Result Types

### Article

Returns a text message:

```nim
InlineQueryResultArticle(
  kind: "article",
  id: "unique_id",
  title: "Result Title",
  description: "Optional description",
  inputMessageContent: InputTextMessageContent("Message content"),
  url: "https://example.com",           # Optional URL
  thumbnailUrl: "https://..."           # Optional thumbnail
)
```

### InputMessageContent Helpers

```nim
# Text
InputTextMessageContent("Hello!")

# Location
InputLocationMessageContent(latitude = 40.7128, longitude = -74.0060)

# Venue
InputVenueMessageContent(lat, lon, "Title", "Address")

# Contact
InputContactMessageContent("+1234567890", "John")
```

## `answerInlineQuery` Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `inlineQueryId` | `string` | *required* | ID from the inline query |
| `results` | `seq[T]` | *required* | Array of results |
| `cacheTime` | `int` | `0` | Result caching time in seconds |
| `isPersonal` | `bool` | `false` | Results are user-specific |
| `nextOffset` | `string` | `""` | Offset for pagination |
| `button` | `InlineQueryResultsButton` | `nil` | Button below results |

## Complete Example

```nim
import telebot, asyncdispatch, strutils

const API_KEY = strip(slurp("secret.key"))

proc inlineHandler(bot: TeleBot, iq: InlineQuery): Future[bool] {.async.} =
  let q = iq.query.strip()
  var results: seq[InlineQueryResultArticle]

  if q.len == 0:
    results.add(InlineQueryResultArticle(
      kind: "article", id: "help",
      title: "Type something to search",
      inputMessageContent: InputTextMessageContent("Type @mybot <query> to search!")
    ))
  else:
    # Generate results based on query
    for i in 1..3:
      results.add(InlineQueryResultArticle(
        kind: "article",
        id: $i,
        title: "Result " & $i & " for: " & q,
        description = "Description for result " & $i,
        inputMessageContent: InputTextMessageContent("Result " & $i & ": " & q)
      ))

  discard await bot.answerInlineQuery(iq.id, results, isPersonal = true)
  return true

let bot = newTeleBot(API_KEY)
bot.onInlineQuery(inlineHandler)
bot.poll(timeout = 300)
```
