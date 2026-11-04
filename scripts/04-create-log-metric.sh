#!/usr/bin/env bash
# Counter log-based metric used by the error-rate alert.
set -euo pipefail
gcloud logging metrics create app_error_count \
  --description="Count of APP_ERROR lines written to syslog by the app or test script" \
  --log-filter='resource.type="gce_instance" AND logName:"syslog" AND textPayload:"APP_ERROR"'
