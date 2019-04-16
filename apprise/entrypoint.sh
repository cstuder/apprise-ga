#!/bin/sh
set -eu

# Apprise GitHub Action script
#
# @author Christian Studer <cstuder@existenz.ch>

# Uses the Apprise CLI tool
apprise -t "$0" -b "$1" "$APPRISE_URL"
