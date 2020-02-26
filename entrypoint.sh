#!/bin/sh
set -eu

### Apprise GitHub Action script
#
# Uses the environment variable `APPRISE_URL`.
# 
# Uses two CLI parameters `title` and `message`.
#
###

# Save title and message to temporary files
titlefile=$(mktemp)
messagefile=$(mktemp)

echo "$1" > "$titlefile"
echo "$2" > "$messagefile"

# Apply templating with data from the GitHub event
title=$(j2 "$titlefile" "$GITHUB_EVENT_PATH")
message=$(j2 "$messagefile" "$GITHUB_EVENT_PATH")

# Uses the Apprise CLI tool to send the notifciation
apprise -t "$title" -b "$message" "$APPRISE_URL"
