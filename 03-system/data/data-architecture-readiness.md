---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: data
last-reviewed: 2026-08-23
---

# Data Architecture readiness

PRE-V1 logical data ownership, history, scope and concurrency are accepted for construction. Current PostgreSQL/Flyway/RLS evidence remains AS-IS and may be `CONFORMING`, `DRIFT`, `MISSING` or `UNVERIFIED` relative to the target.

## Closed for PRE-V1 construction

- Shared PostgreSQL topology; logical ownership by strategic BC.
- Commercial Commitment vs Physical Allocation vs Physical Stock distinction.
- Sellable Availability and Credit formulas.
- Immutable commercial/document/trace snapshots.
- Stable identifiers, explicit tenant scope, RLS defense in depth and worker scope.
- Outbox/inbox, idempotency and concurrency requirements in [transaction matrix](transaction-concurrency-matrix.md).

## Production or migration gates

Physical schema evolution, retention, legal hold, deletion/anonymization, backup/restore, residency, query budgets, worker system roles and complete RLS coverage require implementation evidence and Production/Legal Gate approval. Current schemas are not Bounded Contexts.
