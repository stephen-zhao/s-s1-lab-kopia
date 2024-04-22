#!/usr/bin/env bash

# Environment:
#
# KOPIA_SERVER_PASSWORD_FILE
#     Path to a secret file containing value for --server-password arg
#     (password for --server-username arg). Used to log in to the web UI.
#
# KOPIA_SERVER_CONTROL_PASSWORD_FILE
#     Path to a secret file containing value for --server-control-password
#     arg (password for --server-control-username arg). Used to authenticate
#     when using `kopia server` CLI.
#
# KOPIA_PASSWORD_FILE
#     Path to a secret file containing value for KOPIA_PASSWORD env var
#     (password for USER env var). Used as the repository password.

# === Docker Swarm Secrets compatibility ===
# Read secrets from files and pass to kopia server start

# Read server password from file:
if [[ -f "${KOPIA_SERVER_PASSWORD_FILE}" ]]; then
  KOPIA_SERVER_PASSWORD=$(cat "${KOPIA_SERVER_PASSWORD_FILE}")
fi

# Read server control password:
if [[ -f "${KOPIA_SERVER_CONTROL_PASSWORD_FILE}" ]]; then
  KOPIA_SERVER_CONTROL_PASSWORD=$(cat "${KOPIA_SERVER_CONTROL_PASSWORD_FILE}")
fi

# Read repository password from file:
if [[ -f "${KOPIA_PASSWORD_FILE}" ]]; then
  KOPIA_PASSWORD=$(cat "${KOPIA_PASSWORD_FILE}")
fi

# === Parse additional args read in from environment ===

ADDITIONAL_ARGS=()
i=0

if [[ -n "${KOPIA_SERVER_PASSWORD}" ]]; then
  ADDITIONAL_ARGS[$i]="--server-password=${KOPIA_SERVER_PASSWORD}"
  ((++i))
fi

if [[ -n "${KOPIA_SERVER_CONTROL_PASSWORD}" ]]; then
  ADDITIONAL_ARGS[$i]="--server-control-password=${KOPIA_SERVER_CONTROL_PASSWORD}"
  ((++i))
fi

# === Replace process with kopia server ===

export KOPIA_PASSWORD
exec /bin/kopia server start "$@" "${ADDITIONAL_ARGS[@]}"

