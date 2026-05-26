import types, strutils, utils

proc newKeyBoardButton*(
    text: string, 
    iconCustomEmojiId = "", 
    style = "", 
    requestChat: KeyboardButtonRequestChat = nil, 
    requestContact = false, 
    requestLocation = false, 
    requestPoll: KeyboardButtonPollType = nil, 
    webApp: WebAppInfo = nil
  ): KeyboardButton =
  
  new(result)
  result.text = text
  if iconCustomEmojiId != 0: result.iconCustomEmojiId = iconCustomEmojiId
  if style.len != 0: result.style = style
  if requestChat != nil: result.requestChat = requestChat
  if requestContact: result.requestContact = true
  if requestLocation: result.requestLocation = true
  if requestPoll != nil: result.requestPoll = requestPoll
  if webApp != nil: result.webApp = webApp

proc newReplyKeyboardMarkup*(
    keyboards: varargs[seq[KeyboardButton]], 
    isPersistent = false, 
    resizeKeyboard = false, 
    oneTimeKeyboard = false, 
    inputFieldPlaceholder = "", 
    selective = false
  ): ReplyKeyboardMarkup =
  
  new(result)
  result.kind = kReplyKeyboardMarkup
  for keyboard in keyboards:
    result.keyboard.add(keyboard)
  if isPersistent: result.isPersistent = true
  if resizeKeyboard: result.resizeKeyboard = true
  if oneTimeKeyboard: result.oneTimeKeyboard = true
  if inputFieldPlaceholder.len != 0: result.inputFieldPlaceholder = inputFieldPlaceholder
  if selective: result.selective = true

proc newInlineKeyBoardButton*(
    text: string, 
    iconCustomEmojiId = "", 
    style = "", url = "", 
    loginUrl: LoginUrl = nil, 
    callbackData = "", 
    webApp: WebAppInfo = nil, 
    switchInlineQuery = "", 
    switchInlineQueryCurrentChat = "", 
    switchInlineQueryChosenChat: SwitchInlineQueryChosenChat = nil, 
    copyText: CopyTextButton = nil, 
    callbackGame: CallbackGame = nil, 
    pay = false
  ): InlineKeyboardButton =
  
  new(result)
  result.text = text
  if iconCustomEmojiId.len != 0: result.iconCustomEmojiId = iconCustomEmojiId
  if style.len != 0: result.style = style
  if url.len != 0: result.url = url
  if loginUrl  != nil: result.loginUrl = loginUrl
  if callbackData.len != 0: result.callbackData = callbackData
  if webApp != nil: result.webApp = webApp
  if switchInlineQuery.len != 0: result.switchInlineQuery = switchInlineQuery
  if switchInlineQueryCurrentChat.len != 0: result.switchInlineQueryCurrentChat = switchInlineQueryCurrentChat
  if switchInlineQueryChosenChat != nil: result.switchInlineQueryChosenChat = switchInlineQueryChosenChat
  if copyText != nil: result.copyText = copyText
  if callbackGame != nil: result.callbackGame = callbackGame
  if pay: result.pay = pay

proc newInlineKeyboardMarkup*(keyboards: varargs[seq[InlineKeyBoardButton]]): InlineKeyboardMarkup =
  new(result)
  result.kind = kInlineKeyboardMarkup
  for keyboard in keyboards:
    result.inlineKeyboard.add(keyboard)

proc newReplyKeyboardRemove*(selective = false): ReplyKeyboardRemove =
  new(result)
  result.kind = kReplyKeyboardRemove
  if selective:
    result.selective = true

proc newForceReply*(selective = false, inputFieldPlaceholder = ""): ForceReply =
  new(result)
  result.kind = kForceReply
  result.forceReply = true
  result.selective = selective
  if inputFieldPlaceholder.len != 0:
    result.inputFieldPlaceholder = inputFieldPlaceholder
  if selective:
    result.selective = true

proc `$`*(k: KeyboardMarkup): string =
  case k.kind:
  of kInlineKeyboardMarkup:
    marshal(InlineKeyboardMarkup(k), result)
  of kReplyKeyboardMarkup:
    marshal(ReplyKeyboardMarkup(k), result)
  of kReplyKeyboardRemove:
    let kb = ReplyKeyboardRemove(k)
    if kb.selective:
      result = "{\"remove_keyboard\": true, \"selective\": true}"
    else:
      result = "{\"remove_keyboard\": true}"
  of kForceReply:
      marshal(ForceReply(k), result)

proc newLoginUrl*(url: string, forwardText = "", botUsername = "", requestWriteAccess = false): LoginUrl =
  new(result)
  result.url = url
  if forwardText.len > 0:
    result.forwardText = forwardText
  if botUsername.len > 0:
    result.botUsername = botUsername
  if requestWriteAccess:
    result.requestWriteAccess = true
