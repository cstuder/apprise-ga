# apprise-ga

GitHub Action to send a push notification via a series of different services thanks to the the [Apprise library](https://github.com/caronc/apprise)

Supports services like Slack, AWS SNS, Discord, IFTTT, Matrix, Microsoft Teams, Telegram, Twitter etc., as well as email and webhooks.

## Usage

1. Create a new action in your workflow which uses `cstuder/apprise-ga/apprise@master`.
1. Look up the syntax for your push notification URL in the list of [Supported Notifications](https://github.com/caronc/apprise#supported-notifications) by Apprise. (I.e. <protocol://user:password@hostname/channel>)
1. Add this URL as the secret `APPRISE_URL` to the action.
1. Add your message to `args` in the format ["TITLE", "MESSAGE"].

*Note:* Environment variables in your message will be expanded. I.E.: `args = ["Commit successfull", "Commit: $GITHUB_SHA"]`.

### Workflow file syntax

```yaml
action "Send push notification" {
  uses = "cstuder/apprise-ga/apprise@master"
  secrets = ["APPRISE_URL"]
  args = ["Notification title", "Notification message"]
}
```

## Action configuration

### Environment variables

None.

### Secrets

Key|Value
---|---
`APPRISE_URL`|Notification URL according to [Apprise](https://github.com/caronc/apprise#supported-notifications)

### Required arguments

Position|Value
---|---
1|Notification title
2|Notification message

### Optional arguments

None.
