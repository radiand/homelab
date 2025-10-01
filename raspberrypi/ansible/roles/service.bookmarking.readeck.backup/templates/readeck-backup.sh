#!/usr/bin/env bash

set +x

{{ readeck_bin }} -config "${HOME}/readeck/config.toml" export "/tmp/export.zip"

export RESTIC_PASSWORD="{{ restic_password }}"
export RESTIC_REPOSITORY="${HOME}/restic/readeck"
{{ restic_bin }} backup --verbose "/tmp/export.zip"
{{ restic_bin }} restic forget --verbose --keep-daily 30 --keep-monthly 1 --prune

rm "/tmp/export.zip"
