---
name: plan-from-spec
description: Turn an accepted intent.md and spec.md into an implementation plan.md during plan mode. Use at the start of a Claude Code session when the engineer hands over intent.md and spec.md and wants an implementation plan before any code is written.
---

# Plan mode from spec.md (plan.md)

Stage 3 (Build) entry point of the AI-native SDLC. This should run inside plan mode — no file edits until the engineer accepts the plan.

## Steps

1. **Read `intent.md` and `spec.md` fully.** If either is missing, stop and ask for it rather than inventing requirements.

2. **Interview the engineer** the way plan mode is meant to be used — before locking the plan, surface:
   - What could this change break? Which existing tests/flows are nearest neighbors?
   - Which step in the plan is riskiest, and why?
   - What alternative approaches did you consider and rule out, and why?

3. **Produce a plan** that names:
   - **Files that change** (new and modified), one line each.
   - **Order of work** — the sequence, not just a file list.
   - **Risks** — anything that could break, rate-limit, or regress.
   - **Proof** — the specific tests/checks that will demonstrate the plan is satisfied (tie back to `spec.md` requirements).

   Use this shape:

```markdown
# Plan: <title> (from intent.md <date>)

## Files that change
<path> (new|modified) — <one line on what changes>

## Order of work
1. ...
2. ...

## Risks
<what could break, and the mitigation>

## Proof
<tests/checks that prove this works>
```

4. **Iterate until an engineer who has never seen this conversation could implement the change from the plan alone.** That's the bar — not "did I understand it," but "is it legible standalone."

5. **Once accepted, commit `plan.md` alongside `intent.md` and `spec.md`.**

6. **If implementation departs from the plan during the build**, update `plan.md` in the same commit as the departure. Don't let the artifact drift silently from reality — the PR review stage checks the diff against `plan.md`.

## Boundaries

- Stay in plan mode until the plan is accepted. Do not edit files "just to check something" during planning.
- This is not the place to re-litigate `spec.md`'s decisions — if the plan reveals the spec itself is wrong, say so explicitly and route back to the requirements-design step rather than quietly overriding it.
