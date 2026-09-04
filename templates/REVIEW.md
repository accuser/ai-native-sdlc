# Review instructions

## Passes
Run these passes and tag each finding with its pass:
- **Bugs** — logic errors, broken edge cases, subtle regressions.
- **Security** — injection risks, authentication gaps, PII in logs or errors.
- **Compliance** — the change matches `spec.md` and `plan.md` (if this PR has them) and the org's design principles.

## What Important means here
Reserve Important for findings that would break behavior, leak data, or breach a policy. Style and naming are nits.

## Cap the nits
Report at most five nits per review; summarize the rest as a count.

## Do not report
- Generated files (e.g. `src/gen/`).
- Anything CI already enforces (formatting, lint that already gates merge).

## Human threshold
Findings inform review; they do not approve or block a PR on their own. Branch protection still requires approval from a code owner.
