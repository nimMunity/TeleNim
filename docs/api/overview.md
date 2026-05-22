# API Reference

Complete reference for all exported types, procs, and functions in telebot.nim.

## Modules

| Module | Description |
|--------|-------------|
| `telebot` | Main entry point — re-exports everything below |
| `telebot/webapp` | Client-side WebApp JS bindings (JS backend only) |

## Table of Contents

### Bot Setup
- [Constructor & Configuration](#constructor-configuration)
- [Polling & Updates](#polling-updates)

### Sending Messages
- [Text & Media](#text-media)
- [Locations & Contacts](#locations-contacts)
- [Polls & Dice](#polls-dice)
- [Media Groups](#media-groups)
- [Payments & Invoices](#payments-invoices)
- [Games](#games)

### Message Management
- [Editing Messages](#editing-messages)
- [Deleting Messages](#deleting-messages)
- [Forwarding & Copying](#forwarding-copying)
- [Reactions](#reactions)

### Bot Commands
- [Command Management](#command-management)
- [Bot Info](#bot-info)

### Chat Management
- [Members & Permissions](#members-permissions)
- [Chat Settings](#chat-settings)
- [Invite Links](#invite-links)

### Stickers
- [Sticker Management](#sticker-management)

### Forum Topics
- [Forum Management](#forum-management)

### Inline
- [Inline Queries](#inline-queries)
- [Callback Queries](#callback-queries)

### Webhooks
- [Webhook Management](#webhook-management)

### Keyboards
- [Reply Keyboards](#reply-keyboards)
- [Inline Keyboards](#inline-keyboards)
- [Special Markups](#special-markups)

### Types
- [Core Types](#core-types)
- [Message Types](#message-types)
- [Chat Types](#chat-types)
- [Media Types](#media-types)
- [Keyboard Types](#keyboard-types)
- [Payment Types](#payment-types)
