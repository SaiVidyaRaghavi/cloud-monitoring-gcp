# Individual Viva Preparation (3%)

| Question | Short answer |
|---|---|
| What is Cloud Monitoring? | Google Cloud's service to collect metrics, build dashboards, and alert on them. |
| Why is CPU utilization 0 to 1? | The metric is a fraction, so 80% is 0.8. |
| Why is memory not available by default? | The hypervisor cannot see inside the guest OS, the Ops Agent reports it. |
| What is the Ops Agent? | Google's agent for guest metrics and logs, replacing the older monitoring and logging agents. |
| Metric vs log-based metric vs uptime check? | Metric is numeric time series, log-based metric counts or measures log entries, uptime check probes a public endpoint. |
| How do incidents open and close? | Open when the condition holds for the full duration, close when it stops or autoclose expires. |
| Why a 5-minute duration? | To ignore short spikes and reduce alert fatigue. |
| Why alert on error rate? | It reflects user-visible failure, CPU can be high without harm and low during failure. |
| What does ALIGN_MEAN / ALIGN_SUM mean? | How points in each alignment period are combined: average vs total. |
| How did you control cost? | Small VM, default agent metrics, one log metric, budget alert, Cost explorer. |
| What is a notification channel? | Where alerts are sent (email, SMS, Slack, PagerDuty, Pub/Sub). |
| What would you add in production? | SLOs, multiple channels and on-call routing, load balancer and app metrics, dashboards as Terraform code. |
| How is your config repeatable? | JSON and gcloud scripts in Git. |
