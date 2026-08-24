---
status: accepted
maturity: FROZEN
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# ADR-0014: Time-Driven Purchase Request Expiration

## Status

Accepted for PRE-V1.

## Context

Expiration must remain correct when a scheduler is late or unavailable.

## Decision

Default PR expiry is 72 hours; Tenant policy is 1–7 integer days. Persist UTC absolute `expiresAt: Instant`. At `now >= expiresAt`, conversion fails. A worker materializes `EXPIRED`, releases Commercial Commitment, complete Inventory Reservation backing and applicable Credit Reservation atomically, writes trace/outbox evidence and is idempotent.

## Consequences

Business decisions use the clock; scheduler punctuality affects materialization latency only. Clock and worker fencing tests are mandatory.

## Alternatives

Rejected UI-only expiry, scheduler-only correctness and arbitrary unbounded duration.

## Evidence

[Business rules](../../../domain/business-rules/README.md), [transaction matrix](../../../data/transaction-concurrency-matrix.md).

## Supersedes / Superseded by

Supersedes open numeric expiry proposal. No superseding ADR.
