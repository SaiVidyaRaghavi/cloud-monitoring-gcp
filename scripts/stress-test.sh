#!/usr/bin/env bash
# Run ON the VM. Drives CPU to 100% for 10 minutes to trigger the High CPU alert.
set -euo pipefail
sudo apt-get install -y stress-ng
stress-ng --cpu 0 --timeout 600s --metrics-brief
