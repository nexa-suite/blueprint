---
status: accepted
maturity: FROZEN
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# ADR-0016: Strategic DDD 10-to-11 Bounded Context Acceptance

## Status

Accepted for PRE-V1.

## Context

Discovery proposed 10 contexts by combining Notification and Business Traceability. Their language, ownership, invariants, consumers and failure semantics differ.

## Decision

Accept 11 frozen contexts. BC-10 owns Notification delivery/retry/failure. BC-11 owns append-only Business Traceability. Preserve the old catalog as `SUPERSEDED / HISTORICAL`.

## Consequences

Strategic count is 11. Technical modules may co-host both contexts, but documentation and contracts must keep ownership separate.

## Alternatives

Rejected silently editing history, reopening 10 vs 11 without contradiction, or deriving the count from code folders.

## Evidence

[Bounded Context catalog](../../../02-domain/bounded-contexts/canonical-catalog.md), [decision register](../../../02-domain/ownership/strategic-decision-register.md).

## Supersedes / Superseded by

Supersedes the combined 10-context proposal. No superseding ADR.
