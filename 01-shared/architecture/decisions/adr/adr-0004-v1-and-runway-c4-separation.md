---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-29
---

# ADR-0004: Separate V1 architecture views from Architecture Runway

## Status

Accepted.

## Context

Accepted Mobile product direction and V2 evolution must be visible without claiming client implementation or runtime acceptance.

## Decision

V1 views show the currently evidenced Web product and runtime baseline. Runway views show the accepted Mobile projections and V2 evolution, explicitly excluding unimplemented Mobile clients and deferred elements from V1 runtime views.

## Alternatives considered for the baseline

- Put future elements in V1 views: rejected because it would misrepresent scope and implementation status.
- Create separate workspaces for each future: rejected because the accepted requirement is one navigable baseline with explicit V1/Runway views.

## Consequences

Architecture views preserve AS-IS/TARGET/FUTURE separation. The Runway remains an intent boundary, not a delivery commitment.

## What remains open

Runway refinement follows later product and architecture work.

## Revisit trigger

An accepted scope decision changes V1 or runway boundaries.
