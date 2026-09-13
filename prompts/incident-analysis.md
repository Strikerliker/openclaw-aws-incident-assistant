# Incident Analysis Prompt

Analyze the AWS security event below as a cloud-security analyst.

Return the result using this exact structure:

```text
Severity: LOW | MEDIUM | HIGH | CRITICAL

Incident Summary:
<2-4 sentence summary>

Observed Evidence:
- <fact directly supported by the event>

Potential Risk:
<what could happen if the activity is malicious>

Recommended Actions:
1. <highest-priority safe action>
2. <next investigation or containment step>
3. <credential/IAM/network/logging step if relevant>

Additional Data Needed:
- <missing context that would improve confidence>
```

Rules:
- Use only facts present in the event.
- Clearly label uncertainty.
- Do not invent AWS resources, identities, IP addresses, or timestamps.
- Do not claim remediation was performed.
- Favor reversible containment and verification steps.
- Never output credentials, tokens, or secrets.

AWS event:

```json
{{AWS_EVENT_JSON}}
```
