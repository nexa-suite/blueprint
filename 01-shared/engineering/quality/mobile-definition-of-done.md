---
status: accepted
maturity: BASELINED
scope: v1
owner: engineering
last-reviewed: 2026-09-20
---

# Mobile Definition of Done

A Mobile slice is done only when its authorized API contract, tenant/context
handling, error/conflict/unknown-result state, accessibility behavior and
appropriate automated evidence are present. A build alone is not Product
Acceptance.

- No client-owned business authority, aggregate clone or separate server
  database.
- Authenticated scope is reconstructed by API; client cache/draft/staging stays
  non-authoritative and revocation fails closed.
- Retry-sensitive commands retain idempotency behavior; stale/conflict results
  are visible and not silently overwritten.
- Operations camera/barcode input preserves mandatory manual fallback.
- Sensitive material is protected and absent from telemetry/logs.
- Unit, contract/adapter and selected integration/UI evidence is recorded for
  the slice; physical-device, distribution and acceptance gates are not implied
  unless separately evidenced.
