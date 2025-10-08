#!/usr/bin/env bash

set -eo pipefail

{{ bins["readeck"] }} export -config "{{ ansible_env.HOME }}/readeck/config.toml" "/tmp/export.zip"

export RESTIC_PASSWORD="{{ restic_password }}"
export RESTIC_REPOSITORY="{{ readeck_restic_repo_dir }}"
{{ bins["restic"] }} backup --verbose "/tmp/export.zip"
{{ bins["restic"] }} forget --verbose --keep-daily 7 --keep-monthly 3 --prune

rm "/tmp/export.zip"
