#!/bin/bash
# PreToolUse hook (matcher: Bash) — blocks production deploys without a named
# release authorization. Wire into .claude/settings.json (see README.md).
#
# Set RELEASE_APPROVAL in the environment (e.g. exported by a release-manager
# controlled step) to allow the deploy through.

cmd=$(jq -r '.tool_input.command' < /dev/stdin)

if [[ "$cmd" == *"deploy"* && "$cmd" == *"production"* ]]; then
  if [ -z "$RELEASE_APPROVAL" ]; then
    echo "Production deploys need a release authorization. Ask the release manager to set RELEASE_APPROVAL and re-run." >&2
    exit 2 # exit 2 blocks the action; the message goes to Claude
  fi
fi

exit 0
