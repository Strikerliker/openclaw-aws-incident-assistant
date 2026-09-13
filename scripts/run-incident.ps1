param(
    [string]$Finding = "samples/guardduty-finding.json"
)

$ErrorActionPreference = "Stop"

# Resolve project paths from the repository root.
$ProjectRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$FindingPath = Join-Path $ProjectRoot $Finding
$AgentPath = Join-Path $ProjectRoot "openclaw/security-agent.md"
$PromptPath = Join-Path $ProjectRoot "prompts/incident-analysis.md"
$StateDir = Join-Path $ProjectRoot ".openclaw-state"
$TaskFile = Join-Path $ProjectRoot "incident-test.md"

if (-not (Test-Path $FindingPath)) {
    throw "Finding file not found: $FindingPath"
}

# Use persistent state on Windows to avoid OpenClaw temporary SQLite cleanup locks.
New-Item -ItemType Directory -Force -Path $StateDir | Out-Null

$agent = Get-Content $AgentPath -Raw
$prompt = Get-Content $PromptPath -Raw
$event = Get-Content $FindingPath -Raw

# Insert the selected AWS event into the prompt template.
$prompt = $prompt.Replace('{{AWS_EVENT_JSON}}', $event)

$task = @"
$agent

$prompt
"@

Set-Content -Path $TaskFile -Value $task -Encoding utf8

Push-Location $ProjectRoot
try {
    openclaw agent exec --state-dir $StateDir --message-file $TaskFile --cwd $ProjectRoot
    if ($LASTEXITCODE -ne 0) {
        throw "OpenClaw exited with code $LASTEXITCODE"
    }
}
finally {
    Pop-Location
}
