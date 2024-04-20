# Kopia for s-s1-lab

Specialized Kopia for s-s1-lab. Contents:

- Dockerfile which is compatible with Docker Swarm Secrets
- Start script which can read secrets from files

## `start-kopia-server.sh`

### Environment

#### `KOPIA_SERVER_PASSWORD_FILE`

Path to a secret file containing value for `--server-password` arg
(password for `--server-username` arg). Used to log in to the web UI.

#### `KOPIA_SERVER_CONTROL_PASSWORD_FILE`

Path to a secret file containing value for `--server-control-password`
arg (password for `--server-control-username` arg). Used to authenticate
when using `kopia server` CLI.

#### `KOPIA_PASSWORD_FILE`

Path to a secret file containing value for `KOPIA_PASSWORD` env var
(password for `USER` env var). Used as the repository password.

