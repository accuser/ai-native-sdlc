---
description: Scaffold PR review policy (REVIEW.md) for this repo
---

Set this repo up for the AI PR review play:

1. Check whether `REVIEW.md` already exists at the repo root. If it does, read it and propose edits rather than overwriting.
2. If it doesn't, create `REVIEW.md` from the template at `templates/REVIEW.md` in the ai-native-sdlc plugin, adapted to this repo: infer likely bug/security/compliance passes from the codebase (language, frameworks, presence of auth/PII handling), and set sensible defaults for what counts as Important vs Nit.
3. Tell me what branch-protection / code owner setup still needs a human (I can't configure GitHub settings from here) and what CI wiring (claude-code-action or the managed Code Review service) would need to be added.

Do not enable or configure any external review service — just produce the policy file and tell me the remaining manual steps.
