---
status: reference
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-12
---

# Nexa V1 readiness baseline — 2026-08-12

## Purpose

Preserved reference record of the completed `NEXA — V1 Completion & Production Readiness Mega Audit`. This is verified AS-IS evidence against the accepted V1 baseline. It is not a TARGET architecture document and does not replace accepted Product or Architecture decisions.

Authority remains defined by [Source of truth](../../00-governance/source-of-truth.md) and [Current accepted decisions](../../00-governance/current-decisions.md).

## Exact repository baselines

| Repository | Baseline |
|---|---|
| API | `develop @ 1e2bd205f9dd19f2a7844e0db9ebab9ffd126716` |
| Platform | `develop @ 6548a37f7e98fcfdd00034ea1344f12c67e8ba42` |
| Portal | `develop @ 730c605324f547335733af96a2f654ec8d41b5fa` |
| Website | `develop @ cfd27a60381320a6cdae02051497734caca5fbd3` |

All four active repositories were clean at audit verification. Application repositories remain independent and were not modified by this documentation closure.

## READINESS BASELINE

These values measure readiness against the current accepted V1 baseline. They are not project completion percentages, code completion percentages or release percentages.

| Dimension | Baseline |
|---|---:|
| Functional V1 Completion | **81.4 / 100** |
| Architecture & Engineering Readiness | **73.4 / 100** |
| Production & Operations Readiness | **52.8 / 100** |
| Overall Current V1 Readiness | **71.5 / 100** |
| Confidence | **MEDIUM** |

The score may change after Capability Mapping and domain discovery expose capabilities that are missing, misunderstood or assigned to the wrong boundary. Strategic DDD has not yet been completed.

## Interpretation

Nexa already contains a substantial functional and engineering foundation. The current strategy is not a full rewrite:

```text
KEEP
+
REFINE
+
HARDEN
+
SELECTIVE ARCHITECTURAL REBASELINE
```

Existing code is not automatically TARGET architecture. Existing modules are not automatically future Bounded Contexts.

## Evidence-backed strengths

- Spring Boot modular monolith.
- Spring Modulith and ArchUnit.
- PostgreSQL and Flyway.
- IAM/session security foundation.
- Tenant-aware access context and dynamic authorization foundation.
- Catalog, Purchase Requests, Sales Orders and manual ordering.
- FEFO and inventory reservations.
- Concurrency and idempotency controls.
- Dispatch and proof of delivery foundation.
- Business documents and object-storage abstraction.
- ClamAV and Stripe adapters.
- Runtime/static OpenAPI parity: 223/223 paths.
- OpenTelemetry integration.
- CI and security tooling.
- Strong local Docker runtime.

Evidence pointers: [API build baseline](https://github.com/nexa-suite/api/blob/develop/pom.xml), [canonical local Compose](https://github.com/nexa-suite/api/blob/develop/ops/compose/modern.compose.yml), [Platform dependencies](https://github.com/nexa-suite/platform/blob/develop/package.json), [Portal dependencies](https://github.com/nexa-suite/portal/blob/develop/package.json) and [Website container baseline](https://github.com/nexa-suite/website/blob/develop/Dockerfile).

## ARCHITECTURE GATES

The following remain open and require the next architecture program. Strategic DDD is a mandatory Architecture Gate before major V1 restructuring continues; it is not stated here as a universal prerequisite for every production operation.

- Strategic DDD.
- Subdomain discovery.
- Bounded Context discovery.
- Context Mapping.
- Ubiquitous Language.
- Data ownership.
- IAM target architecture.
- Tenant isolation target.
- Integration architecture.
- Security architecture.
- Cloud/deployment architecture.

## PRODUCTION GATES

- Production deployment architecture.
- Production secrets and key management.
- Backup and restore.
- Disaster recovery.
- Provider staging.
- Production observability.
- SLI/SLO.
- Alerting.
- Rollback.
- Production operations and runbooks.

## Functional gaps

- Website Request Demo/contact backend flow.
- Buyer global/multi-Tenant identity journey.
- Analytics and KPI maturity.
- Production provider journeys.
- Responsive and accessibility closure.

These are recorded as gaps, not implementation tasks.

## C4 and runtime terminology

The accepted C4 model is defined in [Structurizr README](../../04-architecture/c4/structurizr/README.md) and [workspace.dsl](../../04-architecture/c4/structurizr/workspace.dsl).

- PostgreSQL Database = C4 Container and runtime/deployment service.
- Object Storage = C4 Container abstraction.
- MinIO = local runtime implementation of the Object Storage abstraction.
- Docker Container = runtime packaging unit; not automatically a C4 Container.
- Deployment Dependency = service required by a runtime topology.
- External System = system outside Nexa's product boundary.
- External System Test Double = local simulation of an external system, such as WireMock.

PostgreSQL is therefore not classified merely as a deployment dependency.

## Current state boundaries

Accepted V1 decisions, product scope, personas, known rules and C4 L1/L2 remain canonical in:

- [Current accepted decisions](../../00-governance/current-decisions.md).
- [V1 scope](../../01-product/scope/v1-scope.md).
- [Primary personas](../../01-product/personas/primary-personas.md).
- [Known domain rules](../../02-domain/business-rules/known-rules.md).
- [Architecture drivers](../../04-architecture/architecture-drivers/initial-drivers.md).

The next activity is:

```text
Capability Mapping
-> EventStorming
-> Domain Storytelling
-> Strategic DDD
```

No source code, product implementation, architecture redesign, database, Docker configuration, CI workflow, Git ref, commit, push, tag or release was changed for this record.
