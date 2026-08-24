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

Sales Commitment owns persistent, Warehouse-neutral Commercial Commitment and PR-to-SO ownership transfer. Inventory Availability owns physical availability, Inventory Reservation backing, deterministic Warehouse sourcing and Physical Allocation authority. A single demand line may be backed by multiple eligible Warehouses. Fulfillment & Delivery executes allocation work. Commitment is SKU + quantity and selects no Warehouse/Lot.

## Consequences

PR-to-SO conversion has no release/re-reserve gap. Full Inventory Reservation backing is required before authoritative acceptance; failed multi-Warehouse protection cannot leave partial backing. Shortage remains explicit and cannot silently delete commitment or substitute product.

## Alternatives

Rejected treating a database reservation row as the universal business concept or assigning all allocation authority to fulfillment.

## Evidence

[Business ownership matrix](../../../02-domain/ownership/business-ownership-matrix.md), [data architecture](../../data/data-architecture.md).

## Supersedes / Superseded by

Supersedes ambiguous reservation terminology. No superseding ADR.
