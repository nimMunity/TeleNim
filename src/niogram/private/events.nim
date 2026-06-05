import tables, std/[asyncdispatch, strutils]
from types import TeleBot, UpdateCallback, Update, CommandCallback, Command, CatchallCommandCallback, InlineQueryCallback

proc onUpdate*(b: TeleBot, cb: UpdateCallback) =
  ## Registers a callback to handle general updates.
  ##
  ## This procedure allows you to register a callback function that will be
  ## invoked whenever a new update is received from the Telegram Bot API.
  ##
  ## Parameters:
  ##   - `b`: The TeleBot instance to register the callback for.
  ##   - `cb`: The callback function to be registered.
  ##         It should be a `proc` that takes a `TeleBot` and an `Update` as parameters.
  ##
  ## Example:
  ## ```nim
  ## bot.onUpdate proc (bot: TeleBot, update: Update): Future[bool] =
  ##   echo "Received update: ", update
  ##   return false # Continue processing other callbacks
  ## ```
  b.updateCallbacks.add(cb)

proc onCommand*(b: TeleBot, command: string, cb: CommandCallback) =
  ## Registers a callback to handle specific commands.
  ##
  ## This procedure allows you to register a callback function that will be
  ## invoked when a message with the specified command is received.
  ##
  ## Parameters:
  ##   - `b`: The TeleBot instance to register the callback for.
  ##   - `command`: The command string to handle (e.g., "start", "help").
  ##                 Commands should be registered without the leading slash.
  ##   - `cb`: The callback function to be registered.
  ##         It should be a `proc` that takes a `TeleBot` and a `Command` object as parameters.
  ##
  ## Example:
  ## ```nim
  ## bot.onCommand("start") proc (bot: TeleBot, cmd: Command): Future[bool] =
  ##   echo "Received /start command from user: ", cmd.message.from.username
  ##   return false # Continue processing other callbacks
  ## ```
  if not b.commandCallbacks.hasKey(command):
    b.commandCallbacks[command] = @[]
  b.commandCallbacks[command].add(cb)
  
proc onHear*(b: TeleBot, pattern: string, cb: CommandCallback) =
  ## Registers a callback triggered when a message exactly matches `pattern`.
  ##
  ## Unlike `onCommand`, this matches plain message text (not slash commands),
  ## making it ideal for keyboard button labels, emoji phrases, or any
  ## exact-text trigger.
  ##
  ## Parameters:
  ##   - `b`:       The `TeleBot` instance to register the callback for.
  ##   - `pattern`: The exact message text to match, after stripping whitespace.
  ##                Any UTF-8 string is valid (e.g., "👥 Refer", "Hello").
  ##   - `cb`:      The callback invoked on a match.
  ##                Signature: `proc(bot: TeleBot, cmd: Command): Future[bool]`
  ##
  ## The `Command` object passed to the callback has:
  ##   - `command` = the matched pattern
  ##   - `message` = the original `Message`
  ##   - `params`  = `""` (exact match carries no parameters)
  ##
  ## Returning `true` from the callback stops further callback processing;
  ## `false` continues to the next registered callback.
  ##
  ## Example:
  ## ```nim
  ## bot.onHear("👥 Refer") proc(bot: TeleBot, cmd: Command): Future[bool] {.async.} =
  ##   await bot.sendMessage(cmd.message.chat.id, "Here is your referral link!")
  ##   return false
  ## ```
  ##
  ## Note: For slash commands like `/start`, use `onCommand` instead.
  b.updateCallbacks.add proc(bot: TeleBot, update: Update): Future[bool] {.async.} =
    if update.message != nil and update.message.text.strip() == pattern:
      var cmd = Command(command: pattern, message: update.message, params: "")
      result = await cb(bot, cmd)

proc onUnknownCommand*(b: TeleBot, cb: CatchallCommandCallback) =
  ## Registers a callback to handle unknown commands.
  ##
  ## This procedure allows you to register a callback function that will be
  ## invoked when a message with an unknown command (not registered with `onCommand`)
  ## is received. Only one catch-all command callback can be registered.
  ##
  ## Parameters:
  ##   - `b`: The TeleBot instance to register the callback for.
  ##   - `cb`: The callback function to be registered.
  ##         It should be a `proc` that takes a `TeleBot` and a `Command` object as parameters.
  ##
  ## Example:
  ## ```nim
  ## bot.onUnknownCommand proc (bot: TeleBot, cmd: Command): Future[bool] =
  ##   echo "Received unknown command: ", cmd.command, " from user: ", cmd.message.from.username
  ##   return false # Continue processing other callbacks
  ## ```
  b.catchallCommandCallback = cb

proc onInlineQuery*(b: TeleBot, cb: InlineQueryCallback) =
  ## Registers a callback to handle inline queries.
  ##
  ## This procedure allows you to register a callback function that will be
  ## invoked when an inline query is received.
  ##
  ## Parameters:
  ##   - `b`: The TeleBot instance to register the callback for.
  ##   - `cb`: The callback function to be registered.
  ##         It should be a `proc` that takes a `TeleBot` and an `InlineQuery` object as parameters.
  ##
  ## Example:
  ## ```nim
  ## bot.onInlineQuery proc (bot: TeleBot, query: InlineQuery): Future[bool] =
  ##   echo "Received inline query: ", query.query, " from user: ", query.from.username
  ##   return false # Continue processing other callbacks
  ## ```
  b.inlineQueryCallbacks.add(cb)
