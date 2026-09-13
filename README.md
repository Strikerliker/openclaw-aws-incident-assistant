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
└── docs/
    └── architecture.md
```

## Demo Workflow

1. Select a sample GuardDuty or CloudTrail event.
2. Give the event to the OpenClaw security agent.
3. OpenClaw analyzes the event with the configured LLM.
4. The agent returns:
   - Severity
   - Executive summary
   - Potential risk
   - Evidence observed
   - Recommended remediation
   - Follow-up investigation steps

## Example Output

```text
Severity: HIGH

Summary:
A successful AWS Management Console login was observed from an unusual source.

Potential Risk:
Possible compromised credentials or unauthorized account access.

Recommended Actions:
1. Review CloudTrail activity for the IAM principal.
2. Confirm whether the login was expected.
3. Rotate exposed credentials if compromise is suspected.
4. Verify MFA is enabled.
5. Review recent IAM policy and access-key changes.
```

## Security Notes

This repository must not contain AWS access keys, GitHub tokens, model API keys, passwords, or other secrets. Use environment variables or a managed secret store when integrating with live services.

The sample events in this repository are synthetic and are intended only for demonstration and testing.

## Future Enhancements

The project can later be extended to ingest real GuardDuty findings through EventBridge and Lambda, use Amazon Bedrock for model inference, create GitHub issues automatically, and add approval-based remediation workflows.

## Portfolio Description

**OpenClaw AWS Incident Assistant** — Built an agentic AI security assistant using OpenClaw to analyze AWS GuardDuty and CloudTrail security events, determine severity, summarize potential threats, and generate actionable remediation recommendations.
