---
status: draft
maturity: DRAFT
scope: cross-cutting
owner: data
last-reviewed: 2026-08-14
---

# Data Architecture readiness

Maturity: **NOT STARTED** for TARGET Data Architecture.

## What exists

Current PostgreSQL, Flyway, RLS, persistence and object-storage adapter evidence is catalogued in the [AS-IS implementation baseline](../11-reference/as-is/v1-implementation-baseline.md). That evidence is useful input, not a TARGET model.

The [data requirements evidence](data-requirements-evidence.md) records information concerns that future discovery must resolve without assigning ownership or designing a schema.

## What is not defined

- TARGET conceptual model.
- TARGET logical model.
- TARGET physical model.
- Data ownership and stewardship.
- Retention, classification and cross-context data policy.
- Final RLS ownership and worker/system access policy.

## Resolution sequence

Capability Mapping, EventStorming, Domain Storytelling and Strategic DDD must provide domain/ownership input before Data Architecture is baselined. Security Architecture and Cloud/Deployment Architecture provide related constraints.

Current PostgreSQL schemas are not accepted Bounded Contexts.
