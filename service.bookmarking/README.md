service.bookmarking

# What?

Installs [caddy](https://caddyserver.com) and [readeck](https://readeck.org/en),
then exposes the latter at `http://raspberrypi.local:8080/readeck` (TLS at 8443
as well). Caddy is used here as a reverse proxy.

# Installation

```bash
ansible-playbook -i hosts.yml -e readeck_secret_key=... -e restic_password=... playbook.yml
```
