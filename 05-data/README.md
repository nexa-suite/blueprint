# Data

## Purpose

Separate observed AS-IS persistence evidence from the accepted PRE-V1 TARGET Data Architecture and later physical migration work.

## Authoritative content

- [Data architecture readiness](data-architecture-readiness.md).
- [PRE-V1 data architecture](data-architecture.md) and [transaction/concurrency matrix](transaction-concurrency-matrix.md).
- [AS-IS implementation baseline](../11-reference/as-is/v1-implementation-baseline.md).
- [Architecture readiness gaps](../11-reference/as-is/architecture-readiness-gaps.md).

## Current status

AS-IS database evidence is BASELINED as evidence. PRE-V1 TARGET data ownership, isolation, history and concurrency are ACCEPTED for construction; physical schema evolution, retention and production operations remain gated.

## Expected artifacts

Future conceptual refinements, retention/classification decisions and physical PostgreSQL model remain after accepted domain architecture; data ownership is already baselined for PRE-V1.

## What must not live here

Physical TARGET schemas derived from current PostgreSQL tables, copied database dumps, credentials or claims that current schemas are Bounded Contexts. The accepted logical target does not authorize migrations by itself.

## Related areas

[Domain discovery](../02-domain/README.md), [Security](../06-security/README.md), [Architecture](../04-architecture/README.md), [Operations](../08-operations/README.md).

## Historical evidence

- [Data requirements evidence](data-requirements-evidence.md) — superseded discovery input, retained as reference only.
