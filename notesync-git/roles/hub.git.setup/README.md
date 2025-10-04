hub.setup.git

# What?

Setup system user `git`, create `.ssh` and `/srv/git` directories with
appropriate permissions.

# Why?

Prepare system for hosting git repositories and connectivity via ssh:

```bash
git clone 'git@raspberrypi.local:/srv/git/myrepo.git'
```
