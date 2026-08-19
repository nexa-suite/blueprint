# Data

## Purpose

Separate observed AS-IS persistence evidence from future TARGET Data Architecture.

## Authoritative content

- [Data architecture readiness](data-architecture-readiness.md).
- [Proposed data architecture](data-architecture.md) and [transaction/concurrency matrix](transaction-concurrency-matrix.md).
- [AS-IS implementation baseline](../11-reference/as-is/v1-implementation-baseline.md).
- [Architecture readiness gaps](../11-reference/as-is/architecture-readiness-gaps.md).

## Current status

AS-IS database evidence is BASELINED as evidence. TARGET Data Architecture is PROPOSED / REVIEW-GATED; ownership, isolation, history and concurrency remain subject to review.

## Expected artifacts

Future conceptual business model, logical relational model, data ownership matrix, retention/classification decisions and physical PostgreSQL model after domain architecture matures.

## What must not live here

TARGET schemas derived from current PostgreSQL tables, copied database dumps, credentials or claims that current schemas are Bounded Contexts. The proposal does not authorize migrations.

## Related areas

[Domain discovery](../02-domain/README.md), [Security](../06-security/README.md), [Architecture](../04-architecture/README.md), [Operations](../08-operations/README.md).
