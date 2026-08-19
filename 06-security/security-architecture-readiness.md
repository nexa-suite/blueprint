---
status: draft
maturity: DRAFT
scope: cross-cutting
owner: security
last-reviewed: 2026-08-19
---

# Security Architecture readiness

Maturity: **PROPOSED / REVIEW-GATED** for TARGET Security Architecture. Product closure confirms Tenant isolation, identity separation and authorized/traceable support access as business invariants; the proposal remains open for review.

## Evidence available

Current evidence includes global authentication/session mechanisms, role and permission checks, tenant/workspace access context, RLS mechanisms, audit/security tests, provider adapters and worker/background processing. The [AS-IS evidence package](../11-reference/as-is/README.md) records the boundaries and gaps.

See the [security architecture TARGET](security-architecture-target.md), [authorization matrix](authorization-matrix.md) and [threat model](threat-model.md). The matrix below remains the AS-IS/TARGET gap register.

## Required separation

| Concern | Current evidence status | TARGET status |
|---|---|---|
| Authentication | AS-IS evidence exists | Proposed controls; review-gated |
| Authorization | AS-IS evidence exists | Proposed controls; review-gated |
| Tenant isolation | AS-IS mechanisms/evidence exist | Proposed defense in depth; coverage gate |
| RLS | Migrations/runtime evidence exists | Proposed policy inventory; complete coverage open |
| Security audit | Observed audit surfaces/tests exist | Proposed evidence contract |
| Threat modeling | No final model claimed | Proposed threat model; review-gated |
| Secrets/providers | Local adapters and mocks exist | Production path remains open |

Do not infer final security ownership from current modules, schemas or frontend feature areas.
