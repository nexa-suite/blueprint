# Data

## Purpose

Separate observed AS-IS persistence evidence from the accepted PRE-V1 TARGET Data Architecture and later physical migration work.

## Authoritative content

- [Data architecture readiness](data-architecture-readiness.md).
- [PRE-V1 data architecture](data-architecture.md) and [transaction/concurrency matrix](transaction-concurrency-matrix.md).
- [AS-IS implementation baseline](../../04-delivery/as-is/v1-implementation-baseline.md).
- [Architecture readiness gaps](../../04-delivery/as-is/architecture-readiness-gaps.md).

## Current status

AS-IS database evidence is BASELINED as evidence. PRE-V1 TARGET data ownership, isolation, history and concurrency are ACCEPTED for construction; physical schema evolution, retention and production operations remain gated.

## Expected artifacts

This tactical wave supplies an import-ready logical TARGET model and explicit
AS-IS mapping. Physical PostgreSQL schema evolution, retention/classification
decisions and production rollout remain later gates; data ownership is already
baselined for PRE-V1.

## What must not live here

Physical TARGET schemas derived from current PostgreSQL tables, copied database dumps, credentials or claims that current schemas are Bounded Contexts. The accepted logical target does not authorize migrations by itself.

## Related areas

[Domain discovery](../domain/README.md), [Security](../security/README.md), [Architecture](../architecture/README.md), [Operations](../../04-delivery/README.md).

## Historical evidence

- [Data requirements evidence](data-requirements-evidence.md) — superseded discovery input, retained as reference only.

## Tactical data-model wave

This section is canonical construction evidence for UPC Tactical-Level DDD and
database-design coverage. It models one shared PostgreSQL topology through
eleven logical ownership lenses; it does not create eleven databases or
schema-per-Bounded-Context.

- [Nexa Target PostgreSQL Master Data Model](master-data-model.md)
- [Target relational model SQL](master-target-relational-model.sql)
- [Master database-diagram source and import handoff](master-database-diagram-source.md)
- [AS-IS schema reconstruction evidence](as-is-reconstruction.md)
- [AS-IS to TARGET data mapping](as-is-to-target-mapping.md)
- [Product/data participation matrix](product-data-participation.md)
- [Requirement-to-persistence traceability](tactical-traceability-matrix.md)

Per-Bounded-Context SQL and data dictionaries live with each canonical context
under [bounded contexts](../domain/bounded-contexts/README.md). Mobile local
records remain under [Mobile projection data](../../03-mobile/architecture/data/README.md)
and never enter the PostgreSQL target SQL.
