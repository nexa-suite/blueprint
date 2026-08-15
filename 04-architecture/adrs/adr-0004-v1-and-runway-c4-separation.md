---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-12
---

# ADR-0004: Separate V1 architecture views from Architecture Runway

## Status

Accepted.

## Context

Future Mobile and V2 evolution must be visible without claiming implementation.

## Decision

V1 views show the intended web product. Runway views show planned Mobile and V2 evolution and explicitly exclude those elements from V1 views.

## Alternatives considered for the baseline

- Put future elements in V1 views: rejected because it would misrepresent scope and implementation status.
- Create separate workspaces for each future: rejected because the accepted requirement is one navigable baseline with explicit V1/Runway views.

## Consequences

Architecture views preserve AS-IS/TARGET/FUTURE separation. The Runway remains an intent boundary, not a delivery commitment.

## What remains open

Runway refinement follows later product and architecture work.

## Revisit trigger

An accepted scope decision changes V1 or runway boundaries.
