---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# ADR-0015: Business Idempotency and Duplicate Suppression

## Status

Accepted for PRE-V1.

## Context

Retries after timeout are normal for commercial, financial, logistics and provider operations.

## Decision

Persist idempotency intention, fingerprint, scope, result and status across restart. Apply to PR submit, change acceptance, conversion, direct order, cancellation, inventory/transfer, fulfillment/POD, payment/report/webhook/application, refund/correction and document issuance.

## Consequences

Same key and fingerprint return original result; different fingerprint conflicts. Consumers additionally use inbox `(consumer,eventId)`.

## Alternatives

Rejected process-local memory and database uniqueness without returning original business result.

## Evidence

[Idempotency matrix](../../data/transaction-concurrency-matrix.md), [event matrix](../../../02-domain/events/published-events.md).

## Supersedes / Superseded by

Supersedes endpoint-only or in-memory duplicate suppression. No superseding ADR.
