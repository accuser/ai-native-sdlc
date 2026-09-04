---
name: secure-api-review
description: Apply the API security standard. Use whenever creating or
  modifying an external-facing endpoint, reviewing API code, or
  generating an OpenAPI spec.
---
# Secure API review

When you create or change an API endpoint:
1. Authentication: every endpoint requires the gateway JWT; no anonymous routes outside /health.
2. Input validation: validate request bodies against the OpenAPI schema and reject unknown fields.
3. Audit: every state-changing endpoint emits an audit event with actor, action, entity and timestamp.
4. Data classification: fields tagged `pii` in the schema must never appear in logs or error messages.

Run `scripts/check-endpoints.sh` and include its output in your summary.

<!--
This file is a worked example from the playbook, kept here as a template.
Copy it into a project's .claude/skills/<name>/SKILL.md and rewrite the
numbered rules from the org's actual policy source of truth — don't ship
this file verbatim.
-->
