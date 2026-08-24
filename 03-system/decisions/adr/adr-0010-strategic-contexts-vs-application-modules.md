---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# ADR-0010: Strategic Contexts vs Application Modules

## Status

Accepted for PRE-V1.

## Context

Current packages, Spring Modulith modules, PostgreSQL schemas and deployable containers are useful technical evidence but do not define strategic domain boundaries.

## Decision

Treat `Bounded Context != Spring Modulith ApplicationModule != Java package != PostgreSQL schema != deployment unit`. Technical modules may co-host contexts during KEEP -> REFINE -> REWORK migration.

## Consequences

No mass rename or module split is implied. Ownership, contracts and tests must be explicit before technical realignment.

## Alternatives

Rejected one-package-per-BC and database-schema-derived DDD.

## Evidence

[Strategic DDD baseline](../../../02-domain/strategic-ddd-baseline.md), [application target](../../architecture/application-architecture-target.md), [C4 model](../../c4/README.md).

## Supersedes / Superseded by

Supersedes module-as-context assumptions. No superseding ADR.
