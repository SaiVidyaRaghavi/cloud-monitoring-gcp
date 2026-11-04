# Mid-term Progress Report (10%)

**Student:** `<Name>`  **Project:** Cloud Monitoring Dashboards and Alerting Policies

## Completed
| Item | Evidence (add screenshot to `screenshots/`) |
|---|---|
| GCP project and billing | `01-project-billing.png` |
| APIs enabled | `02-apis.png` |
| VM `monitoring-vm` running | `03-vm-running.png` |
| Dashboard with VM CPU, Network Received, Disk, VM Status | `04-dashboard.png` (taken 27 Sep 2026, shows live data) |
| Alert: High CPU Alert - monitoring-vm | `05-alert-policies.png` |
| Alert: VM Uptime Alert - monitoring-vm | `05-alert-policies.png` |
| Ops Agent installed (disk metrics visible) | `06-ops-agent.png` |

## In progress / remaining
| Item | Target |
|---|---|
| Network Sent and Memory charts | Before final |
| Rename and group dashboard as Application Health view | Before final |
| Log-based metric and High Error Rate Alert | Before final |
| Memory alert | Before final |
| Budget alert and cost review | Before final |
| Stress test with incident and email evidence | Final demo |
| README, GitHub portfolio | Before final |

## Issues faced and solutions
| Issue | Solution |
|---|---|
| No metric data at first | VM did not exist yet, created VM, data appeared within minutes |
| Billing not linked, Compute API could not be enabled | Linked a billing account, then enabled the API |
| CPU threshold scale | CPU utilization is 0 to 1, so 80% = 0.8 |

## Learning so far
Metrics need a running resource, guest metrics need the Ops Agent, and alerts need a duration so brief spikes do not page anyone.
