param(
    [string]$Finding = "samples/guardduty-finding.json"
)

$ErrorActionPreference = "Stop"

$agent = Get-Content "openclaw/security-agent.md" -Raw
$prompt = Get-Content "prompts/incident-analysis.md" -Raw
$event = Get-Content $Finding -Raw

$task = @"
$agent

$prompt

AWS SECURITY EVENT
------------------
$event
"@

$task | openclaw agent exec --message-file - --json
