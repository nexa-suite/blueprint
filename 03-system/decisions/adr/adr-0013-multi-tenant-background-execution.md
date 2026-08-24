---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: security
last-reviewed: 2026-08-23
---

# ADR-0013: Multi-Tenant Background Execution

## Status

Accepted for PRE-V1.

## Context

Workers process outbox, expiry, payment, documents and notification work outside request threads. Pooled connections and stale workers can leak or corrupt scope.

## Decision

Workers claim leases, reconstruct explicit SYSTEM Tenant/Workspace context, set transaction-local RLS scope, verify fencing, process idempotently, finalize fenced state and guarantee cleanup/retry/terminal state.

## Consequences

Worker context is durable and auditable. Pool leakage, stale finalization and cross-tenant processing require tests.

## Alternatives

Rejected process-global Tenant context, unsafe pooled session state and unbounded system authority.

## Evidence

[Security target](../../security/security-architecture-target.md), [runtime target](../../reliability/runtime-reliability-target.md).

## Supersedes / Superseded by

Supersedes implicit worker scope. No superseding ADR.
