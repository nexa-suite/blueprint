# Mobile device security

Status: ACCEPTED TARGET BOUNDARY. Shared Security remains canonical. Clients
protect session references and local evidence, minimize PII, clear revoked
scope, fail closed without active Tenant/Workspace context and never log tokens
or payment data. Operations uses an Android Keystore boundary; Buyer uses a
secure platform-storage abstraction.

Attestation, jailbreak/root posture, screenshot policy, encryption settings,
retention and remote wipe remain implementation/acceptance gates. No statement
here proves a client security implementation or Product Acceptance.

## Accepted operational privacy requirements — 2026-10-01

[Owner closure](../../../01-shared/product/owner-decisions-2026-10-01-mobile-operations.md) requires Driver location during operational work hours only, scoped to current Tenant/Workspace. Permission loss is detected, recorded and shown; location-dependent Driver work may be blocked until restored. Stop off-duty collection; revoke unrelated/reassigned/terminal Buyer visibility. Keep operational location separate from Business Traceability, never retain indefinitely or reuse for unrelated purposes. Exact raw retention duration remains OPEN. Sales sharing is voluntary/contextual. Nexa chat avoids implicit personal telephone exposure and preserves attributable business message history.

Owner clarification 2026-10-01: chat is exclusively Sales ↔ Buyer in an authorized relationship. Driver ↔ Buyer and other chat participant pairs are excluded from this scope.
