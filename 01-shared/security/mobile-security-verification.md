---
status: accepted
maturity: BASELINED
scope: v1
owner: security
last-reviewed: 2026-09-20
---

# Mobile security verification profile

This is an OWASP MASVS-oriented construction profile, not a certification
claim. Verify the selected implementation proportionally for secure storage,
authentication/session handling, authorization boundaries, network transport,
platform interaction, code/build integrity, privacy and resilience.

- Operations uses Android Keystore; Buyer uses a secure platform-storage
  abstraction. Concrete Flutter package choice remains implementation work.
- Tokens, raw push endpoint material, payment data and unnecessary PII are not
  logged, included in analytics or treated as client business authority.
- Missing/revoked Tenant/Workspace context fails closed; cached context cannot
  grant access.
- Permission use, camera input, deep links, external navigation and background
  retry require explicit threat-aware verification and safe fallbacks.
- Device security verification does not accept a Push provider, external
  endpoint storage or a production observability provider.

## Accepted Driver tracking/chat privacy boundary

[Owner closure](../product/owner-decisions-2026-10-01-mobile-operations.md) supersedes blanket no-background/live tracking statements for Driver operational work hours. Verify off-duty stop, current Tenant/Workspace, OS permission-loss detection, responsibility-scoped internal visibility and Buyer own-Delivery visibility ending on terminal/cancelled Delivery. Exact raw-location retention remains OPEN, with no indefinite retention or unrelated reuse. Contextual chat must enforce current relationship/object access and preserve message provenance; it grants no authority to mutate business facts.

Owner clarification 2026-10-01: chat is exclusively Sales ↔ Buyer in an authorized relationship. Driver ↔ Buyer and other chat participant pairs are excluded from this scope.
