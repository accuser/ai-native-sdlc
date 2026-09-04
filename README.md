# ai-native-sdlc

A Claude Code plugin that operationalizes `playbook.md`: skills, commands, agents, and hooks for the six-stage AI-native SDLC (Plan, Design, Build, Test, Deploy, Maintain), meant to be installed once and reused across every project.

## What's here, mapped to the playbook

| Playbook play | Stage | Piece |
|---|---|---|
| Capture as intent.md | Plan | `skills/capture-intent`, `/intent` |
| Requirements and design | Design | `skills/requirements-design`, `/spec` |
| Plan mode as default starting point | Build | `skills/plan-from-spec`, `/plan` |
| The CLAUDE.md | Build | `templates/CLAUDE.md` |
| Skills as institutional knowledge | Build | `templates/skills/secure-api-review` (worked example) |
| Hooks as build-time guardrails | Build | `hooks/protect-paths.sh`, `hooks/protect-tests.sh` |
| Parallel sessions and subagents | Build | `agents/verifier.md`, `agents/researcher.md`, `agents/code-simplifier.md` |
| Give Claude a feedback loop | Test | folded into `templates/CLAUDE.md` + `agents/verifier.md` |
| Continuous evals in CI | Test | `skills/write-eval`, `/eval`, `templates/github-workflows/agent-evals.yml`, `templates/evals-check.sh` |
| AI in the PR review loop | Deploy | `templates/REVIEW.md`, `/review-setup` |
| Hooks as approval gates | Deploy | `hooks/production-gate.sh` |
| CI/CD integration and deployment | Deploy | `hooks/settings.json.example` (permission tiers, gate wiring) |
| Maintenance and closing the loop | Maintain | `skills/incident-to-intent`, `/incident`, `templates/bands.yaml` |
| Recurring codebase scans, Claude Tag | Maintain | product features (Claude Security, Claude Tag) — no local scaffolding needed |

`/init` (this plugin's, not Claude Code's built-in `/init`) bootstraps a target repo with all of the above in one pass.

## Install into a project

This is a local, un-pushed directory (`git status` shows no repo here yet). Two ways to use it:

**Option A — as a plugin (recommended for reuse across projects).** Push this directory to a git remote, then in any project:
```
/plugin marketplace add <this-repo-url-or-path>
/plugin install ai-native-sdlc
```
That makes `/intent`, `/spec`, `/plan`, `/review-setup`, `/eval`, `/incident`, `/init` and the skills/agents available in every project without copying files.

**Option B — copy directly.** Copy `skills/`, `commands/`, `agents/`, `hooks/` into a project's `.claude/` directory (Claude Code reads `.claude/skills/`, `.claude/commands/`, `.claude/agents/`; hooks need wiring through `.claude/settings.json` — see `hooks/settings.json.example`). Faster to start, but each project drifts independently — Option A keeps them in sync.

## Using it in a project

1. `/ai-native-sdlc:init` (or just `/init` if this is the only plugin providing it) — bootstraps `CLAUDE.md`, `intents/`, `evals/`, offers hooks and `REVIEW.md`.
2. `/intent <idea>` — brainstorm and commit `intent.md`.
3. Product owner reviews/merges the intent.
4. `/spec intents/<name>/intent.md` — produce `spec.md`.
5. `/plan intents/<name>/intent.md intents/<name>/spec.md` — plan mode, produce `plan.md`, then build.
6. Open the PR — `REVIEW.md`'s policy governs the review pass; `/eval` adds regression coverage for anything that slipped through.
7. Deploy through the pipeline; `hooks/production-gate.sh` enforces the release authorization gate.
8. Production anomalies come back in as `/incident`, closing the loop.

## Governance notes

- Every artifact (`intent.md`, `spec.md`, `plan.md`, the PR, the eval) is meant to be committed to version control — that's the audit trail, per the playbook. Nothing here writes to a system other than the repo.
- Hooks in `hooks/` are deterministic and either allow, ask, or block — they don't call a model. `production-gate.sh` requires a `RELEASE_APPROVAL` env var set by a human/process outside the agent's control; don't let an agent set that variable itself.
- None of these commands push to `main`, deploy to production, or configure external services (branch protection, CI secrets, review-service enablement) — those stay manual steps a human runs, and each command says so where relevant.
