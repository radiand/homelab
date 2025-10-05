selfhosted services on raspberrypi installed with ansible

# playbook.service.zettelkasten

## What?

Plaintext notes version control, synchronization and backup. Based on [my
approach](https://github.com/radiand/zettelkasten) to
[zettelkasten](https://en.wikipedia.org/wiki/Zettelkasten) method.

## Installation

```bash
ansible-playbook -i hosts.yml -e restic_password=... playbook.service.zettelkasten.yml
```

## Technology stack

- `ansible`: installs configurations in hub and PCs I use.
- `git`: serves version control and push-pull abilities.
- `golang`: used in `zettelkasten` application that creates and manages notes.
- `neovim`: to browse, create, edit and search notes.
- `systemd`: fires periodic jobs to commit, synchronize changes.
