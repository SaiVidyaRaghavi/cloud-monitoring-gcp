# Proposal and Design Review (8%)

## 1. Problem statement
Cloud Monitoring Dashboards and Alerting Policies (Observability).
Operations teams need one view of application health and alerts that signal real problems instead of noise.

## 2. Use cases
1. Give operations a single application health view.
2. Alert on error rate rather than CPU alone.

## 3. Expected bottlenecks and our response
| Bottleneck | Design response |
|---|---|
| Alert thresholds cause fatigue in the first week | 5-minute duration, autoclose, symptom-based alerts, weekly threshold review |
| Custom metric cost grows faster than anticipated | Only one log-based metric, default Ops Agent metrics, budget alerts, Cost explorer review |

## 4. Architecture
Ubuntu VM on Compute Engine, with built-in metrics and the Ops Agent (memory, disk, logs), feeding Cloud Monitoring and Cloud Logging. A log-based counter turns error log lines into a metric. A dashboard visualizes everything and alerting policies send email.

(Diagram: `docs/architecture.png`, also in the slide deck.)

## 5. Design decisions
| Decision | Choice | Reason |
|---|---|---|
| Compute | Single e2-micro or e2-small Ubuntu LTS VM | Lowest cost, enough for monitoring demo |
| Guest metrics | Ops Agent | Memory and disk-used are not collected by default |
| Error signal | Log-based counter metric `app_error_count` | Alerts on symptoms users feel |
| Notification | Email channel | Required by the brief, verified address |
| Config management | JSON in Git, gcloud scripts | Repeatable, reviewable |

## 6. Planned metrics
| Signal | Metric type | Scale |
|---|---|---|
| CPU | `compute.googleapis.com/instance/cpu/utilization` | 0 to 1 |
| Network in/out | `.../network/received_bytes_count`, `.../network/sent_bytes_count` | bytes |
| Uptime | `compute.googleapis.com/instance/uptime` | seconds |
| Memory | `agent.googleapis.com/memory/percent_used` (state=used) | 0 to 100 |
| Disk | `agent.googleapis.com/disk/percent_used` (state=used) | 0 to 100 |
| Errors | `logging.googleapis.com/user/app_error_count` | count |

## 7. Planned alert policies
| Policy | Condition | Duration |
|---|---|---|
| High CPU Usage Alert | CPU > 0.8 | 5 min |
| High Error Rate Alert | More than 5 errors per 5 min | 5 min window |
| High Memory Usage Alert | Memory used > 85% | 5 min |
| VM Uptime Alert | Uptime data absent | 5 min |

## 8. Cost plan
- e2-micro (free-tier eligible in some US regions) or e2-small, 20 GB standard disk.
- Review the console cost estimate before creating the VM.
- Budget of INR 500 with alerts at 50%, 90%, 100%.
- Delete the VM after the evaluation (`scripts/99-cleanup.sh`).

## 9. Timeline
| Phase | Work | Status |
|---|---|---|
| 1 | Project, billing, APIs, VM | Done |
| 2 | Dashboard (CPU, network, disk, status), Ops Agent | Done |
| 3 | CPU and uptime alerts | Done |
| 4 | Memory chart, network sent, error-rate alert, budget | Planned for mid-term to final |
| 5 | Stress test, incident evidence, documentation, GitHub | Before final demo |
