# Documentation and Use-case Mapping (5%)

## Use-case mapping
| Use case from problem statement | Implementation | Evidence |
|---|---|---|
| Give operations a single application health view | `Application Health Dashboard`: CPU, memory, network in/out, disk, application errors, VM uptime | `dashboards/dashboard.json`, dashboard screenshot |
| Alert on error rate rather than CPU | Log-based metric `app_error_count` and `High Error Rate Alert`; CPU alert is kept as a supporting signal | `alerts/error-rate.json`, incident screenshot |
| Avoid alert fatigue (bottleneck) | 5-min durations, autoclose, documentation on each alert, symptom-first alerting, weekly review | `docs/05-cost-and-alert-fatigue.md` |
| Control custom metric cost (bottleneck) | One custom metric, default Ops Agent metrics, budget alerts, Cost explorer | Budget and Cost explorer screenshots |

## Component reference
| Component | Name | Purpose |
|---|---|---|
| VM | monitoring-vm | Monitored resource |
| Agent | Google Cloud Ops Agent | Memory, disk, logs |
| Log metric | app_error_count | Counts APP_ERROR log lines |
| Dashboard | Application Health Dashboard | Operational view |
| Policies | High CPU, High Memory, High Error Rate, VM Uptime | Detection |
| Channel | Email | Notification |

## How incidents open and close
1. Monitoring evaluates the condition on every aligned data point.
2. When it is true for the entire duration, an incident opens and the channel is notified.
3. When the condition stops being true, the incident closes and a resolved notification is sent.
4. If data stops arriving, autoclose (30 min) closes the incident.

## Expected delay
Metric ingestion 1 to 3 min, plus duration 5 min, plus email delivery: roughly 6 to 10 min from start of load to email.

## Troubleshooting
| Symptom | Fix |
|---|---|
| Metric search shows nothing | Resource must exist and send data, wait 2 to 3 min |
| Memory metric missing | Install the Ops Agent, check `systemctl status google-cloud-ops-agent` |
| Alert never fires | Check scale (CPU is 0 to 1), duration, filter, and that the policy is enabled |
| No email | Verify the channel and spam folder, check incident details for notification status |
| Error metric stays 0 | Confirm lines appear in Logs Explorer with `textPayload:"APP_ERROR"` |
