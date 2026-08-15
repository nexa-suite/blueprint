---
status: draft
scope: cross-cutting
owner: security
last-reviewed: 2026-08-14
---

# Security Architecture readiness

Maturity: **NOT DEFINED** for TARGET Security Architecture.

## Evidence available

Current evidence includes global authentication/session mechanisms, role and permission checks, tenant/workspace access context, RLS mechanisms, audit/security tests, provider adapters and worker/background processing. The [AS-IS evidence package](../11-reference/as-is/README.md) records the boundaries and gaps.

## Required separation

| Concern | Current evidence status | TARGET status |
|---|---|---|
| Authentication | AS-IS evidence exists | NOT DEFINED |
| Authorization | AS-IS evidence exists | NOT DEFINED |
| Tenant isolation | AS-IS mechanisms/evidence exist | NOT DEFINED |
| RLS | Migrations/runtime evidence exists | NOT DEFINED for complete policy |
| Security audit | Observed audit surfaces/tests exist | NOT DEFINED |
| Threat modeling | No final model claimed | NOT STARTED |
| Secrets/providers | Local adapters and mocks exist | NOT DEFINED for production |

Do not infer final security ownership from current modules, schemas or frontend feature areas.
