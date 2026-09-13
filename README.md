# OpenClaw AWS Incident Assistant

A lightweight agentic-AI security project that uses OpenClaw to analyze AWS security events and generate concise incident summaries, severity assessments, and remediation guidance.

## Project Goal

The goal is to demonstrate how an AI agent can help a cloud-security analyst quickly interpret GuardDuty and CloudTrail events without requiring a large or expensive AWS environment.

## Architecture

```text
AWS Security Event Sample
        |
        v
OpenClaw Security Agent
        |
        v
LLM Analysis
        |
        v
Incident Summary + Severity + Recommended Actions
```

## What This Project Demonstrates

- OpenClaw agent configuration
- AWS GuardDuty and CloudTrail event interpretation
- LLM-assisted security analysis
- Structured incident reporting
- Remediation recommendations
- Secure handling of secrets and credentials
- A low-cost, portfolio-friendly agentic AI workflow

## Repository Structure

```text
openclaw-aws-incident-assistant/
├── README.md
├── openclaw/
│   └── security-agent.md
├── samples/
│   ├── guardduty-finding.json
│   └── cloudtrail-event.json
├── prompts/
│   └── incident-analysis.md
├── scripts/
│   ├── run-incident.ps1
│   └── run-incident.sh
└── docs/
    └── architecture.md
```

## Quick Start on Windows

Prerequisites:
- OpenClaw installed and authenticated with a model provider
- PowerShell
- Git

Clone the repository and run the included GuardDuty demo:

```powershell
git clone https://github.com/Strikerliker/openclaw-aws-incident-assistant.git
cd openclaw-aws-incident-assistant
.\scripts\run-incident.ps1
```

The PowerShell runner automatically:
1. Loads the sample GuardDuty finding.
2. Inserts the JSON into the incident-analysis prompt.
3. Adds the OpenClaw security-agent instructions.
4. Uses a persistent `.openclaw-state` directory to avoid temporary SQLite cleanup issues observed on native Windows.
5. Runs the analysis through OpenClaw.

To analyze a different local sample:

```powershell
.\scripts\run-incident.ps1 -Finding "samples/cloudtrail-event.json"
```

## Demo Workflow

1. Select a sample GuardDuty or CloudTrail event.
2. Give the event to the OpenClaw security agent.
3. OpenClaw analyzes the event with the configured LLM.
4. The agent returns:
   - Severity
   - Incident summary
   - Potential risk
   - Evidence observed
   - Recommended remediation
   - Follow-up investigation steps

## Verified Demo Result

A synthetic GuardDuty finding representing a successful AWS Management Console login from an unusual source was analyzed successfully. The assistant classified the event as **HIGH** severity, identified the affected IAM user and source context, described the potential account-compromise risk, and recommended verification, CloudTrail/GuardDuty review, IAM/MFA/session checks, and credential action only if compromise is confirmed.

## Example Output

```text
Severity: HIGH

Incident Summary:
GuardDuty reported a successful AWS Management Console login for an IAM user from an unusual source. The finding is synthetic demonstration data, so actual malicious activity is unconfirmed.

Potential Risk:
If malicious, an unauthorized party could use the IAM user's permissions to access data, alter resources, establish persistence, or perform additional actions in the AWS account.

Recommended Actions:
1. Confirm whether the login was expected.
2. Review CloudTrail and GuardDuty activity around the event time.
3. Review IAM permissions, MFA status, active sessions, and access keys.
```

## Security Notes

This repository must not contain AWS access keys, GitHub tokens, model API keys, passwords, or other secrets. Use environment variables or a managed secret store when integrating with live services.

The sample events in this repository are synthetic and are intended only for demonstration and testing.

The assistant is designed to recommend investigation and reversible containment actions. It does not perform destructive remediation.

## Future Enhancements

The project can later be extended to ingest real GuardDuty findings through EventBridge and Lambda, use Amazon Bedrock for model inference, create GitHub issues automatically, and add approval-based remediation workflows.

## Portfolio Description

**OpenClaw AWS Incident Assistant** — Built an agentic AI security assistant using OpenClaw to analyze AWS GuardDuty and CloudTrail security events, determine severity, summarize potential threats, and generate actionable remediation recommendations.
