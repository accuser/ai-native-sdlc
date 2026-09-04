---
description: Diagnose an anomaly/incident and write it up as intent.md
argument-hint: <metric/alert/report description>
---

Use the incident-to-intent skill to diagnose this, read-only: $ARGUMENTS

Gather evidence (logs, recent deploys, error rates), do not change anything in production, and write the finding as `intent.md` in the repo's intent home. Separate confirmed root cause from suspected root cause. Tell me who should triage it.
