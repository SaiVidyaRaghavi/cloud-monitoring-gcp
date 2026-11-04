# Bottlenecks: Alert Fatigue and Custom Metric Cost

## 1. Alert fatigue within the first week
| Cause | Mitigation implemented |
|---|---|
| Brief CPU spikes cross the threshold | 5-minute duration on CPU and memory alerts |
| Incidents linger and re-notify | Autoclose of 30 minutes |
| Too many alerts for the same issue | Few alerts, each tied to an action, symptom-first (errors, downtime) |
| Alerts without context | Documentation with first steps in every policy |
| Thresholds guessed up front | Review after 1 week using Incidents history, adjust thresholds |

Note: the notification rate limit setting applies to **log-based alerting policies** (log match conditions) only. For metric-threshold policies, use duration and autoclose.

### Weekly review checklist
- [ ] Which policy fired most? Was each incident actionable?
- [ ] Raise threshold or duration for alerts that fired without action
- [ ] Remove alerts nobody acts on

## 2. Custom metric cost
| Source | Cost behavior | Control |
|---|---|---|
| Ops Agent metrics (`agent.googleapis.com`) | Billed by ingested volume beyond the free allotment | Keep default metrics only, do not enable extra receivers |
| Log-based metric | Logs ingestion is billed beyond the free allotment | Narrow filter, exclude noisy logs |
| User-defined (custom) metrics | Billed by volume, cardinality grows with labels | Avoid high-cardinality labels |
| VM and disk | Billed while running | e2-micro, delete after evaluation |

Check current pricing at cloud.google.com/stackdriver/pricing and cloud.google.com/compute/pricing, because prices change.

## 3. Cost monitoring steps
1. Billing > Budgets & alerts > Create budget (INR 500, thresholds 50%, 90%, 100%).
2. Review **Observability > Cost explorer** and note ingestion by metric type.
3. Add a screenshot and one-paragraph finding to the final report.
