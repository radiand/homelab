peer.unison.sync

# Description

Setup periodic file synchronization between two machines using `unison`. Host of
this role will receive systemd service and timer.

# Caveats

When one of the machines is remote and reached via `ssh`, then path to private
key has to be provided. After few trials, I could not make `unison` triggered
from `systemd` service to automatically select proper `ssh` key. These did not
help:
    - setting `.ssh/config` with HostName, User and IdentityFile
    - adding also AddKeysToAgent to the above
    - adding the key to ssh-agent
    - forcing `unison` to use particular config file by `-sshargs '-F
      %h/.ssh/config'`

Only `-sshargs '-i <key>` works.
