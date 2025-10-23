#!/usr/bin/env bash

set -eo pipefail

export RESTIC_PASSWORD="{{ restic_password }}"
export RESTIC_REPOSITORY="{{ zettelkasten_restic_repo_dir }}"
{{ server_bins["restic"] }} backup --verbose "{{ server_zettelkasten_git_dir }}"
{{ server_bins["restic"] }} forget --verbose --keep-daily 30 --keep-monthly 1 --prune
