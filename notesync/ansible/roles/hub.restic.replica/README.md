# Requirements

- External drive at `{{ restic_replica_mount_path }}` was mounted before and has
  been `chown`ed to the non-root user (ie. `ansible_user`). `chown -R 1000:1000`
  must happen **after** the mount, afterwards 
