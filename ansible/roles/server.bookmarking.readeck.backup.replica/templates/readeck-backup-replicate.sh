#!/usr/bin/env bash

set -eo pipefail

function on_exit() {
    umount {{ replica_drive_mount_point }}
}

trap on_exit EXIT

if ! mountpoint -q {{ replica_drive_mount_point }}; then
    mount {{ replica_drive_mount_point }}
fi
export RESTIC_FROM_PASSWORD="{{ restic_password }}"
export RESTIC_FROM_REPOSITORY="{{ readeck_restic_repo_dir }}"
export RESTIC_PASSWORD="{{ restic_password }}"
export RESTIC_REPOSITORY="{{ readeck_restic_repo_replica_dir }}"
{{ bins['restic'] }} copy --verbose
