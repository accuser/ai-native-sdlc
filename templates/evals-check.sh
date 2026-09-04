#!/bin/bash
# evals/check.sh <eval.json> <result.json>
# Deterministic checker for a single eval case. Adapt the checks handled
# here as the shape of evals/*.json checks grows.
set -euo pipefail

eval_file="$1"
result_file="$2"

check_cmd=$(jq -r '.checks.command // empty' "$eval_file")
must_pass=$(jq -r '.checks.must_pass // false' "$eval_file")
forbidden_paths=$(jq -r '.checks.forbidden_diff_paths // [] | join(" ")' "$eval_file")

status=0

if [ -n "$check_cmd" ]; then
  if $check_cmd; then
    cmd_ok=true
  else
    cmd_ok=false
  fi
  if [ "$must_pass" = "true" ] && [ "$cmd_ok" != "true" ]; then
    echo "FAIL ($eval_file): '$check_cmd' did not pass" >&2
    status=1
  fi
fi

if [ -n "$forbidden_paths" ]; then
  changed=$(git diff --name-only)
  for p in $forbidden_paths; do
    if echo "$changed" | grep -q "$p"; then
      echo "FAIL ($eval_file): forbidden path '$p' was touched" >&2
      status=1
    fi
  done
fi

[ "$status" -eq 0 ] && echo "PASS ($eval_file)"
exit $status
