# Examples

All examples are available in the `examples/` directory of the repository.

## Basic

### [Echo Bot](echo-bot.md)
The simplest bot — echoes back any text message. Demonstrates `onUpdate` and `sendMessage`.

### [Echo Bot with Proxy](proxy-bot.md)
Same echo bot routed through an HTTP proxy for debugging.

### [Dynamic Commands](dynamic-commands.md)
Manage bot commands at runtime with `getMyCommands` and `setMyCommands`.

## Messages

### [Send Dice](send-dice.md)
Roll dice with the `sendDice` method.

### [Delete Message](delete-message.md)
Programmatically delete a message with `deleteMessage`.

### [Force Reply](force-reply.md)
Force users to reply to specific messages using `ForceReply` markup.

### [Share Contact](share-contact.md)
Request and receive contact information from users.

## Media

### [Image Bot](image-bot.md)
Send photos from the local filesystem.

### [Photo Send Bot](photo-send-bot.md)
Minimal photo-sending bot.

### [Media Group](media-group.md)
Send albums (multiple photos) and edit media after sending.

### [File Send Bot](file-send-bot.md)
Send local files as documents.

### [File Receive Bot](file-receive-bot.md)
Receive and download files sent to the bot.

## Keyboards

### [Inline Keyboard](inline-keyboard.md)
Create multi-row inline keyboards with URL buttons.

### [Callback Query](callback-query.md)
Handle inline keyboard button presses with callback queries.

### [Seamless Login](seamless-login.md)
Implement Telegram Login URL for website authentication.

## Advanced

### [Geo Location Bot](geo-location.md)
Send geographic locations to chats.

### [Inline Query](inline-query.md)
Respond to inline queries with results.

### [Promote Chat Member](promote-member.md)
Promote users to admin with specific permissions.

### [Set Chat Permissions](chat-permissions.md)
Restrict user permissions in a chat.

### [Set Command Scope](command-scope.md)
Register commands with different scopes (global, per-chat, per-user).

### [Webhook Simple](webhook.md)
Run the bot in webhook mode instead of polling.

### [Web App](webapp.md)
Telegram Web App integration with JS backend.
