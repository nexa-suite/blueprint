# Delivery fitness functions

Technical fitness authority remains [system reliability fitness functions](../../../04-delivery/reliability/fitness-functions.md).

## Mobile construction guards

- Mobile clients have no authoritative server database and do not duplicate
  aggregate lifecycle decisions.
- Presentation cannot bypass ViewModel/action, repository and API boundaries.
- Commands preserve idempotency, conflict and unknown-result behavior where
  their server contract requires it.
- Operations camera/barcode entry keeps a manual fallback.
- Local cache, draft and retry records cannot claim server confirmation.
- Security and telemetry checks reject raw tokens, endpoint material and
  unnecessary PII.
