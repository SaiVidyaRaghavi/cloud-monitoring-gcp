#!/usr/bin/env bash
# Creates a small, cost-conscious Ubuntu LTS VM.
# e2-micro is free-tier eligible only in us-west1, us-central1, us-east1 (check current Google Cloud Free Tier terms).
set -euo pipefail
ZONE="${ZONE:-us-central1-a}"
gcloud compute instances create monitoring-vm \
  --zone="$ZONE" \
  --machine-type=e2-micro \
  --image-family=ubuntu-2204-lts \
  --image-project=ubuntu-os-cloud \
  --boot-disk-size=20GB \
  --boot-disk-type=pd-standard \
  --tags=http-server
gcloud compute instances list --filter="name=monitoring-vm"
