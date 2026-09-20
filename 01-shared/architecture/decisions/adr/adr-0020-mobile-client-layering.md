---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-09-20
---

# ADR-0020: Mobile Client Layering

## Status

Accepted TARGET.

## Context

Both Mobile clients need a clear dependency model without projecting an
alternate server-side Domain Model into devices.

## Decision

Use Presentation/UI, Application/Use Cases, Data/Repositories, then Data Sources
and Platform Adapters. Dependencies flow inward toward abstractions. Cache stays
inside Data sources, never as a top-level architecture tier.

## Consequences

UI has no direct persistence/HTTP calls. Selective use cases orchestrate client
work, idempotency/freshness and explicit retry outcomes. Repositories mediate
remote/local/device sources. Client models are DTOs, projections, UI models or
staging models; API remains business authority.

## Alternatives

Rejected a cache layer, client-owned business rules and one use-case class per
repository method.

## Evidence

[Mobile application architecture](../../../../03-mobile/architecture/technical/application-architecture.md).

## Supersedes / Superseded by

Supersedes open client layering. No superseding ADR.
