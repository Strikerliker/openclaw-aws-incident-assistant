#!/usr/bin/env bash
set -euo pipefail

FINDING="${1:-samples/guardduty-finding.json}"

{
  cat openclaw/security-agent.md
  printf '\n\n'
  cat prompts/incident-analysis.md
  printf '\n\nAWS SECURITY EVENT\n------------------\n'
  cat "$FINDING"
} | openclaw agent exec --message-file - --json
