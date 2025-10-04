#!/usr/bin/env bash

set -eo pipefail

{{ bins["readeck"] }} export -config "${HOME}/readeck/config.toml" "/tmp/export.zip"

export RESTIC_PASSWORD="{{ restic_password }}"
export RESTIC_REPOSITORY="${HOME}/restic/readeck"
{{ bins["restic"] }} backup --verbose "/tmp/export.zip"
{{ bins["restic"] }} forget --verbose --keep-daily 30 --keep-monthly 1 --prune

rm "/tmp/export.zip"
