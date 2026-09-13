# Architecture

## Phase 1 — Fast Portfolio Demo

```text
+---------------------------+
| Synthetic AWS Event       |
| GuardDuty / CloudTrail    |
+-------------+-------------+
              |
              v
+---------------------------+
| OpenClaw Security Agent   |
| - parses event            |
| - applies security prompt |
| - preserves evidence      |
+-------------+-------------+
              |
              v
+---------------------------+
| LLM Analysis              |
| - severity                |
| - summary                 |
| - risk                    |
| - remediation guidance    |
+-------------+-------------+
              |
              v
+---------------------------+
| Structured Incident Report|
+---------------------------+
```

## Design Principles

- Low cost: Phase 1 works with synthetic event files and does not require always-on AWS infrastructure.
- Safe by default: the agent provides recommendations but does not perform destructive actions.
- Evidence based: output must distinguish observed facts from assumptions.
- Secret safe: credentials and tokens are never committed to source control.
- Extensible: the same agent can later consume real GuardDuty findings.

## Optional Phase 2

A production-style extension can use:

```text
GuardDuty -> EventBridge -> Lambda -> OpenClaw -> Amazon Bedrock -> Incident Output
```

Optional integrations can include GitHub Issues, Slack/Teams notifications, CloudWatch logging, Secrets Manager, and approval-based remediation functions.
