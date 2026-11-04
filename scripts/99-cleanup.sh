#!/usr/bin/env bash
# Removes billable resources after the evaluation.
set -euo pipefail
ZONE="${ZONE:-us-central1-a}"
gcloud compute instances delete monitoring-vm --zone="$ZONE" --quiet
gcloud logging metrics delete app_error_count --quiet
for id in $(gcloud alpha monitoring policies list --format="value(name)"); do
  gcloud alpha monitoring policies delete "$id" --quiet
done
