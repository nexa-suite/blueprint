---
status: accepted
maturity: BASELINED
scope: v1
owner: engineering
last-reviewed: 2026-09-20
---

# Mobile Definition of Done

A relevant Mobile slice is Done only when applicable evidence includes:

- User Story/Acceptance Criteria traceability, owning Bounded Context and API
  contract identified.
- Accepted architecture boundary respected; no client-owned business authority,
  aggregate clone or separate server database.
- Authenticated Tenant/Workspace or Buyer Relationship handling; API scope is
  reconstructed server-side and revocation fails closed.
- Loading, empty, error, stale, conflict, timeout and unknown-result states.
- Idempotency/revision behavior for critical commands; no silent overwrite.
- Unit, contract/adapter, ViewModel/state and selected integration/UI evidence at
  the required gate; lint and static/architecture checks pass.
- Accessibility baseline and required device-capability fallback, including
  Operations manual identification fallback.
- No raw credentials, tokens or sensitive payload leakage; implementation
  evidence updated.

A build, rendered screen, branch or screenshot alone is not completion.

DoD != Product Acceptance != System Acceptance != Production Readiness.
