---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-09-20
---

# Mobile API client contract

Mobile is an anti-corruption client boundary:

`OpenAPI contract → Remote DTO → remote source/service → repository → client
model/view state → UI`.

Remote DTOs do not become aggregate entities. Repositories translate transport
errors, freshness and retry state into client-safe outcomes while the Nexa API
reconstructs Tenant/Workspace scope and remains business authority.

## Required command behavior

- Retry-sensitive commands carry `Idempotency-Key` where the API contract
  requires it; a locally retained key supports safe retry, not local truth.
- Mutable concurrency-sensitive commands send the accepted `If-Match` or
  revision contract where exposed.
- Problem Details, correlation identifiers, `401`, `403`, safe `404`, `409`
  and `412` must map to explicit user-safe states.
- Network timeout and unknown-result states require status confirmation or safe
  idempotent retry; they must never imply a command succeeded.
- Retryable transport failure and terminal authorization/validation/conflict
  outcomes remain distinct.

The contract does not freeze client HTTP, serialization, local database,
secure-storage or analytics packages.
