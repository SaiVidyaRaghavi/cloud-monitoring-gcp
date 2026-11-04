#!/usr/bin/env bash
# Enables the APIs needed for the project. Run in Cloud Shell.
set -euo pipefail
PROJECT_ID="${PROJECT_ID:-$(gcloud config get-value project)}"
echo "Project: $PROJECT_ID"
gcloud billing projects describe "$PROJECT_ID" --format="value(billingEnabled)"
gcloud services enable compute.googleapis.com monitoring.googleapis.com logging.googleapis.com --project "$PROJECT_ID"
