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

Future conceptual refinements, retention/classification decisions and physical PostgreSQL model remain after accepted domain architecture; data ownership is already baselined for PRE-V1.

## Tactical data-model wave

This wave adds an import-ready logical TARGET model and explicit AS-IS mapping.
It describes one shared PostgreSQL topology through eleven ownership lenses;
it does not authorize eleven databases, schema-per-BC deployment or Flyway
migrations.

- [Master TARGET data model](master-data-model.md)
- [Master relational SQL](master-target-relational-model.sql)
- [Database diagram and render handoff](master-database-diagram-source.md)
- [AS-IS reconstruction](as-is-reconstruction.md)
- [AS-IS to TARGET mapping](as-is-to-target-mapping.md)
- [BC x Product participation](product-data-participation.md)
- [Tactical traceability matrix](tactical-traceability-matrix.md)

## What must not live here

Physical TARGET schemas derived from current PostgreSQL tables, copied database dumps, credentials or claims that current schemas are Bounded Contexts. The accepted logical target does not authorize migrations by itself.

## Related areas

[Domain discovery](../domain/README.md), [Security](../security/README.md), [Architecture](../architecture/README.md), [Operations](../../04-delivery/README.md).

## Historical evidence

- [Data requirements evidence](data-requirements-evidence.md) — superseded discovery input, retained as reference only.
