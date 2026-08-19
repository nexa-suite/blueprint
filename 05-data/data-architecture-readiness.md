---
status: draft
maturity: DRAFT
scope: cross-cutting
owner: data
last-reviewed: 2026-08-19
---

# Data Architecture readiness

Maturity: **PROPOSED / REVIEW-GATED** for TARGET Data Architecture. Closed Product / Business V1 is an input; the proposal does not by itself define accepted ownership or schema.

## What exists

Current PostgreSQL, Flyway, RLS, persistence and object-storage adapter evidence is catalogued in the [AS-IS implementation baseline](../11-reference/as-is/v1-implementation-baseline.md). That evidence is useful input, not a TARGET model.

The [data requirements evidence](data-requirements-evidence.md) records information concerns that future discovery must resolve without assigning ownership or designing a schema.

The proposed [data architecture](data-architecture.md) and [transaction/concurrency matrix](transaction-concurrency-matrix.md) make ownership and invariants explicit for review. They do not authorize migrations.

## What remains open

- Accepted TARGET conceptual model.
- Accepted TARGET logical model.
- Accepted TARGET physical model.
- Approved data ownership and stewardship.
- Retention, classification and cross-context data policy.
- Final RLS ownership and worker/system access policy.

## Resolution sequence

Capability Mapping, EventStorming, Domain Storytelling and Strategic DDD must provide domain/ownership input before Data Architecture is baselined. Security Architecture and Cloud/Deployment Architecture provide related constraints.

Current PostgreSQL schemas are not accepted Bounded Contexts.
