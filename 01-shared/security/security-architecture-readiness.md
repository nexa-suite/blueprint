---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: security
last-reviewed: 2026-08-23
---

# Security Architecture readiness

Maturity: **BASELINED for PRE-V1 construction**. Product closure confirms Tenant isolation, identity separation, worker scope and authorized/traceable privileged access as business invariants. Production proof remains a gate.

## Evidence available

Current evidence includes global authentication/session mechanisms, role and permission checks, tenant/workspace access context, RLS mechanisms, audit/security tests, provider adapters and worker/background processing. The [AS-IS evidence package](../../04-delivery/as-is/README.md) records the boundaries and gaps.

See the [security architecture TARGET](security-architecture-target.md), [authorization matrix](authorization-matrix.md) and [threat model](threat-model.md). The matrix below remains the AS-IS/TARGET gap register.

## Required separation

| Concern | Current evidence status | TARGET status |
|---|---|---|
| Authentication | AS-IS evidence exists | fail-closed context and re-resolution target |
| Authorization | AS-IS evidence exists | server-side relationship/object/capability checks |
| Tenant isolation | AS-IS mechanisms/evidence exist | application predicates + RLS + worker scope |
| RLS | Migrations/runtime evidence exists | transaction-local scope; complete coverage proof open |
| Security audit | Observed audit surfaces/tests exist | separate append-only protected evidence target |
| Threat modeling | target threats recorded | implementation and penetration proof open |
| Secrets/providers | Local adapters and mocks exist | Production path remains open |

Do not infer final security ownership from current modules, schemas or frontend feature areas.
