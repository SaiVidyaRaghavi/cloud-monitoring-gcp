# Final Working Demonstration Script (10%) - about 6 minutes

## Before you start
- VM running, dashboard open in one tab, Alerting > Incidents in another, email inbox open.
- Two SSH windows to the VM.

## Steps
| # | Action | What to say | Expected result |
|---|---|---|---|
| 1 | Show **Application Health Dashboard** | One view for CPU, memory, network, disk, errors, uptime | All charts have data |
| 2 | Show **Alerting > Policies** | Four policies, each with documentation and email channel | 4 policies enabled |
| 3 | SSH window 1: `bash stress-test.sh` | Driving CPU to 100% for 10 min | CPU chart rises |
| 4 | Explain the 0.8 scale and 5 min duration while waiting | Fraction scale, duration prevents false alarms | |
| 5 | Open **Incidents** after about 6 to 9 min | Incident opened on High CPU policy | Incident visible, email arrives (screenshot both) |
| 6 | SSH window 2: `bash generate-errors.sh` | Error-rate alert on symptoms, not just CPU | Error chart rises, High Error Rate incident |
| 7 | `Ctrl+C` stress test | Incident should close automatically when CPU recovers | Incident closes, resolved email |
| 8 | Show **Billing > Budgets** and **Cost explorer** | Cost control for custom metrics | Budget visible |
| 9 | Show GitHub repo | Configs as code | JSON files visible |

## Fallback if an email is delayed
Show the incident under Alerting > Incidents and the notification history in the incident details. Emails can lag by a few minutes.

## Evidence checklist
- [ ] CPU above 0.8 on the chart
- [ ] Incident open
- [ ] Alert email
- [ ] Incident closed
- [ ] Resolved email
- [ ] Error-rate incident
