#!/bin/sh
set -eu

# Apprise GitHub Action script
#
# @author Christian Studer <cstuder@existenz.ch>

# Uses the Apprise CLI tool
apprise -t "$1" -b "$2" "$APPRISE_URL"
