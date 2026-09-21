# Delivery fitness functions

Technical fitness authority remains [system reliability fitness functions](../../../04-delivery/reliability/fitness-functions.md).

## Mobile construction guards

### AUTOMATABLE NOW

- No Mobile Bounded Context, client-authoritative database or duplicate
  aggregate lifecycle model.
- Presentation does not import HTTP, database or platform implementations;
  remote/generated DTOs do not escape into public UI models.
- Feature modules do not depend on another feature's implementation internals.
- Required construction documents retain accepted Hilt, Navigation 3, CameraX,
  ML Kit bundled model, provider and go_router markers.

### IMPLEMENTATION-TIME

- Critical commands expose freshness, idempotency, conflict and unknown-result
  behavior.
- Operations has no generic offline synchronization or permanent Driver GPS
  tracking; local cache/draft/retry records cannot claim server confirmation.
- Scanner preserves manual fallback and platform adapters stay behind client
  boundaries.
- Tokens, provider endpoint material, payment secrets and unnecessary PII are
  absent from logs and telemetry.

### ACCEPTANCE-TIME

- Physical device, scanner hardware, accessibility, security, performance and
  system E2E evidence exists where the applicable acceptance scope requires it.
- Technical Verification remains separate from Product Acceptance, System
  Acceptance and Production Readiness.
