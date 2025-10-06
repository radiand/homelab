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

# playbook.service.bookmarking

## What?

Installs [caddy](https://caddyserver.com) and [readeck](https://readeck.org/en),
then exposes the latter at `http://raspberrypi.local:8080/readeck` (TLS at 8443
as well). Caddy is used here as a reverse proxy.

## Installation

```bash
ansible-playbook -i hosts.yml -e readeck_secret_key=... -e restic_password=... playbook.yml
```
