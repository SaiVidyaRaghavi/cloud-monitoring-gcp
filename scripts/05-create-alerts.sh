#!/usr/bin/env bash
# Creates all alert policies. Replace PROJECT_ID and CHANNEL_ID in each JSON before running.
set -euo pipefail
for f in alerts/high-cpu.json alerts/uptime.json alerts/error-rate.json alerts/high-memory.json; do
  echo "Creating policy from $f"
  gcloud alpha monitoring policies create --policy-from-file="$f"
done
gcloud alpha monitoring policies list --format="table(displayName,enabled)"
