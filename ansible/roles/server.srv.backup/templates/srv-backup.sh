#!/usr/bin/env bash

set -eo pipefail

export RESTIC_PASSWORD="{{ restic_password }}"
export RESTIC_REPOSITORY="{{ srv_backup_restic_repo }}"
{{ bins["restic"] }} backup --verbose "{{ srv_dir }}"
{{ bins["restic"] }} forget --verbose --keep-daily 7 --keep-monthly 3 --prune
