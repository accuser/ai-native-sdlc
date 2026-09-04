---
name: requirements-design
description: Turn an accepted intent.md into a requirements and design spec.md, applying the org's brand/security/compliance/UX skills and flagging concerns. Use once an intent.md has been accepted by a product owner and needs to become something engineering can plan against.
---

# Requirements and design (spec.md)

Stage 2 (Design) of the AI-native SDLC. Input is an accepted `intent.md`. Output is `spec.md`, sitting alongside it, ready to hand to engineering for plan mode.

## Steps

1. **Read the `intent.md` in full.** If it's not attached, ask for it or find it in the repo's intent home.

2. **Load every other applicable skill first.** Before drafting, check what security, compliance, brand, and UX skills exist in this repo (`.claude/skills/` or this plugin) and apply them as constraints on the design, not as an afterthought review. If the org has no such skills yet, say so explicitly in the output rather than silently skipping the check.

3. **Produce `spec.md`** covering:
   - **Solution summary** — what will be built, in plain terms.
   - **Requirements** — functional requirements traceable back to the intent's proposed outcome.
   - **Design decisions** — key technical/UX choices and why, especially anywhere you resolved an open question from `intent.md`.
   - **Affected surfaces** — systems, APIs, data, UI touched.
   - **Areas of concern** — flag anywhere a policy skill's requirement conflicts with the intent, another policy, or feasibility. Be explicit about contradictions rather than picking a side silently.
   - **Carried-forward open questions** — anything from `intent.md` still unresolved, plus any new ones this design raises.

4. **Do not write code or a file-level implementation plan here.** That's plan mode's job (Stage 3). This is requirements and design, one level up.

5. **Commit `spec.md` next to `intent.md`** (e.g. `intents/<name>/spec.md` or `intents/<name>-spec.md`, matching whatever convention the intent home already uses).

## Output checklist before you finish

- Does the spec solve the problem stated in `intent.md`?
- Is every open question from `intent.md` either answered or explicitly carried forward?
- Is every "area of concern" tied to a specific skill/policy, not vague?
- Would an engineer who has never seen the intent be able to start a plan-mode session from this spec alone?
