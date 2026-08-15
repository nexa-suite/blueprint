---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-12
---

# ADR-0002: Global Nexa identity with Tenant-scoped Buyer relationships

## Status

Accepted.

## Context

A human may have independent authorized commercial relationships with multiple Tenants.

## Decision

Use one global Nexa human identity with independent authorized Tenant relationships. Elena may relate to ICISA and Laive; commercial data remains isolated.

## Alternatives considered for the baseline

- One isolated user identity per Tenant: rejected because it duplicates a human identity and weakens cross-Tenant Buyer usability.
- Global identity with no explicit Tenant relationship: rejected because authorization and commercial data require an independent relationship boundary.

## Consequences

Buyer authentication can select an authorized Tenant context without sharing tenant data. The model requires explicit membership/relationship checks and does not grant cross-Tenant visibility.

## What remains open

IAM and data ownership details await Strategic DDD and Data Architecture.

## Revisit trigger

A validated identity or tenancy decision changes the global identity direction.
