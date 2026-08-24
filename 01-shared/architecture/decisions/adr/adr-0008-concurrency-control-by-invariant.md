---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# ADR-0008: Concurrency Control by Invariant

## Status

Accepted for PRE-V1.

## Context

Inventory, credit, terminal lifecycles and delivery outcomes race under real retries and concurrent actors.

## Decision

Use optimistic version/CAS for mutable objects, conditional updates or row locks for scarce resources, deterministic lock order, explicit stale outcomes and durable idempotency. For multi-Warehouse backing, condition every affected SKU + Warehouse authority in deterministic order. Protect last unit, full multi-Warehouse demand, last credit, payment application, Expire-vs-Convert, Cancel-vs-Fulfillment and Deliver-vs-Cancel.

## Consequences

No silent last-write-wins. Each invariant gets the smallest sufficient mechanism and a concurrency test.

## Alternatives

Rejected global serializable transactions and process-local locks as default strategies.

## Evidence

[Transaction matrix](../../../data/transaction-concurrency-matrix.md), [UI State Contract](../../../../02-web/ux/quality/ui-state-contract.md).

## Supersedes / Superseded by

Supersedes implicit last-write-wins. No superseding ADR.
