#!/usr/bin/env bash
# Run ON the VM (SSH from the console). Installs Ops Agent for memory, disk and log metrics.
set -euo pipefail
sudo apt-get update -y
sudo apt-get install -y curl nginx
curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
sudo bash add-google-cloud-ops-agent-repo.sh --also-install
sudo systemctl status google-cloud-ops-agent --no-pager || true
echo "Verify in Monitoring > Metrics explorer: agent.googleapis.com/memory/percent_used"
