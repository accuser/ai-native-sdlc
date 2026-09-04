---
description: Write a regression eval case from a fix, review finding, or incident
argument-hint: <what to cover>
---

Use the write-eval skill to add an eval case covering: $ARGUMENTS

Find or scaffold `evals/` in this repo (with `evals/check.sh` and the CI workflow from `templates/github-workflows/agent-evals.yml` in the ai-native-sdlc plugin if missing). Write the case as a prompt + deterministic checks, confirm it currently fails against the buggy state where applicable, and commit it.
