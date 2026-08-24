---
status: accepted
maturity: FROZEN
scope: v1
owner: architecture
last-reviewed: 2026-08-23
---

# ADR-0009: Historical Facts, Reversals and Corrections

## Status

Accepted for PRE-V1.

## Context

Confirmed orders, payments, receivables, PODs and issued documents are business evidence. Silent mutation destroys auditability.

## Decision

Keep original facts immutable. Use explicit cancellation/replacement, POD addendum, Business Document replacement and Financial Adjustment. Current financial obligation is original obligation plus adjustments minus valid payments/refunds.

## Consequences

Correction workflows need links, reasons, actor, time, correlation and reconciliation. Payment history remains even when refund or order correction follows.

## Alternatives

Rejected overwrite, hard delete or pretending an already recorded Payment never happened.

## Evidence

[Business rules](../../../02-domain/business-rules.md), [current decisions](../../../00-start-here/current-decisions.md).

## Supersedes / Superseded by

Supersedes mutable-history proposals. No superseding ADR.
