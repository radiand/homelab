notesync-unison

# What?

Sync and backup plain text notes.

[`restic`](https://restic.net/) +
[`unison`](https://github.com/bcpierce00/unison) approach to backup and
synchronize plain text files (notes, journals, etc.) between multiple machines,
probably also Android phones in the future. Key facts:

- using star topology: there is a central hub which works as a broker, peers
  never talk with each other directly
- hub (e.g. RaspberryPI) performs incremental, periodic backups
- peers can schedule their own syncing routines, currently using simple
  `systemd.timer` (cron) periodic schedule, but can be switched to path
  monitoring (see `man systemd.path`)

  In the diagram below you can find the data flow.

```mermaid
flowchart TD

subgraph "Hub (RPi)"
    ext_cloud_drive[("Cloud Drive")]
    ext_hdd[("External backup HDD")]
    hub_fs[("Filesystem")]
    hub_restic["restic (cron)"]

    hub_fs --> hub_restic
    hub_restic --> ext_hdd
    hub_restic --> ext_cloud_drive
end

subgraph "PC"
    pc_notepad["Plaintext Notepad app"]
    pc_fs[("Filesystem")]
    pc_unison["unison (cron)"]

    pc_notepad --> pc_fs
    pc_fs <--> pc_unison
    pc_unison <--> hub_fs
end
```
