#!/usr/bin/env bash
# Exports live configuration for the GitHub portfolio.
set -euo pipefail
mkdir -p exported
gcloud alpha monitoring policies list --format=json > exported/policies.json
gcloud monitoring dashboards list --format=json > exported/dashboards.json
gcloud logging metrics list --format=json > exported/log-metrics.json
gcloud beta monitoring channels list --format=json > exported/channels.json
echo "Exported to ./exported (remove email addresses before pushing publicly)"
