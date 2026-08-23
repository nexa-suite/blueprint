---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# ADR-0012: Domain and Published Event Contracts

## Status

Accepted for PRE-V1.

## Context

Internal facts, cross-context contracts and trace/audit evidence have different consumers and failure semantics.

## Decision

Separate Internal Domain Events, Published Integration Events and Traceability/Audit facts. Publish only with a known consumer. Use outbox in source transaction, inbox/deduplication for at-least-once consumers, aggregate ordering where needed and explicit schema versions.

## Consequences

Events announce committed facts; they do not create atomic reservations. Poison messages, replay and provider side effects require visible operational state.

## Alternatives

Rejected publishing every method, global ordering and exactly-once transport claims.

## Evidence

[Event Contract Matrix](../integration-event-architecture.md), [EventStorming](../../02-domain/strategic-ddd/eventstorming.md).

## Supersedes / Superseded by

Supersedes unbounded event emission and event-created atomic consistency. No superseding ADR.
