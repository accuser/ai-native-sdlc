---
name: incident-to-intent
description: Diagnose a production anomaly, monitoring alert, or incident and write it up as an intent.md in the Stage 1 format so it enters the normal pipeline. Use when investigating a metric breach, an on-call page, or a bug report that needs to become tracked work rather than an ad hoc fix.
---

# Closing the loop: incident -> intent.md

Stage 6 (Maintain) practice. Whether the trigger was a monitoring script, a Slack page, or a human bug report, the output is the same: an `intent.md` that re-enters the normal Plan -> Design -> Build -> Test -> Deploy pipeline. Do not fix production directly from this skill unless the finding is bounded and an approved runbook already covers it (e.g. rollback) — anything else routes through review like any other change.

## Steps

1. **Gather the evidence first.** What tripped — a metric, an alert, a report? What's the baseline, what's the current value, when did it start, is a recent deploy correlated?

2. **Diagnose read-only.** Look at logs, recent commits/deploys, error rates. Don't change anything yet.

3. **Write `intent.md`** in the Stage 1 shape, with the evidence taking the place of the usual "originator interview":

```markdown
# Intent: <short title for the anomaly/incident>
Author: <agent/monitor name>. Status: draft.

## Problem
<the anomaly, with numbers: metric, baseline, observed value, window, correlated deploy if any>

## Proposed outcome
<what "resolved" looks like — metric back at baseline, or the underlying defect fixed>

## Affected users and systems
<blast radius as best known>

## Constraints
<anything limiting the fix — can't touch a frozen package, needs a specific rollback path, etc.>

## Open questions
<what's still unknown — don't guess at root cause if it isn't confirmed>
```

4. **Route it.** If this came from an automated monitor, hand off to the service owner or on-call for triage (fix now / schedule / dismiss). If dismissed, note why — that tunes the detection thresholds for next time.

5. **Bounded exception:** if a pre-approved runbook exists for exactly this situation (e.g. a rollback), you may trigger it directly per the org's hooks/approval gates — but still write the `intent.md` as the record of what happened and why.

6. **Once the real fix ships**, prompt for a regression eval via the write-eval skill so this class of incident is caught going forward.

## Boundaries

- No production writes from this skill beyond a pre-approved runbook. Everything else is diagnosis + `intent.md`.
- Don't speculate on root cause in the committed intent — separate "confirmed" from "suspected" clearly, and leave suspected causes as open questions.
