---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# ADR-0011: Durable Business Traceability

## Status

Accepted for PRE-V1.

## Context

Users need a durable business timeline, while source contexts must retain authority and Security Audit must protect different evidence.

## Decision

Business Traceability is BC-11: append-only representation of significant source facts with actor, timestamp, reason, before/after, evidence and correlation. It is separate from BC-10 Notifications and Security Audit.

## Consequences

Trace consumers can retry and project timelines without owning source state. Sensitive data is minimized and access is tenant/object scoped.

## Alternatives

Rejected using notification delivery, raw security logs or a generic change feed as the business timeline.

## Evidence

[Ownership matrix](../../../02-domain/ownership/business-ownership-matrix.md), [event architecture](../../../02-domain/events/published-events.md).

## Supersedes / Superseded by

Supersedes combined Notification & Business Traceability proposal. No superseding ADR.
