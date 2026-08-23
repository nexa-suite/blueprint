---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: governance
last-reviewed: 2026-08-23
---

# Current state

## NEXA BLUEPRINT PRE-V1

| Area | Status |
|---|---|
| Product / Business V1 | CLOSED |
| V1 scope | FROZEN |
| Business rules | CLOSED |
| Ubiquitous language | BASELINED / CLOSED |
| Capability model | BASELINED |
| Strategic DDD | ACCEPTED |
| Bounded Contexts | 11 — FROZEN |
| Context Map | ACCEPTED |
| Data ownership | ACCEPTED for PRE-V1 target; physical schema migration open |
| Core Domain | ACCEPTED |
| State machines | BASELINED |
| Event model | BASELINED |
| Transaction / concurrency | BASELINED |
| Idempotency | BASELINED |
| Business traceability | BASELINED |
| C4 L1/L2 | BASELINED |
| C4 L3 TARGET | BASELINED where useful; technical lens only |
| AS-IS | VERIFIED against accessible current refs; caveats labeled |
| AS-IS / TARGET separation | BASELINED |
| Security / multi-tenancy | BASELINED for construction target; production proof open |
| Technical architecture | CLOSED for PRE-V1 construction target |
| V1 User Stories | COMPLETE |
| Acceptance Criteria | COMPLETE for cataloged stories |
| Story Points | TBD — DELIVERY REFINEMENT |
| Design System relationship | BASELINED; Design Lab remains visual authority |
| Production vendor architecture | OPEN — PRODUCTION GATE |
| PRE-V1 construction gate | PASSED — CONSTRUCTION AUTHORIZED |

## Evidence state

- Legacy archaeology and legacy visual flows remain `HISTORICAL` evidence.
- Modern application repositories remain independent Git roots and read-only evidence for this Blueprint task.
- Current implementation, builds, tests, runtime and browser captures do not prove complete V1 implementation or production readiness.
- Accessible repository refs and exact limitations are recorded in [current-ref verification](../11-reference/as-is/pre-v1-current-ref-verification.md), the [AS-IS implementation audit](../04-architecture/as-is-implementation-audit.md) and [AS-IS evidence](../11-reference/as-is/README.md).

## Open non-blockers

Production provider, cloud and operational parameters remain open: cloud topology, managed PostgreSQL, object storage, email, observability, secret manager, RPO, RTO, backup retention, external SLA/SLO and responder organization. These do not block PRE-V1 documentation closure.
- Construction authorization permits repository-specific target construction planning and vertical slices. It does not mean production readiness, runtime parity or implementation completion.

## Authority

Read [current accepted decisions](current-decisions.md) for canonical semantics. Read [source of truth](source-of-truth.md) for precedence. Do not infer Bounded Contexts from code folders, modules, schemas or screens.
