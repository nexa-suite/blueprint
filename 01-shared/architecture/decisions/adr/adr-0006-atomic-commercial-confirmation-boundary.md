---
status: accepted
maturity: FROZEN
scope: v1
owner: architecture
last-reviewed: 2026-08-23
---

# ADR-0006: Atomic Commercial Confirmation Boundary

## Status

Accepted for PRE-V1.

## Context

PR submission and direct order require Commercial Commitment, complete Inventory Reservation backing and, where applicable, Credit Reservation. A half-created commercial outcome would oversell, leak protection or strand credit.

## Decision

Commit authoritative validation, full deterministic Inventory Reservation backing, required Commercial Commitment and required Credit Reservation in one logical PostgreSQL transaction. Backing may span eligible Warehouses; Commercial Commitment remains Warehouse-neutral and no Lot is selected. Direct order confirms SO in that same decision. Published events announce the committed fact afterward.

## Consequences

Strong consistency is required at the boundary. Accepted material PR changes use the same protected decision to replace or adjust affected commitment, Inventory Reservation backing and Credit Reservation; failed revalidation leaves prior authoritative state. Provider calls stay outside unnecessarily long transactions; provider/local failure becomes reconciliation state.

## Alternatives

Rejected eventual reservation saga for this invariant; async events cannot create required reservations after acceptance.

## Evidence

[Current accepted decisions](../../../product/current-decisions.md), [transaction matrix](../../../data/transaction-concurrency-matrix.md).

## Supersedes / Superseded by

Supersedes unresolved reservation timing. No superseding ADR.
