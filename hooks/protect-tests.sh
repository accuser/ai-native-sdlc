#!/bin/bash
# PreToolUse hook (matcher: Edit|Write) — blocks edits to test files while a
# CLAUDE_TASK_MODE=fix session is active, so an agent fixing a bug can't
# weaken the test that proves the fix. Set CLAUDE_TASK_MODE=fix in the
# environment for bug-fix sessions that started from a failing-test-first
# workflow.

file=$(jq -r '.tool_input.file_path // .tool_input.path // empty' < /dev/stdin)

if [ "$CLAUDE_TASK_MODE" = "fix" ]; then
  if [[ "$file" == *test* || "$file" == *spec* ]]; then
    echo "This session is fixing a bug against a pre-committed failing test. Test files are locked for this session — fix the code, not the test." >&2
    exit 2
  fi
fi

exit 0
