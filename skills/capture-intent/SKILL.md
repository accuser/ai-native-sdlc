---
name: capture-intent
description: Turn a raw idea, ticket, or problem statement into an intent.md. Use whenever someone describes a problem, pain point, or feature idea in their own words and wants it captured before design/build work starts, or explicitly asks to write an intent.
---

# Capture as intent.md

Stage 1 (Plan) of the AI-native SDLC. The goal is a human-readable, version-controlled proto-spec that the product owner can review and that the next stage (requirements & design) can consume directly. No formal language is required from the originator — that's your job.

## Steps

1. **Interview the originator.** Ask the questions an analyst would ask, one or two at a time, not as a wall of questions:
   - What can't you do today? What's the pain?
   - Who is affected (users, teams, systems)?
   - What does "better" look like? How will you know it worked?
   - What's explicitly out of scope?
   - Any known constraints (compliance, existing auth, performance, data)?

2. **Don't write anything until the idea is concrete.** If the answers are vague, keep asking before drafting.

3. **Find the intent home.** Look for an existing `intent.md` convention in this repo (e.g. an `intents/` directory, a `docs/intents/` folder, or check `CLAUDE.md` for where intents live). If none exists, ask the user where intents should live, then propose creating `intents/` at the repo root.

4. **Write `intent.md`** using this shape (adapt headers to the org's template if one exists in the repo):

```markdown
# Intent: <short title>
Author: <name/role>. Status: draft.

## Problem
<what's broken today, in concrete terms>

## Proposed outcome
<what better looks like>

## Affected users and systems
<who/what this touches>

## Constraints
<compliance, auth, performance, data constraints>

## Open questions
<anything unresolved — carry these forward, don't hide them>
```

5. **Show the draft to the originator and correct anything misunderstood.** Don't commit until they've confirmed it reflects what they meant.

6. **Commit it.** Use a filename that won't collide, e.g. `intents/<kebab-case-title>.md`. The commit author and timestamp become part of the audit trail — don't rewrite history to obscure who asked for what.

## Boundaries

- This produces `intent.md` only. Do not jump ahead into design, architecture, or code — that's the requirements-design skill's job, and it only starts once a product owner has accepted this intent.
- If the intent is really a bug report from production monitoring, the shape is the same but the "Problem" section should cite the metric/evidence that triggered it (see the incident-to-intent skill).
