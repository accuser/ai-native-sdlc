---
name: write-eval
description: Turn a completed task, a review finding, or a production incident into a regression eval case for the agent-evals suite. Use after fixing a bug that was caused by an agent misstep, after CLAUDE.md or a skill changes meaningfully, or when asked to add coverage for a class of mistake.
---

# Continuous evals

Stage 4 (Test) practice that keeps `CLAUDE.md`, skills, and hooks from regressing silently as models and prompts change.

## When to write one

- A production incident traces back to something an agent got wrong (or should have caught).
- A PR review flags the same mistake for the second time — the correction goes into `CLAUDE.md` *and* an eval, so it's tested going forward, not just documented.
- Someone asks to add coverage for a specific behavior.

## Steps

1. **Find or create the eval suite location.** Look for `evals/` at the repo root. If it doesn't exist, propose creating it alongside a `evals/check.sh` runner and a CI workflow (see `templates/github-workflows/agent-evals.yml` in this plugin for a starting point).

2. **Write the eval as a JSON case**: the prompt Claude should receive, plus the deterministic checks that define a pass.

```json
{
  "name": "no-double-billing-on-retry",
  "prompt": "Fix the retry logic in payments/retry.py so a network timeout does not charge the customer twice. Tests must pass.",
  "checks": {
    "command": "make test",
    "must_pass": true,
    "forbidden_diff_paths": ["payments/tests/test_retry.py"]
  }
}
```

3. **Make the check deterministic.** "Tests pass," "lint is clean," "the diff doesn't touch the test file," "the response contains X" — not a subjective judgment call.

4. **Confirm the eval currently fails** against the buggy state (if reproducing an incident) so it's proven to catch the class of problem, then confirm it passes once the real fix lands.

5. **Commit it into `evals/`.** It now runs on every change to `CLAUDE.md`, skills, or hooks (per the CI workflow), and stays in the suite as a permanent regression test.

## Boundaries

- Don't write evals for one-off, non-recurring mistakes — only for classes of mistake likely to recur.
- Don't make the check itself require model judgment unless nothing deterministic is possible; prefer `make test` / exit codes / grep over asking another Claude call to grade output.
