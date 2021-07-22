# apprise-ga

GitHub Action to send a dynamic push notification to every single platform thanks to the [Apprise library](https://github.com/caronc/apprise)

Supports services like Slack, AWS SNS, Discord, IFTTT, Matrix, Microsoft Teams, Telegram, Twitter etc., as well as email and webhooks.

Supports dynamically adding event data to the notification message with Jinja2 templates.

## Example usage

```yaml
uses: cstuder/apprise-ga@master
with:
  title: "Notication title"
  message: "Message"
env:
  APPRISE_URL: ${{ secrets.APPRISE_URL }}
```

## Complete usage

1. Create a new action in your workflow which uses `cstuder/apprise-ga@master`. (Or a tagged version.)
1. Look up the syntax for your push notification URL in the list of [Supported Notifications](https://github.com/caronc/apprise#supported-notifications) by Apprise. (I.e. `protocol://user:password@hostname/channel`)
1. Create a [repository secret](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets) named `APPRISE_URL` with your URL as content.
1. Add your message as inputs `title` or `message`.

### Inserting event data with templates

For both title and message you can use the [Jinja2](http://jinja.pocoo.org) syntax to insert data from the event trigger (`/github/workflow/event.json`) into your notification.

Find the event data in the list of [GitHub webhook payloads](https://developer.github.com/v3/activity/events/types/).

#### Templating example

For a push event, you might use the following arguments:

```yaml
title: "Push received on {{ ref }}"
message: "Commit by {{ head_commit.author.name }}: {{ head_commit.message | truncate(128) }} ({{ head_commit.id[0:7] }})"
```

## Inputs

### `title`

**Required** String with notification title.

### `message`

**Required** String with notification message.

## Secrets

### `APPRISE_URL`

**Required** Notification URL(s) according to the [Apprise documentation](https://github.com/caronc/apprise#supported-notifications).

To notify mulitple URLs, add them separated by spaces.

## License

MIT.
