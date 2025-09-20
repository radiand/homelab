Bootstrapping RaspberryPi (arm64) services

# playbook-system-setup

Runs some tweaks on the system like turning off the swap.

# playbook-bookmarking

Installs [caddy](https://caddyserver.com) and [readeck](https://readeck.org/en),
then exposes the latter at `http://raspberrypi.local:8080/readeck` (TLS at 8443
as well). Caddy is used here as a reverse proxy.

Run with:

```bash
ansible-playbook -i hosts.yml -e readeck_secret_key=MY_MASTER_KEY playbook-bookmarking.yml
```
