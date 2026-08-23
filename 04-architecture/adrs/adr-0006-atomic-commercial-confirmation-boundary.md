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

PR submission and direct order require Commercial Commitment and, where applicable, Credit Reservation. A half-created commercial outcome would oversell or strand credit.

## Decision

Commit authoritative validation, required inventory commitment and required credit reservation in one logical PostgreSQL transaction. Direct order confirms SO in that same decision. Published events announce the committed fact afterward.

## Consequences

Strong consistency is required at the boundary. Provider calls stay outside unnecessarily long transactions; provider/local failure becomes reconciliation state.

## Alternatives

Rejected eventual reservation saga for this invariant; async events cannot create required reservations after acceptance.

## Evidence

[Current accepted decisions](../../00-governance/current-decisions.md), [transaction matrix](../../05-data/transaction-concurrency-matrix.md).

## Supersedes / Superseded by

Supersedes unresolved reservation timing. No superseding ADR.
