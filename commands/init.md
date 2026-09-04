---
description: Bootstrap this repo for the AI-native SDLC (CLAUDE.md, intents/, evals/, hooks, agents)
---

Bootstrap this repository for the AI-native SDLC playbook, using the templates in the ai-native-sdlc plugin. Do this incrementally and show me each piece before writing it — don't overwrite anything that already exists without asking.

1. **`CLAUDE.md`** — if missing, run `/init` first to generate a baseline from the codebase, then merge in the "Verifying your work" section from `templates/CLAUDE.md` in this plugin (build/test/lint commands + "run before reporting complete"). If it exists, propose only the missing sections.
2. **`intents/`** — create the directory if there's no existing intent home, with a short `intents/README.md` pointing at the capture-intent and requirements-design skills.
3. **`evals/`** — scaffold `evals/`, `evals/check.sh`, and `.github/workflows/agent-evals.yml` from `templates/github-workflows/agent-evals.yml`, only if CI is GitHub Actions (ask if it's something else).
4. **`REVIEW.md`** — offer to run the review-setup command.
5. **Agents** — copy `verifier.md`, `researcher.md`, and `code-simplifier.md` from this plugin's `agents/` into `.claude/agents/` if the repo doesn't already define its own.
6. **Hooks** — show me `hooks/protect-tests.sh` and `hooks/protect-paths.sh` from this plugin and ask which ones I want wired into `.claude/settings.json`; don't add hooks silently.
7. **Skills** — point out `templates/skills/secure-api-review/SKILL.md` as a worked example, and ask what institutional knowledge (security standard, API convention, brand rule) is currently enforced inconsistently here that's worth turning into a skill in `.claude/skills/`.

Summarize what was created, what was skipped because it already existed, and what still needs a human decision (branch protection, CI secrets, who owns each policy).
