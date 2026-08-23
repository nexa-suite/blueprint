---
status: accepted
maturity: FROZEN
scope: v1
owner: architecture
last-reviewed: 2026-08-23
---

# ADR-0007: Commercial Commitment and Reservation Ownership

## Status

Accepted for PRE-V1.

## Context

Commercial demand, physical stock and lot selection have different language and lifecycles.

## Decision

Sales Commitment owns persistent Commercial Commitment and PR-to-SO ownership transfer. Inventory Availability owns physical availability and Physical Allocation authority. Fulfillment & Delivery executes allocation work. Commitment is SKU + quantity and selects no Warehouse/Lot.

## Consequences

PR-to-SO conversion has no release/re-reserve gap. Shortage remains explicit and cannot silently delete commitment or substitute product.

## Alternatives

Rejected treating a database reservation row as the universal business concept or assigning all allocation authority to fulfillment.

## Evidence

[Business ownership matrix](../../02-domain/strategic-ddd/business-ownership-matrix.md), [data architecture](../../05-data/data-architecture.md).

## Supersedes / Superseded by

Supersedes ambiguous reservation terminology. No superseding ADR.
