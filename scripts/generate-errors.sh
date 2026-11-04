#!/usr/bin/env bash
# Run ON the VM. Writes ~20 error lines per minute for 10 minutes to syslog.
set -euo pipefail
for i in $(seq 1 200); do
  logger -p user.err "APP_ERROR simulated failure #$i"
  sleep 3
done
