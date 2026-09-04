#!/bin/bash
# PreToolUse hook (matcher: Edit|Write) — blocks edits to paths the org has
# frozen (generated code, a legacy package, infra/migrations without a
# change ticket). Customize PROTECTED_PATTERNS per repo in
# .claude/settings.json via the PROTECTED_PATHS env var, e.g.
# "src/gen/,legacy/v1/,infra/migrations/".

file=$(jq -r '.tool_input.file_path // .tool_input.path // empty' < /dev/stdin)
patterns="${PROTECTED_PATHS:-src/gen/}"

IFS=',' read -ra PATTERNS <<< "$patterns"
for p in "${PATTERNS[@]}"; do
  if [[ -n "$p" && "$file" == *"$p"* ]]; then
    echo "$file matches protected path '$p'. This path is frozen — get sign-off from its owner before editing, then set an override if the org's process provides one." >&2
    exit 2
  fi
done

exit 0
