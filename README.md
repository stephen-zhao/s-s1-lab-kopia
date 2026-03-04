# Kopia for s-s1-lab

A specialized packaging of Kopia for s-s1-lab.

Contents:

- `Dockerfile` - An extension of [the official Docker image](https://hub.docker.com/r/kopia/kopia), but made to be compatible with Docker Swarm Secrets
- `start-kopia-server.sh` - Start script which can read secrets from files

## Docker Image

Defined by `Dockerfile`.

### Get

Install from the command line:
```
docker pull ghcr.io/stephen-zhao/s-s1-lab-kopia:main
```

Use as base image in Dockerfile:
```
FROM ghcr.io/stephen-zhao/s-s1-lab-kopia:main
```

### Tags

Tags on the published Docker images are passed through from the underlying official images, along with a "passthrough-" prefix. For example, `passthrough-v0.22.3` in our published image will be our latest build on the `main` branch that uses the official image tagged `v0.22.3`.

## Start Script

`start-kopia-server.sh`

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

